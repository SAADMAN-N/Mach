import { OpenRouter } from "@openrouter/sdk";
import { GoogleGenAI } from "@google/genai";
import { Document } from "@langchain/core/documents";
import { resolve } from "path";

const genAI = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

const embeddingAI = new GoogleGenAI({});

export const aiSummarizeCommit = async (diff: string) => {
  const response = await genAI.chat.send({
    model: "xiaomi/mimo-v2-flash:free",
    messages: [
      {
        role: "user",
        content: `You are an expert programmer, and you are trying to summarize a git diff.
Reminders about the git diff format:
For every file, there are a few metadata lines, like (for example):
\`\`\`
diff --git a/lib/index.js b/lib/index.js
index aadf691..bfef603 100644
--- a/lib/index.js
+++ b/líb/index.js
\`\`\`
This means that \`lib/index.js\`
was modified in this commit. Note that this is only an example.
Then there is a specifier of the lines that were modified.
A line starting with \`+\` means it was
A line that starting with \`-\` means that line was deleted.
A line that starts with neither \`+\` nor \`-\` is code given for context and better understanding.
It is not part of the diff.
[...]
EXAMPLE SUMMARY COMMENTS:
\`\`\`
* Raised the amount of returned recordings from \`10\` to \`100\` [packages/server/recordings_api.ts], [packages/server/constants.ts]
* Fixed a typo in the github action name [.github/workflows/gpt-commit-summarizer.yml]
* Moved the \`octokit\` initialization to a separate file [src/octokit.ts], [src/index.ts]
* Added an OpenAI API for completions [packages/utils/apis/openai.ts]
* Lowered numeric tolerance for test files
\`\`\`
Most commits will have less comments than this examples list.
The last comment does not include the file names,
because there were more than two relevant files in the hypothetical commit.
Do not include parts of the example in your summary.
It is given only as an example of appropriate comments.
Do not include anything else in your response like "Here is a summary of the git diff:".
You shall only reply with the summary of the commit diffs.

Please summarise the following diff file: \n\n${diff}`,
      },
    ],
    stream: false,
  });

  console.log(
    "\n\nopenrouter_response_for_commit",
    response.choices[0]?.message.content,
  );

  return response.choices[0]?.message.content;
};

export async function summarizeCode(doc: Document) {
  console.log("Getting summary for ", doc.metadata.source);
  try {
    const code = doc.pageContent.slice(0, 10000); //limit to first 10000 characters
    const response = await genAI.chat.send({
      model: "xiaomi/mimo-v2-flash:free",
      messages: [
        {
          role: "user",
          content: `You are an intelligent senior software engineer who specialises in onboarding junior software engineers onto projects.
  You are onboarding a junior software engineer and explaining to them the purpose of the ${doc.metadata.source} file. Here is the code:
  ---
  ${code}
  ---
  Give a summary no more than 100 words of the code above`,
        },
      ],
      stream: false,
      streamOptions: {
        includeUsage: false,
      },
    });
    const summary = response.choices[0]?.message.content;
    console.log(`Summary for ${doc.metadata.source}:`, summary || "EMPTY");
    return summary;
  } catch (error) {
    console.error(`❗️ Error summarizing ${doc.metadata.source}:`, error);
    return "";
  }
}

export async function generateEmbedding(summary: string) {
  const response = await embeddingAI.models.embedContent({
    model: "gemini-embedding-001",
    contents: summary,
    config: {
      outputDimensionality: 768,
    },
  });

  const embedding = response.embeddings;
  return embedding;
}
