# Mach - Resume Project Section

## Recommended Project Entry

**Mach** | Next.js 15, React 19, tRPC, Prisma, PostgreSQL, pgvector, Clerk Auth, OpenRouter API, AssemblyAI, Firebase, TypeScript, Tailwind CSS | [Date Range]

- Architected a full-stack AI-powered codebase intelligence platform using Next.js 15 App Router and tRPC to enable semantic code search through 768-dimensional vector embeddings, reducing codebase onboarding time by enabling developers to query complex repositories in natural language
- Engineered a scalable vector similarity search system using PostgreSQL's pgvector extension and Google Gemini embeddings, implementing cosine distance algorithms to retrieve top 10 most relevant code files with 0.5 similarity threshold for context-aware AI responses
- Developed an automated GitHub repository indexing pipeline using LangChain's recursive document loader to process entire codebases, generating AI-powered summaries for each file and storing embeddings for real-time semantic search capabilities
- Built a real-time meeting analysis system integrating AssemblyAI's auto-chapters API to transcribe audio recordings and extract actionable insights, automatically categorizing meeting discussions into structured issues with time-coded summaries
- Implemented an intelligent commit tracking system that fetches Git diffs via GitHub API and uses OpenRouter's LLM models to generate concise, bullet-point summaries of code changes, enabling teams to understand project evolution at a glance
- Designed a type-safe, end-to-end API architecture using tRPC with 11 protected procedures and React Query integration, ensuring type safety from database to frontend while eliminating API route boilerplate
- Created a collaborative project management system with team invitation workflows, soft-delete archiving, and multi-user project access, enabling seamless codebase collaboration across development teams

---

## LaTeX Formatted Version (Condensed for 1-Page Resume)

\resumeProjectHeading
          {\textbf{Mach - AI Codebase Intelligence} $|$ \emph{Next.js 15, React 19, tRPC, Prisma, PostgreSQL, pgvector, Clerk Auth, OpenRouter API, AssemblyAI, Firebase, TypeScript, Tailwind CSS}}{[Date Range]}
          \resumeItemListStart
            \resumeItem{Architected a full-stack AI-powered codebase intelligence platform using \textbf{Next.js 15} and \textbf{tRPC}, enabling semantic code search through \textbf{768-dimensional vector embeddings} for natural language queries across complex repositories}
            \resumeItem{Engineered scalable \textbf{vector similarity search} using \textbf{PostgreSQL pgvector} and \textbf{Google Gemini embeddings}, retrieving top \textbf{10 code files} via \textbf{cosine distance} algorithms for context-aware AI responses}
            \resumeItem{Developed automated \textbf{GitHub repository indexing} using \textbf{LangChain} to process entire codebases, generating AI-powered file summaries and storing embeddings for real-time semantic search}
            \resumeItem{Built meeting analysis system integrating \textbf{AssemblyAI auto-chapters API} to transcribe recordings and extract structured insights, categorizing discussions into time-coded issue summaries}
          \resumeItemListEnd

---

## Ultra-Condensed Version (3 Bullets - Use if Space is Very Limited)

\resumeProjectHeading
          {\textbf{Mach - AI Codebase Intelligence} $|$ \emph{Next.js 15, React 19, tRPC, Prisma, PostgreSQL, pgvector, Clerk Auth, OpenRouter API, AssemblyAI, Firebase, TypeScript, Tailwind CSS}}{[Date Range]}
          \resumeItemListStart
            \resumeItem{Architected a full-stack AI-powered codebase intelligence platform using \textbf{Next.js 15} and \textbf{tRPC}, implementing semantic code search through \textbf{768-dimensional vector embeddings} with \textbf{PostgreSQL pgvector} to enable natural language queries across complex repositories}
            \resumeItem{Engineered scalable \textbf{vector similarity search} using \textbf{Google Gemini embeddings} and \textbf{cosine distance algorithms}, retrieving top \textbf{10 code files} for context-aware AI responses, plus automated \textbf{GitHub repository indexing} via \textbf{LangChain}}
            \resumeItem{Built meeting analysis system integrating \textbf{AssemblyAI auto-chapters API} for transcription and structured insight extraction, and implemented type-safe API architecture with \textbf{11 protected tRPC procedures} using \textbf{React Query} integration}
          \resumeItemListEnd

---

## Key Technical Highlights to Mention in Interviews

### Vector Search & AI Integration
- **pgvector** with 768-dimensional embeddings (Gemini embedding-001)
- Cosine similarity search: `1 - (embedding <=> query) > 0.5`
- Top-K retrieval (K=10) for context building
- Streaming AI responses using OpenRouter SDK

### Architecture Patterns
- **tRPC** for end-to-end type safety (no API route definitions needed)
- **Server Components** by default, Client Components only when needed
- **React Query** for server state management
- **Protected procedures** with Clerk authentication middleware

### Scalability Features
- Parallel processing with `Promise.allSettled` for error resilience
- Recursive repository indexing with configurable concurrency (max 5)
- Soft deletes for data retention
- Background job processing for meeting transcription

### Code Quality
- TypeScript strict mode with `noUncheckedIndexedAccess`
- Zod validation for runtime type safety
- Custom React hooks (`useProject`, `useRefetch`, `useIsMobile`)
- Comprehensive error handling and graceful degradation

---

## Formatting Notes

- Match the exact format of your other projects (tech stack in header, date range)
- Use strong action verbs: Architected, Engineered, Developed, Built, Implemented, Designed, Created
- Include specific technologies and numbers where possible (768 dimensions, top 10 files, 0.5 threshold)
- Focus on technical depth and problem-solving, not just features
- Quantify impact when possible (e.g., "reducing onboarding time")

---

## References for Best Practices

Based on industry standards for computer science resume project sections:
- **Action-Context-Result Framework**: Start with action verb, describe technical context, state impact
- **Technical Depth**: Mention specific patterns (vector embeddings, cosine similarity, pgvector)
- **Quantification**: Include metrics (768 dimensions, top 10 files, similarity thresholds)
- **Problem-Solving Focus**: Explain *why* technologies were chosen (type safety, scalability, performance)
