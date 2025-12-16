;;; STATE.scm — rescribe-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "1.0.0")
    (updated . "2025-12-16")
    (project . "rescribe-ssg")
    (required-language . "ReScript")))

(define language-enforcement
  '((primary-language . "ReScript")
    (file-extension . ".res")
    (interpreter . "rescript")
    (forbidden-languages . ("Python" "JavaScript" "TypeScript" "Ruby" "Go"))
    (rationale . "rescribe-ssg is the DEFINITIVE ReScript static site generator. It MUST be written entirely in ReScript. No other implementation languages are permitted.")
    (enforcement . "strict")))

(define current-position
  '((phase . "v1.0 - ReScript Implementation Complete")
    (overall-completion . 100)
    (components ((ReScript-engine ((status . "complete") (completion . 100)))
                 (mcp-adapter ((status . "pending") (language . "ReScript") (completion . 0)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority ())))

(define critical-next-actions
  '((immediate (("Connect MCP adapter in ReScript" . high)))))

(define state-summary
  '((project . "rescribe-ssg")
    (language . "ReScript")
    (completion . 100)
    (blockers . 0)
    (updated . "2025-12-16")))
