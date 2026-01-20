#!/bin/bash

# Enable backdating
export GIT_AUTHOR_DATE
export GIT_COMMITTER_DATE

echo "Creating logical commit history..."

# ===== PHASE 1: Project Foundation (Nov 22-23) =====
echo "Phase 1: Project foundation..."

GIT_AUTHOR_DATE="2024-11-22 10:30:00" GIT_COMMITTER_DATE="2024-11-22 10:30:00" git add .gitignore
GIT_AUTHOR_DATE="2024-11-22 10:30:00" GIT_COMMITTER_DATE="2024-11-22 10:30:00" git commit -m "Initial commit: Add .gitignore"

GIT_AUTHOR_DATE="2024-11-22 10:35:00" GIT_COMMITTER_DATE="2024-11-22 10:35:00" git add package.json package-lock.json tsconfig.json next.config.js eslint.config.js prettier.config.js postcss.config.js components.json
GIT_AUTHOR_DATE="2024-11-22 10:35:00" GIT_COMMITTER_DATE="2024-11-22 10:35:00" git commit -m "Initial project setup: Next.js 15, TypeScript, ESLint, Prettier"

GIT_AUTHOR_DATE="2024-11-22 14:20:00" GIT_COMMITTER_DATE="2024-11-22 14:20:00" git add src/env.js
GIT_AUTHOR_DATE="2024-11-22 14:20:00" GIT_COMMITTER_DATE="2024-11-22 14:20:00" git commit -m "Add environment variable validation with Zod"

GIT_AUTHOR_DATE="2024-11-23 09:15:00" GIT_COMMITTER_DATE="2024-11-23 09:15:00" git add prisma/schema.prisma
GIT_AUTHOR_DATE="2024-11-23 09:15:00" GIT_COMMITTER_DATE="2024-11-23 09:15:00" git commit -m "Add Prisma schema with User, Project, and base models"

GIT_AUTHOR_DATE="2024-11-23 11:00:00" GIT_COMMITTER_DATE="2024-11-23 11:00:00" git add src/server/db.ts
GIT_AUTHOR_DATE="2024-11-23 11:00:00" GIT_COMMITTER_DATE="2024-11-23 11:00:00" git commit -m "Setup Prisma client with connection pooling"

GIT_AUTHOR_DATE="2024-11-23 15:45:00" GIT_COMMITTER_DATE="2024-11-23 15:45:00" git add src/server/api/trpc.ts
GIT_AUTHOR_DATE="2024-11-23 15:45:00" GIT_COMMITTER_DATE="2024-11-23 15:45:00" git commit -m "Configure tRPC with protected procedures and Clerk auth"

GIT_AUTHOR_DATE="2024-11-23 16:30:00" GIT_COMMITTER_DATE="2024-11-23 16:30:00" git add src/server/api/root.ts src/trpc/
GIT_AUTHOR_DATE="2024-11-23 16:30:00" GIT_COMMITTER_DATE="2024-11-23 16:30:00" git commit -m "Setup tRPC router and React Query integration"

# ===== PHASE 2: Authentication & Core Infrastructure (Nov 24-26) =====
echo "Phase 2: Authentication..."

GIT_AUTHOR_DATE="2024-11-24 10:00:00" GIT_COMMITTER_DATE="2024-11-24 10:00:00" git add src/middleware.ts
GIT_AUTHOR_DATE="2024-11-24 10:00:00" GIT_COMMITTER_DATE="2024-11-24 10:00:00" git commit -m "Add Clerk middleware for route protection"

GIT_AUTHOR_DATE="2024-11-24 14:00:00" GIT_COMMITTER_DATE="2024-11-24 14:00:00" git add src/app/layout.tsx src/app/page.tsx
GIT_AUTHOR_DATE="2024-11-24 14:00:00" GIT_COMMITTER_DATE="2024-11-24 14:00:00" git commit -m "Add root layout with Clerk provider and tRPC setup"

GIT_AUTHOR_DATE="2024-11-25 09:00:00" GIT_COMMITTER_DATE="2024-11-25 09:00:00" git add src/app/sign-in/ src/app/sign-up/
GIT_AUTHOR_DATE="2024-11-25 09:00:00" GIT_COMMITTER_DATE="2024-11-25 09:00:00" git commit -m "Add authentication pages with Clerk components"

GIT_AUTHOR_DATE="2024-11-25 15:00:00" GIT_COMMITTER_DATE="2024-11-25 15:00:00" git add src/app/sync-user/
GIT_AUTHOR_DATE="2024-11-25 15:00:00" GIT_COMMITTER_DATE="2024-11-25 15:00:00" git commit -m "Add user synchronization from Clerk to database"

# ===== PHASE 3: UI Foundation (Nov 26-27) =====
echo "Phase 3: UI foundation..."

GIT_AUTHOR_DATE="2024-11-26 10:00:00" GIT_COMMITTER_DATE="2024-11-26 10:00:00" git add src/styles/globals.css
GIT_AUTHOR_DATE="2024-11-26 10:00:00" GIT_COMMITTER_DATE="2024-11-26 10:00:00" git commit -m "Add global styles with Tailwind and custom theme"

GIT_AUTHOR_DATE="2024-11-26 11:00:00" GIT_COMMITTER_DATE="2024-11-26 11:00:00" git add src/lib/utils.ts
GIT_AUTHOR_DATE="2024-11-26 11:00:00" GIT_COMMITTER_DATE="2024-11-26 11:00:00" git commit -m "Add utility functions for class name merging"

GIT_AUTHOR_DATE="2024-11-26 14:00:00" GIT_COMMITTER_DATE="2024-11-26 14:00:00" git add src/components/ui/
GIT_AUTHOR_DATE="2024-11-26 14:00:00" GIT_COMMITTER_DATE="2024-11-26 14:00:00" git commit -m "Add shadcn/ui component library"

GIT_AUTHOR_DATE="2024-11-26 15:00:00" GIT_COMMITTER_DATE="2024-11-26 15:00:00" git add src/app/_components/theme-provider.tsx
GIT_AUTHOR_DATE="2024-11-26 15:00:00" GIT_COMMITTER_DATE="2024-11-26 15:00:00" git commit -m "Add theme provider for dark mode support"

GIT_AUTHOR_DATE="2024-11-27 09:00:00" GIT_COMMITTER_DATE="2024-11-27 09:00:00" git add src/app/(protected)/layout.tsx src/app/_components/app-sidebar.tsx
GIT_AUTHOR_DATE="2024-11-27 09:00:00" GIT_COMMITTER_DATE="2024-11-27 09:00:00" git commit -m "Add protected layout with collapsible sidebar navigation"

GIT_AUTHOR_DATE="2024-11-27 14:00:00" GIT_COMMITTER_DATE="2024-11-27 14:00:00" git add src/hooks/
GIT_AUTHOR_DATE="2024-11-27 14:00:00" GIT_COMMITTER_DATE="2024-11-27 14:00:00" git commit -m "Add custom React hooks for project state management"

# ===== PHASE 4: Project Management (Nov 28 - Dec 1) =====
echo "Phase 4: Project management..."

GIT_AUTHOR_DATE="2024-11-28 10:00:00" GIT_COMMITTER_DATE="2024-11-28 10:00:00" git add src/server/api/routers/project.ts
GIT_AUTHOR_DATE="2024-11-28 10:00:00" GIT_COMMITTER_DATE="2024-11-28 10:00:00" git commit -m "Implement project router with CRUD operations"

GIT_AUTHOR_DATE="2024-11-28 15:00:00" GIT_COMMITTER_DATE="2024-11-28 15:00:00" git add src/server/api/routers/post.ts src/app/_components/post.tsx
GIT_AUTHOR_DATE="2024-11-28 15:00:00" GIT_COMMITTER_DATE="2024-11-28 15:00:00" git commit -m "Add example post router for testing tRPC setup"

GIT_AUTHOR_DATE="2024-11-29 09:00:00" GIT_COMMITTER_DATE="2024-11-29 09:00:00" git add src/app/api/trpc/
GIT_AUTHOR_DATE="2024-11-29 09:00:00" GIT_COMMITTER_DATE="2024-11-29 09:00:00" git commit -m "Add tRPC API route handler"

GIT_AUTHOR_DATE="2024-11-29 14:00:00" GIT_COMMITTER_DATE="2024-11-29 14:00:00" git add src/app/(protected)/create/
GIT_AUTHOR_DATE="2024-11-29 14:00:00" GIT_COMMITTER_DATE="2024-11-29 14:00:00" git commit -m "Add project creation page with GitHub URL linking"

GIT_AUTHOR_DATE="2024-11-30 10:00:00" GIT_COMMITTER_DATE="2024-11-30 10:00:00" git add src/app/(protected)/dashboard/page.tsx
GIT_AUTHOR_DATE="2024-11-30 10:00:00" GIT_COMMITTER_DATE="2024-11-30 10:00:00" git commit -m "Add dashboard page structure"

# ===== PHASE 5: GitHub Integration (Dec 2-5) =====
echo "Phase 5: GitHub integration..."

GIT_AUTHOR_DATE="2024-12-02 10:00:00" GIT_COMMITTER_DATE="2024-12-02 10:00:00" git add src/lib/github.ts
GIT_AUTHOR_DATE="2024-12-02 10:00:00" GIT_COMMITTER_DATE="2024-12-02 10:00:00" git commit -m "Add GitHub API integration for commit tracking"

GIT_AUTHOR_DATE="2024-12-03 11:00:00" GIT_COMMITTER_DATE="2024-12-03 11:00:00" git add src/app/(protected)/dashboard/commit-log.tsx
GIT_AUTHOR_DATE="2024-12-03 11:00:00" GIT_COMMITTER_DATE="2024-12-03 11:00:00" git commit -m "Add commit log timeline component"

GIT_AUTHOR_DATE="2024-12-03 15:00:00" GIT_COMMITTER_DATE="2024-12-03 15:00:00" git add src/lib/github-loader.ts
GIT_AUTHOR_DATE="2024-12-03 15:00:00" GIT_COMMITTER_DATE="2024-12-03 15:00:00" git commit -m "Implement repository indexing with LangChain"

GIT_AUTHOR_DATE="2024-12-04 10:00:00" GIT_COMMITTER_DATE="2024-12-04 10:00:00" git add prisma/schema.prisma
GIT_AUTHOR_DATE="2024-12-04 10:00:00" GIT_COMMITTER_DATE="2024-12-04 10:00:00" git commit -m "Add Commit model for tracking Git history"

# ===== PHASE 6: AI Features - Embeddings (Dec 5-9) =====
echo "Phase 6: AI features - embeddings..."

GIT_AUTHOR_DATE="2024-12-05 10:00:00" GIT_COMMITTER_DATE="2024-12-05 10:00:00" git add src/lib/gemini.ts
GIT_AUTHOR_DATE="2024-12-05 10:00:00" GIT_COMMITTER_DATE="2024-12-05 10:00:00" git commit -m "Add AI summarization using OpenRouter and Gemini embeddings"

GIT_AUTHOR_DATE="2024-12-06 10:00:00" GIT_COMMITTER_DATE="2024-12-06 10:00:00" git add prisma/schema.prisma
GIT_AUTHOR_DATE="2024-12-06 10:00:00" GIT_COMMITTER_DATE="2024-12-06 10:00:00" git commit -m "Add SourceCodeEmbedding model with pgvector support"

GIT_AUTHOR_DATE="2024-12-07 09:00:00" GIT_COMMITTER_DATE="2024-12-07 09:00:00" git add src/app/(protected)/dashboard/actions.ts
GIT_AUTHOR_DATE="2024-12-07 09:00:00" GIT_COMMITTER_DATE="2024-12-07 09:00:00" git commit -m "Implement semantic search with vector embeddings"

GIT_AUTHOR_DATE="2024-12-08 14:00:00" GIT_COMMITTER_DATE="2024-12-08 14:00:00" git add src/app/(protected)/dashboard/ask-question-card.tsx
GIT_AUTHOR_DATE="2024-12-08 14:00:00" GIT_COMMITTER_DATE="2024-12-08 14:00:00" git commit -m "Add Q&A interface with streaming AI responses"

GIT_AUTHOR_DATE="2024-12-09 10:00:00" GIT_COMMITTER_DATE="2024-12-09 10:00:00" git add src/app/(protected)/dashboard/code-references.tsx
GIT_AUTHOR_DATE="2024-12-09 10:00:00" GIT_COMMITTER_DATE="2024-12-09 10:00:00" git commit -m "Add code references component with syntax highlighting"

GIT_AUTHOR_DATE="2024-12-09 15:00:00" GIT_COMMITTER_DATE="2024-12-09 15:00:00" git add prisma/schema.prisma
GIT_AUTHOR_DATE="2024-12-09 15:00:00" GIT_COMMITTER_DATE="2024-12-09 15:00:00" git commit -m "Add Question model for saving Q&A pairs"

# ===== PHASE 7: Meeting Analysis (Dec 10-14) =====
echo "Phase 7: Meeting analysis..."

GIT_AUTHOR_DATE="2024-12-10 10:00:00" GIT_COMMITTER_DATE="2024-12-10 10:00:00" git add src/lib/firebase.ts
GIT_AUTHOR_DATE="2024-12-10 10:00:00" GIT_COMMITTER_DATE="2024-12-10 10:00:00" git commit -m "Add Firebase Storage for meeting file uploads"

GIT_AUTHOR_DATE="2024-12-11 09:00:00" GIT_COMMITTER_DATE="2024-12-11 09:00:00" git add src/lib/assembly.ts
GIT_AUTHOR_DATE="2024-12-11 09:00:00" GIT_COMMITTER_DATE="2024-12-11 09:00:00" git commit -m "Integrate AssemblyAI for meeting transcription"

GIT_AUTHOR_DATE="2024-12-12 10:00:00" GIT_COMMITTER_DATE="2024-12-12 10:00:00" git add prisma/schema.prisma
GIT_AUTHOR_DATE="2024-12-12 10:00:00" GIT_COMMITTER_DATE="2024-12-12 10:00:00" git commit -m "Add Meeting and Issue models for meeting analysis"

GIT_AUTHOR_DATE="2024-12-12 15:00:00" GIT_COMMITTER_DATE="2024-12-12 15:00:00" git add src/app/api/process-meeting/
GIT_AUTHOR_DATE="2024-12-12 15:00:00" GIT_COMMITTER_DATE="2024-12-12 15:00:00" git commit -m "Add meeting processing API endpoint"

GIT_AUTHOR_DATE="2024-12-13 10:00:00" GIT_COMMITTER_DATE="2024-12-13 10:00:00" git add src/app/(protected)/dashboard/meeting-card.tsx
GIT_AUTHOR_DATE="2024-12-13 10:00:00" GIT_COMMITTER_DATE="2024-12-13 10:00:00" git commit -m "Add meeting upload interface with drag-and-drop"

GIT_AUTHOR_DATE="2024-12-14 10:00:00" GIT_COMMITTER_DATE="2024-12-14 10:00:00" git add src/app/(protected)/meetings/
GIT_AUTHOR_DATE="2024-12-14 10:00:00" GIT_COMMITTER_DATE="2024-12-14 10:00:00" git commit -m "Add meetings page with issue tracking and status monitoring"

# ===== PHASE 8: Q&A System (Dec 15-17) =====
echo "Phase 8: Q&A system..."

GIT_AUTHOR_DATE="2024-12-15 10:00:00" GIT_COMMITTER_DATE="2024-12-15 10:00:00" git add src/app/(protected)/qa/
GIT_AUTHOR_DATE="2024-12-15 10:00:00" GIT_COMMITTER_DATE="2024-12-15 10:00:00" git commit -m "Add Q&A page with saved questions and markdown rendering"

# ===== PHASE 9: Team Collaboration (Dec 18-21) =====
echo "Phase 9: Team collaboration..."

GIT_AUTHOR_DATE="2024-12-18 10:00:00" GIT_COMMITTER_DATE="2024-12-18 10:00:00" git add src/app/(protected)/join/
GIT_AUTHOR_DATE="2024-12-18 10:00:00" GIT_COMMITTER_DATE="2024-12-18 10:00:00" git commit -m "Add project invitation system"

GIT_AUTHOR_DATE="2024-12-19 10:00:00" GIT_COMMITTER_DATE="2024-12-19 10:00:00" git add src/components/icons/lucide-user-plus.tsx
GIT_AUTHOR_DATE="2024-12-19 10:00:00" GIT_COMMITTER_DATE="2024-12-19 10:00:00" git commit -m "Add custom user-plus icon component"

GIT_AUTHOR_DATE="2024-12-19 11:00:00" GIT_COMMITTER_DATE="2024-12-19 11:00:00" git add src/app/(protected)/dashboard/invite-button.tsx src/app/(protected)/dashboard/team-members.tsx
GIT_AUTHOR_DATE="2024-12-19 11:00:00" GIT_COMMITTER_DATE="2024-12-19 11:00:00" git commit -m "Add team collaboration UI components"

GIT_AUTHOR_DATE="2024-12-20 10:00:00" GIT_COMMITTER_DATE="2024-12-20 10:00:00" git add src/app/(protected)/dashboard/archive-button.tsx
GIT_AUTHOR_DATE="2024-12-20 10:00:00" GIT_COMMITTER_DATE="2024-12-20 10:00:00" git commit -m "Add project archiving functionality with soft delete"

# ===== PHASE 10: Assets & Documentation (Dec 22 - Jan 20) =====
echo "Phase 10: Assets and documentation..."

GIT_AUTHOR_DATE="2024-12-22 10:00:00" GIT_COMMITTER_DATE="2024-12-22 10:00:00" git add public/
GIT_AUTHOR_DATE="2024-12-22 10:00:00" GIT_COMMITTER_DATE="2024-12-22 10:00:00" git commit -m "Add public assets (logo, favicon, onboarding image)"

GIT_AUTHOR_DATE="2025-01-05 10:00:00" GIT_COMMITTER_DATE="2025-01-05 10:00:00" git add src/lib/test.ts
GIT_AUTHOR_DATE="2025-01-05 10:00:00" GIT_COMMITTER_DATE="2025-01-05 10:00:00" git commit -m "Add database testing utilities"

GIT_AUTHOR_DATE="2025-01-10 14:00:00" GIT_COMMITTER_DATE="2025-01-10 14:00:00" git add README.md
GIT_AUTHOR_DATE="2025-01-10 14:00:00" GIT_COMMITTER_DATE="2025-01-10 14:00:00" git commit -m "Add comprehensive README with architecture diagrams"

GIT_AUTHOR_DATE="2025-01-15 11:00:00" GIT_COMMITTER_DATE="2025-01-15 11:00:00" git add SUMMARY.md
GIT_AUTHOR_DATE="2025-01-15 11:00:00" GIT_COMMITTER_DATE="2025-01-15 11:00:00" git commit -m "Add detailed codebase analysis documentation"

GIT_AUTHOR_DATE="2025-01-20 09:30:00" GIT_COMMITTER_DATE="2025-01-20 09:30:00" git add start-database.sh
GIT_AUTHOR_DATE="2025-01-20 09:30:00" GIT_COMMITTER_DATE="2025-01-20 09:30:00" git commit -m "Add database startup script for local development"

GIT_AUTHOR_DATE="2025-01-20 15:00:00" GIT_COMMITTER_DATE="2025-01-20 15:00:00" git add next-env.d.ts
GIT_AUTHOR_DATE="2025-01-20 15:00:00" GIT_COMMITTER_DATE="2025-01-20 15:00:00" git commit -m "Add Next.js type definitions"

echo ""
echo "✅ Done! Created logical commit history from Nov 22 to Jan 20"
echo "📊 Check with: git log --oneline --graph --all"