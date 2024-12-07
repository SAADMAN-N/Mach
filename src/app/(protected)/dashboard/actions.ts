"use server";
import { OpenRouter } from "@openrouter/sdk";
import { createStreamableValue } from "@ai-sdk/rsc";
import { generateEmbedding } from "@/lib/gemini";
import { db } from "@/server/db";

const mimo = new OpenRouter({
  apiKey: process.env.OPENROUTER_API_KEY,
});

export async function askQuestions(question: string, projectId: string) {
  const stream = createStreamableValue();

  const queryVector = await generateEmbedding(question);
  const vectorQuery = Array.isArray(queryVector)
    ? queryVector[0]?.values
    : queryVector?.values;

  const result = (await db.$queryRaw`
    SELECT "fileName", "sourceCode", "summary",
     1 - ("summaryEmbedding" <=> ${vectorQuery}::vector) AS similarity
     FROM "SourceCodeEmbedding"
     WHERE 1 - ("summaryEmbedding" <=> ${vectorQuery}::vector) > 0.5
     AND "projectId" = ${projectId}
     ORDER BY similarity DESC
     LIMIT 10
  `) as { fileName: string; sourceCode: string; summary: string }[];

  console.log("Result: ", result);
  let context = "";
  for (const doc of result) {
    context += `source: ${doc.fileName}\n code content:${doc.sourceCode} \n summary of file: ${doc.summary}\n\n`;
  }
  console.log("Context", context);

  (async () => {
    try {
      const streamResponse = await mimo.chat.send({
        model: "xiaomi/mimo-v2-flash:free",
        messages: [
          {
            role: "user",
            content: `You are a ai code assistant who answers questions about the codebase. 
        You are answering questions for a technical intern. 
        You are an expert knowledge, helpfulness, cleverness, and articulateness. 
        You are well-behaved and well-mannered. You are friendly, kind, and inspiring. 
        You have the sum of all knowledge. 
        If a question is about code or a file, you should provide the detailed answer, giving step by step instructions.
        If it is a general or a very specific question e.g. "What llm models does this project support?", then answer can be detailed but to the point and not very very lengthy. 
        Try your best to not make the answer extremely lengthy.
    START CONTEXT BLOCK
    ${context}
    END OF CONTEXT BLOCK
    
    START QUESTION
    ${question}
    END OF QUESTION
    
    AI assistant will take into account any CONTEXT BLOCK that is provided in a conversation. 
    If the context does not provide the answer to question, the AI assistant will say, "I'm sorry, but I don't know the answer." 
    AI assistant will not apologize for previous responses, but instead will indicated new information was gained. 
    AI assistant will not invent anything that is not drawn directly from the context. 
    Answer in markdown syntax, with code snippets if needed. 
    Be as detailed as possible when answering, make sure there is no hallucination.`,
          },
        ],
        stream: true,
        streamOptions: {
          includeUsage: false,
        },
      });

      let fullResponse = "";

      for await (const chunk of streamResponse) {
        const content = chunk.choices[0]?.delta?.content;
        if (content) {
          fullResponse += content;
          stream.update(fullResponse);
          process.stdout.write(fullResponse);
        }
      }
      stream.done();
    } catch (error) {
      console.log("Streaming error", error);
      stream.update("Error! Failed to get a response from the AI. :(");
      stream.done();
    }
  })();
  return {
    output: stream.value,
    fileReferences: result,
  };
}
