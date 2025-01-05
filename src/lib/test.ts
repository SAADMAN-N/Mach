import { db } from "@/server/db";

// Check total records
const total = await db.sourceCodeEmbedding.count();
console.log("Total records:", total);

// Check records with embeddings
const withEmbeddings = await db.$queryRaw<Array<{ count: bigint }>>`
  SELECT COUNT(*) as count
  FROM "SourceCodeEmbedding"
  WHERE "summaryEmbedding" IS NOT NULL
`;
console.log("Records with embeddings:", Number(withEmbeddings[0]?.count || 0));

// Check records without embeddings
const withoutEmbeddings = await db.$queryRaw<Array<{ count: bigint }>>`
  SELECT COUNT(*) as count
  FROM "SourceCodeEmbedding"
  WHERE "summaryEmbedding" IS NULL
`;
console.log(
  "Records without embeddings:",
  Number(withoutEmbeddings[0]?.count || 0),
);

// Get sample records
const samples = await db.sourceCodeEmbedding.findMany({
  take: 5,
  select: {
    fileName: true,
    id: true,
  },
});
console.log("Sample files:", samples);
