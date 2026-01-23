# Mach - Resume Project Section

## Finalized Version

**Mach** | Next.js, React, tRPC, PostgreSQL, Prisma, TypeScript, LangChain, Tailwind | Nov. 2025 – Jan. 2026

• Architected a full-stack AI-powered codebase intelligence platform using Next.js 15 and tRPC, enabling semantic code search through 768-dimensional vector embeddings for natural language queries across complex repositories
• Engineered scalable vector similarity search using PostgreSQL pgvector and Google Gemini embeddings, retrieving top 10 code files via cosine distance algorithms for context-aware AI responses
• Developed automated GitHub repository indexing using LangChain to process entire codebases, generating AI-powered file summaries and storing embeddings for real-time semantic search
• Built meeting analysis system integrating AssemblyAI auto-chapters API to transcribe recordings and extract structured insights, categorizing discussions into time-coded issue summaries

---

## LaTeX Formatted Version


\resumeProjectHeading
          {\textbf{Mach} $|$ \emph{Next.js, React, tRPC, PostgreSQL, Prisma, TypeScript, LangChain, Tailwind}}{Nov. 2025 -- Jan. 2026}
          \resumeItemListStart
            \resumeItem{Architected a full-stack AI-powered codebase intelligence platform using \textbf{Next.js 15} and \textbf{tRPC}, enabling semantic code search through \textbf{768-dimensional vector embeddings} for natural language queries across complex repositories}
            \resumeItem{Engineered scalable \textbf{vector similarity search} using \textbf{PostgreSQL pgvector} and \textbf{Google Gemini embeddings}, retrieving top \textbf{10 code files} via \textbf{cosine distance} algorithms for context-aware AI responses}
            \resumeItem{Developed automated \textbf{GitHub repository indexing} using \textbf{LangChain} to process entire codebases, generating AI-powered file summaries and storing embeddings for real-time semantic search}
            \resumeItem{Built meeting analysis system integrating \textbf{AssemblyAI auto-chapters API} to transcribe recordings and extract structured insights, categorizing discussions into time-coded issue summaries}
          \resumeItemListEnd

---

## Should You Mention "RAG"?

### Short Answer: **Not necessary, but could be valuable**

### Analysis:

**Arguments FOR mentioning RAG:**
- It's a highly sought-after keyword in AI/ML roles
- Shows you understand the architecture pattern, not just implementation
- ATS systems will pick it up
- Technical recruiters/hiring managers recognize it as advanced knowledge

**Arguments AGAINST mentioning RAG:**
- Your bullets already describe RAG concepts (vector embeddings, semantic search, context retrieval)
- Non-technical recruiters might not know what it means
- Space is limited - every word counts
- You're already demonstrating RAG knowledge through the description

### Recommendation:

**Option 1: Keep as-is (Recommended)**
Your current version is strong. You're describing RAG without using the term, which shows understanding without jargon. This works well for both technical and non-technical readers.

**Option 2: Add RAG subtly (If you want the keyword)**
If you want to include "RAG" for ATS/keyword purposes, you could modify the first bullet:

```
• Architected a full-stack AI-powered codebase intelligence platform using Next.js 15 and tRPC, implementing RAG (Retrieval Augmented Generation) architecture with 768-dimensional vector embeddings for semantic code search and natural language queries across complex repositories
```

**Option 3: Add to tech stack (Minimal impact)**
You could add it to the tech stack header, but it's less impactful there:
```
Mach | Next.js, React, tRPC, PostgreSQL, Prisma, TypeScript, LangChain, Tailwind, RAG | Nov. 2025 – Jan. 2026
```

### My Take:

**Keep it as-is.** Your description already demonstrates RAG knowledge:
- "vector embeddings" = retrieval component
- "semantic code search" = retrieval mechanism  
- "natural language queries" = generation component
- "context-aware AI responses" = augmented generation

You're showing you understand RAG without needing to name it. This is actually better because:
1. It's more accessible to all readers
2. You're demonstrating understanding, not just keyword matching
3. Technical interviewers will recognize this as RAG from your description
4. You save space for other impactful details

If you're applying to very AI/ML-focused roles, you could add it, but for general software engineering positions, your current version is perfect.

---

## Key Strengths of Your Finalized Version:

1. **Concise tech stack** - Only essential technologies listed
2. **Strong action verbs** - Architected, Engineered, Developed, Built
3. **Specific metrics** - 768 dimensions, top 10 files, cosine distance
4. **Clear value proposition** - Each bullet shows what you built and why it matters
5. **No redundancy** - Each bullet covers a distinct aspect
6. **ATS-friendly** - Contains relevant keywords (vector embeddings, pgvector, semantic search, etc.)

---

## Interview Talking Points (Based on Your Finalized Version):

When asked about this project, you can discuss:

**RAG Architecture:**
- "I implemented a RAG system where I retrieve relevant code files using vector similarity search, then augment the LLM's context with those files to generate accurate answers about the codebase."

**Vector Search:**
- "I used 768-dimensional embeddings from Google Gemini, stored in PostgreSQL with pgvector extension, and used cosine distance to find semantically similar code files."

**Why tRPC:**
- "I chose tRPC for end-to-end type safety - it eliminated the need to write separate API routes and ensured type safety from database to frontend."

**Scalability:**
- "The system processes entire repositories in parallel, generating embeddings and summaries for each file, enabling real-time semantic search across large codebases."
