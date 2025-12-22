;;; STATE.scm — rescribe-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (rescribe-ssg state)
  #:export (metadata language-enforcement current-position blockers-and-issues
            critical-next-actions component-status state-summary))

;; ============================================================================
;; Project Metadata
;; ============================================================================

(define metadata
  '((version . "1.1.0")
    (updated . "2025-12-22")
    (project . "rescribe-ssg")
    (required-language . "ReScript")
    (target-components . 44)
    (license . "AGPL-3.0-or-later")))

;; ============================================================================
;; Language Enforcement (STRICT)
;; ============================================================================

(define language-enforcement
  '((primary-language . "ReScript")
    (file-extension . ".res")
    (interpreter . "rescript")
    (forbidden-languages . ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Rust"))
    (rationale . "rescribe-ssg is the DEFINITIVE ReScript static site generator. It MUST be written entirely in ReScript. No other implementation languages are permitted.")
    (enforcement . "strict")
    (ci-verification . ".github/workflows/ci.yml")))

;; ============================================================================
;; Component Status (44 Components)
;; ============================================================================

(define component-status
  '((core-engine
     ((rescript-engine . complete)
      (build-synthesis . pending)
      (template-engine . complete)
      (variable-store . complete)))

    (build-system
     ((justfile . complete)
      (mustfile . complete)
      (containerfile . complete)
      (tool-versions . complete)))

    (site-generation
     ((content-processing . complete)
      (template-engine . complete)
      (output-generation . pending)
      (content-schema . pending)))

    (adapters
     ((mcp-server . complete)
      (rescript-adapter . complete)
      (runtime-adapter . "n/a")))

    (accessibility
     ((bsl-metadata . complete)
      (gsl-metadata . complete)
      (asl-metadata . complete)
      (makaton-metadata . complete)
      (a11y-schema . complete)))

    (testing
     ((unit-tests . pending)
      (e2e-tests . pending)
      (verification . partial)
      (ci-pipeline . complete)))

    (documentation
     ((readme . complete)
      (specification . pending)
      (handover . pending)
      (user-guide . pending)
      (module-readmes . partial)
      (cookbook . complete)
      (contributing . complete)
      (security . complete)))

    (configuration
     ((site-schema . pending)
      (example-config . complete)
      (env-handling . pending)))

    (language-tooling
     ((lexer . "n/a")
      (parser . complete)
      (interpreter . "n/a")
      (compiler . complete)
      (syntax-highlighting . pending)
      (lsp . external)))

    (examples
     ((example-content . complete)
      (example-templates . complete)
      (example-config . complete)))))

;; ============================================================================
;; Current Position
;; ============================================================================

(define current-position
  '((phase . "v1.0 - ReScript Implementation Complete")
    (overall-completion . 100)
    (components ((ReScript-engine ((status . "complete") (completion . 100)))
                 (mcp-adapter ((status . "complete") (language . "ReScript") (completion . 100)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority
     (("File I/O not implemented" . "Cannot read/write files from ReScript")))
    (medium-priority
     (("No E2E tests" . "End-to-end testing framework needed")))
    (low-priority
     (("Syntax highlighting" . "Editor integrations pending")))))

;; ============================================================================
;; Critical Next Actions
;; ============================================================================

(define critical-next-actions
  '((immediate (("Integrate with poly-ssg-mcp hub" . medium)
                ("Add file system operations" . medium)
                ("Implement site build command" . medium)))))

(define state-summary
  '((project . "rescribe-ssg")
    (language . "ReScript")
    (completion . 75)
    (components . "33/44")
    (blockers . 0)
    (high-priority-issues . 1)
    (updated . "2025-12-22")
    (next-milestone . "v1.2 - File I/O & Testing")))
