;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — rescribe-ssg

(define-module (rescribe-ssg ecosystem)
  #:export (ecosystem-definition language-identity related-projects
            satellite-network integration-points))

;; ============================================================================
;; Ecosystem Definition
;; ============================================================================

(define ecosystem-definition
  '((version . "1.1.0")
    (name . "rescribe-ssg")
    (type . "satellite-ssg")
    (purpose . "The DEFINITIVE ReScript static site generator")
    (constellation . "poly-ssg")
    (hub . "poly-ssg-mcp")
    (satellites . 28)))

;; ============================================================================
;; Language Identity (NON-NEGOTIABLE)
;; ============================================================================

(define language-identity
  '((primary . "ReScript")
    (file-extension . ".res")
    (output . "JavaScript (.mjs)")
    (rationale . "rescribe-ssg exists to be THE ReScript SSG. The entire engine is written in ReScript.")
    (forbidden . ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Rust" "Java" "C" "C++"))
    (enforcement . "This is not negotiable. Any non-ReScript implementation will be rejected.")
    (benefits
     ("Type safety at compile time")
     ("JavaScript interoperability")
     ("Fast compilation")
     ("Sound type system")
     ("Pattern matching")
     ("Immutable by default"))))

;; ============================================================================
;; Position in Ecosystem
;; ============================================================================

(define position-in-ecosystem
  '((role . "Satellite SSG in the poly-ssg constellation")
    (uniqueness . "Each satellite is the definitive SSG for its language")
    (contribution . "Provides ReScript-native static site generation")
    (integration . "Connects to poly-ssg-mcp hub via MCP adapter")))

;; ============================================================================
;; Related Projects
;; ============================================================================

(define related-projects
  '((hub
     ((name . "poly-ssg-mcp")
      (url . "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship . "parent-hub")
      (description . "Unified MCP server for 28+ SSGs - provides adapter interface")))

    (sibling-satellites
     ((ada-ssg
       (name . "ada-ssg")
       (language . "Ada/SPARK")
       (url . "https://github.com/hyperpolymath/ada-ssg"))
      (elixir-ssg
       (name . "elixir-ssg")
       (language . "Elixir")
       (url . "https://github.com/hyperpolymath/elixir-ssg"))
      (rust-ssg
       (name . "rust-ssg")
       (language . "Rust")
       (url . "https://github.com/hyperpolymath/rust-ssg"))
      (haskell-ssg
       (name . "haskell-ssg")
       (language . "Haskell")
       (url . "https://github.com/hyperpolymath/haskell-ssg"))))

    (standards
     ((rsr
       (name . "rhodium-standard-repositories")
       (url . "https://github.com/hyperpolymath/rhodium-standard-repositories")
       (relationship . "standard")
       (description . "Repository quality standards"))
      (aibdp
       (name . "ai-boundary-declaration-protocol")
       (url . "https://github.com/hyperpolymath/aibdp")
       (relationship . "standard")
       (description . "AI usage consent framework"))))))

;; ============================================================================
;; Satellite Network
;; ============================================================================

(define satellite-network
  '((total-satellites . 28)
    (language-families
     ((functional . ("Haskell" "Elixir" "OCaml" "ReScript" "Elm"))
      (systems . ("Rust" "Ada/SPARK" "C" "Zig"))
      (dynamic . ("Python" "Ruby" "JavaScript" "Lua"))
      (jvm . ("Kotlin" "Scala" "Clojure"))
      (dotnet . ("F#" "C#"))
      (emerging . ("Julia" "Nim" "Crystal" "Chapel"))))
    (rescribe-position
     (family . "functional")
     (unique-value . "Type-safe JavaScript output")
     (target-users . ("ReScript developers" "Frontend teams" "Type safety enthusiasts")))))

;; ============================================================================
;; Integration Points
;; ============================================================================

(define integration-points
  '((mcp-adapter
     (location . "adapters/src/RescribeAdapter.res")
     (protocol . "Model Context Protocol")
     (tools . ("rescribe_build" "rescribe_compile" "rescribe_clean" "rescribe_version")))

    (build-system
     (primary . "just")
     (secondary . "must")
     (container . "podman")
     (ci . "GitHub Actions"))

    (output-formats
     (html . "Static HTML pages")
     (json . "Content API endpoints")
     (rss . "Feed generation")
     (sitemap . "XML sitemaps"))))

;; ============================================================================
;; What This Is / What This Is Not
;; ============================================================================

(define project-identity
  '((what-this-is
     ("The DEFINITIVE static site generator written in ReScript")
     ("Part of the poly-ssg satellite constellation")
     ("Type-safe SSG with JavaScript output")
     ("Accessibility-first web content generation"))

    (what-this-is-not
     ("NOT a template that can be reimplemented in other languages")
     ("NOT optional about being in ReScript")
     ("NOT a generic SSG framework")
     ("NOT compatible with non-ReScript implementations"))))
