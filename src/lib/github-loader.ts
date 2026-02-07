import { GithubRepoLoader } from "@langchain/community/document_loaders/web/github";
import { Document } from "@langchain/core/documents";
import { summarizeCode } from "./gemini";
import { ClerkFailed } from "@clerk/nextjs";
import { db } from "@/server/db";
import { generateEmbedding } from "./gemini";
import { Octokit } from "octokit";

export const loadGithubRepo = async (
  githubUrl: string,
  githubToken?: string,
) => {
  const token = githubToken || process.env.GITHUB_TOKEN || "";
  const loader = new GithubRepoLoader(githubUrl, {
    accessToken: token,
    branch: "main",
    ignoreFiles: [
      "package-lock.json",
      "yarn.lock",
      "pnpm-lock.yaml",
      "bun.lockb",
    ],
    recursive: true,
    unknown: "warn",
    maxConcurrency: 5,
  });
  const docs = await loader.load();
  return docs;
};

export const indexGithubRepo = async (
  projectId: string,
  githubUrl: string,
  githubToken?: string,
) => {
  const docs = await loadGithubRepo(githubUrl, githubToken);
  const allEmbeddings = await generateEmbeddings(docs);
  await Promise.allSettled(
    allEmbeddings.map(async (embedding, index) => {
      console.log(`Processing ${index} of ${allEmbeddings.length}`);
      if (!embedding) return;

      const sourceCodeEmbedding = await db.sourceCodeEmbedding.create({
        data: {
          summary: embedding.summary,
          sourceCode: embedding.sourceCode,
          fileName: embedding.fileName,
          projectId,
        },
      });
      console.log("This is the embedding: ", embedding.embedding);
      const embeddingValues = Array.isArray(embedding.embedding)
        ? embedding.embedding[0]?.values
        : embedding.embedding?.values;
      await db.$executeRaw`
      UPDATE "SourceCodeEmbedding" 
      SET "summaryEmbedding" = ${embeddingValues}::vector 
      WHERE "id" = ${sourceCodeEmbedding.id}`;
      console.log("Embedding saved for: ", sourceCodeEmbedding.id);
    }),
  );
};

const generateEmbeddings = async (docs: Document[]) => {
  return await Promise.all(
    docs.map(async (doc) => {
      const summary = await summarizeCode(doc);

      // Skip if summary is empty (summarization failed)
      if (!summary || summary.trim().length === 0) {
        console.warn(`Skipping ${doc.metadata.source} - empty summary`);
        return null;
      }

      try {
        const embedding = await generateEmbedding(summary);
        return {
          summary,
          embedding,
          sourceCode: JSON.parse(JSON.stringify(doc.pageContent)),
          fileName: doc.metadata.source,
        };
      } catch (error) {
        console.error(
          `Failed to generate embedding for ${doc.metadata.source}:`,
          error,
        );
        return null;
      }
    }),
  );
};

const getFileCount = async (path: string, octokit: Octokit, githubOwner: string, githubRepo: string, acc: number = 0) => {
  const { data } = await octokit.rest.repos.getContent({
    owner: githubOwner,
    repo: githubRepo,
    path
  })

  if (!Array.isArray(data) && data.type === 'file') {
    return acc + 1
  }

  if (Array.isArray(data)) {
    let fileCount = 0
    const directories: string[] = []
    for (const item of data) {
      if (item.type === 'dir') {
        directories.push(item.path)
      } else {
        fileCount++
      }
    }

    if (directories.length > 0) {
      const directoryCounts = await Promise.all(
        directories.map(dirPath => getFileCount(dirPath, octokit, githubOwner, githubRepo, 0))
      )
      fileCount += directoryCounts.reduce((acc, count) => acc + count, 0)
    }
    return acc + fileCount
  }
  return acc
}

export const checkCredits = async (githubUrl: string, githubToken?: string) => {
  const token = githubToken || process.env.GITHUB_TOKEN;
  const octokit = new Octokit({ auth: token })
  const githubOwner = githubUrl.split('/')[3]
  const githubRepo = githubUrl.split('/')[4]
  if (!githubOwner || !githubRepo) { return 0 }
  const fileCount = await getFileCount('', octokit, githubOwner, githubRepo, 0)
  return fileCount
}