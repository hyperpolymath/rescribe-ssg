;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — rescribe-ssg

(define-module (rescribe-ssg meta)
  #:export (architecture-decisions development-practices design-rationale
            language-rules component-registry build-system))

;; ============================================================================
;; Language Rules (ABSOLUTE - NO EXCEPTIONS)
;; ============================================================================

(define language-rules
  '((mandatory-language . "ReScript")
    (file-extension . ".res")
    (enforcement-level . "absolute")
    (rationale . "Each SSG satellite is the DEFINITIVE implementation for its language. rescribe-ssg IS the ReScript SSG.")
    (violations
     ("Python implementation" . "FORBIDDEN")
     ("JavaScript/TypeScript" . "FORBIDDEN - Only compiled .mjs output allowed")
     ("Any non-ReScript language" . "FORBIDDEN - defeats the purpose of this satellite"))
    (correct-implementation
     (engine . "src/Rescribe.res")
     (mcp-adapter . "adapters/src/RescribeAdapter.res")
     (build-output . "*.mjs files are compiled artifacts only"))))

;; ============================================================================
;; Architecture Decision Records
;; ============================================================================

(define architecture-decisions
  '((adr-001
     (title . "ReScript-Only Implementation")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "SSG satellites must be in their target language")
     (decision . "rescribe-ssg is written entirely in ReScript")
     (consequences . ("Type-safe development" "JavaScript interop" "Fast compilation")))

    (adr-002
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Part of hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers")))

    (adr-003
     (title . "MCP Hub Integration")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Part of poly-ssg satellite constellation")
     (decision . "Connect to poly-ssg-mcp hub via ReScript MCP adapter")
     (consequences . ("Unified SSG interface" "Tool discovery" "Cross-language interop")))

    (adr-004
     (title . "Mill-Based Build Synthesis")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "Consistent build system across satellites")
     (decision . "Use Justfile + Mustfile for build orchestration")
     (consequences . ("Reproducible builds" "CLI composability" "Recipe inheritance")))

    (adr-005
     (title . "Accessibility-First Design")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "Inclusive web content generation")
     (decision . "Support BSL/GSL/ASL/Makaton metadata in generated sites")
     (consequences . ("Sign language accessibility" "Schema-driven a11y" "Inclusive output")))))

;; ============================================================================
;; Component Registry (44/44 Target)
;; ============================================================================

(define component-registry
  '((core-engine
     ((rescript-engine (location . "src/Rescribe.res") (status . "complete"))
      (build-synthesis (location . "src/Build.res") (status . "pending"))
      (template-engine (location . "src/Rescribe.res:applyTemplate") (status . "complete"))
      (variable-store (location . "src/Rescribe.res:frontmatter") (status . "complete"))))

    (build-system
     ((justfile (location . "Justfile") (status . "complete"))
      (mustfile (location . "Mustfile") (status . "complete"))
      (containerfile (location . "Containerfile") (status . "complete"))
      (tool-versions (location . ".tool-versions") (status . "complete"))))

    (site-generation
     ((content-processing (location . "src/Rescribe.res:parseFrontmatter") (status . "complete"))
      (template-engine (location . "src/Rescribe.res:applyTemplate") (status . "complete"))
      (output-generation (location . "src/Build.res") (status . "pending"))
      (content-schema (location . "src/Types.res") (status . "pending"))))

    (adapters
     ((mcp-server (location . "adapters/src/RescribeAdapter.res") (status . "complete"))
      (rescript-adapter (location . "adapters/") (status . "complete"))
      (deno-runtime (location . "adapters/") (status . "n/a - pure ReScript"))))

    (accessibility
     ((bsl-metadata (location . "a11y/bsl-schema.json") (status . "complete"))
      (gsl-metadata (location . "a11y/gsl-schema.json") (status . "complete"))
      (asl-metadata (location . "a11y/asl-schema.json") (status . "complete"))
      (makaton-metadata (location . "a11y/makaton-schema.json") (status . "complete"))
      (a11y-schema (location . "a11y/schema.json") (status . "complete"))))

    (testing
     ((unit-tests (location . "tests/") (status . "pending"))
      (e2e-tests (location . "tests/e2e/") (status . "pending"))
      (verification (location . "src/Rescribe.res:test*") (status . "partial"))
      (ci-pipeline (location . ".github/workflows/ci.yml") (status . "complete"))))

    (documentation
     ((readme (location . "README.adoc") (status . "complete"))
      (specification (location . "docs/SPECIFICATION.adoc") (status . "pending"))
      (handover (location . "HANDOVER.adoc") (status . "pending"))
      (user-guide (location . "docs/USER-GUIDE.adoc") (status . "pending"))
      (module-readmes (location . "*/README.md") (status . "partial"))
      (cookbook (location . "cookbook.adoc") (status . "complete"))
      (contributing (location . "CONTRIBUTING.md") (status . "complete"))
      (security (location . "SECURITY.md") (status . "complete"))))

    (configuration
     ((site-schema (location . "src/Types.res") (status . "pending"))
      (example-config (location . "rescribe.config.json") (status . "complete"))
      (env-handling (location . "src/Env.res") (status . "pending"))))

    (language-tooling
     ((lexer (location . "n/a - uses ReScript") (status . "n/a"))
      (parser (location . "src/Rescribe.res:parse*") (status . "complete"))
      (interpreter (location . "n/a - compiles to JS") (status . "n/a"))
      (compiler (location . "rescript CLI") (status . "complete"))
      (syntax-highlighting (location . "editors/") (status . "pending"))
      (lsp (location . "rescript-vscode") (status . "external"))))

    (examples
     ((example-content (location . "examples/content/") (status . "complete"))
      (example-templates (location . "examples/templates/") (status . "complete"))
      (example-config (location . "examples/rescribe.config.json") (status . "complete"))))))

;; ============================================================================
;; Build System Configuration
;; ============================================================================

(define build-system
  '((primary . "just")
    (secondary . "must")
    (container . "podman")
    (version-manager . "asdf")
    (recipes
     ((build . "Compile ReScript to JavaScript")
      (test . "Run unit tests")
      (test-e2e . "Run end-to-end tests")
      (lint . "Run ReScript format check")
      (clean . "Remove build artifacts")
      (dev . "Watch mode development")
      (generate . "Generate static site")
      (serve . "Local development server")))))

;; ============================================================================
;; Development Practices
;; ============================================================================

(define development-practices
  '((code-style
     (languages . ("ReScript"))
     (formatter . "rescript format")
     (linter . "rescript"))
    (security
     (sast . "CodeQL for compiled JavaScript")
     (credentials . "env vars only")
     (actions . "SHA-pinned"))
    (versioning
     (scheme . "SemVer 2.0.0")
     (changelog . "Keep a Changelog"))
    (commits
     (style . "Conventional Commits")
     (signing . "recommended"))))

;; ============================================================================
;; Design Rationale
;; ============================================================================

(define design-rationale
  '((why-rescript
     "ReScript provides type-safe development with JavaScript output.
      This is THE ReScript SSG - no other language is acceptable.
      Type safety catches errors at compile time.
      JavaScript output ensures web compatibility.")
    (why-mill-synthesis
     "Justfile + Mustfile provide consistent build orchestration.
      Recipes are composable and inheritable.
      CLI tools integrate seamlessly.")
    (why-accessibility
     "Web content must be accessible to all users.
      Sign language metadata enables inclusive experiences.
      Schema-driven approach ensures consistency.")))
