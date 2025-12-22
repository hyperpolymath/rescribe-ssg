;;; AGENTIC.scm — rescribe-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (rescribe-ssg agentic)
  #:export (agent-capabilities tool-definitions mcp-integration
            autonomy-boundaries consent-framework))

;; ============================================================================
;; Agent Capabilities
;; ============================================================================

(define agent-capabilities
  '((primary-functions
     ((site-generation
       (description . "Generate static HTML sites from markdown content")
       (inputs . ("markdown files" "frontmatter" "templates"))
       (outputs . ("HTML pages" "asset copies" "sitemap")))
      (content-processing
       (description . "Parse and transform content")
       (inputs . ("markdown" "YAML frontmatter"))
       (outputs . ("structured content" "HTML fragments")))
      (template-rendering
       (description . "Apply templates to content")
       (inputs . ("content" "template" "variables"))
       (outputs . ("rendered HTML")))))

    (mcp-tools
     ((rescribe_build
       (description . "Build the rescribe-ssg site")
       (parameters . ((path . "Path to site root")))
       (returns . "Build result with success/failure"))
      (rescribe_compile
       (description . "Compile ReScript to JavaScript")
       (parameters . ((path . "Path to ReScript project")))
       (returns . "Compilation result"))
      (rescribe_clean
       (description . "Clean build artifacts")
       (parameters . ((path . "Path to project")))
       (returns . "Clean result"))
      (rescribe_version
       (description . "Get rescribe-ssg and ReScript version")
       (parameters . ())
       (returns . "Version information"))))))

;; ============================================================================
;; MCP Integration
;; ============================================================================

(define mcp-integration
  '((protocol . "Model Context Protocol")
    (hub . "poly-ssg-mcp")
    (adapter . "adapters/src/RescribeAdapter.res")
    (connection-flow
     ((connect
       (action . "Verify ReScript installation")
       (on-success . "Set state to Connected")
       (on-failure . "Set state to Disconnected"))
      (disconnect
       (action . "Clean up resources")
       (result . "Set state to Disconnected"))
      (execute-tool
       (action . "Run requested tool")
       (return . "Command result with stdout/stderr/code"))))
    (tool-discovery
     ((method . "List available tools")
      (format . "JSON schema for each tool")
      (dynamic . #f)))))

;; ============================================================================
;; Autonomy Boundaries
;; ============================================================================

(define autonomy-boundaries
  '((permitted-actions
     ((file-read . "Read markdown and template files")
      (file-write . "Write generated HTML to output directory")
      (command-exec . "Run ReScript compiler and build tools")
      (content-transform . "Parse and render content")))

    (restricted-actions
     ((network-access . "No arbitrary network requests")
      (system-modification . "Cannot modify system files")
      (credential-access . "No access to secrets outside env vars")
      (code-execution . "Only predefined build commands")))

    (escalation-required
     ((new-dependencies . "Adding npm packages requires approval")
      (config-changes . "Site config changes need review")
      (output-paths . "Writing outside _site/ requires confirmation")))))

;; ============================================================================
;; Consent Framework
;; ============================================================================

(define consent-framework
  '((ai-training
     ((status . "conditional")
      (conditions
       ("Attribution to hyperpolymath/rescribe-ssg")
       ("Respect AGPL-3.0-or-later license")
       ("Preserve copyleft in derivatives"))))

    (indexing
     ((status . "allowed")
      (scope . "all public content")))

    (summarization
     ((status . "allowed")
      (conditions . ("Cite source"))))

    (generation
     ((status . "conditional")
      (conditions
       ("Attribution required")
       ("AGPL-3.0 applies to derivatives"))))

    (fine-tuning
     ((status . "encouraged")
      (purpose . ("SSG development" "ReScript tooling"))))

    (commercial-use
     ((status . "conditional")
      (conditions . ("Attribution" "AGPL compliance"))))))

;; ============================================================================
;; Agent Interaction Patterns
;; ============================================================================

(define interaction-patterns
  '((request-response
     ((pattern . "Synchronous tool execution")
      (timeout . 120000)
      (retry . #f)))

    (streaming
     ((pattern . "Not currently supported")
      (future . "Watch mode output streaming")))

    (callbacks
     ((pattern . "Build completion notifications")
      (events . ("build-start" "build-complete" "build-error"))))))
