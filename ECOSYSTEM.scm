;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;; ECOSYSTEM.scm - Project ecosystem positioning for rescribe-ssg

(ecosystem
  (version "1.0")
  (name "rescribe-ssg")
  (type "ssg-engine")
  (purpose "Demonstrating ML-family type safety for static site generation in JavaScript ecosystem")

  (position-in-ecosystem
    (role "satellite")
    (hub "poly-ssg-mcp")
    (category "functional-typed-ssgs")
    (uniqueness "Pure ReScript implementation with focus on type-safe templates"))

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (relationship "hub")
      (description "Central MCP orchestrator for all SSG engines")
      (integration "Provides rescribe adapter for unified SSG access"))
    (project
      (name "gungir-ssg")
      (relationship "close-sibling")
      (description "Another ReScript SSG with different design philosophy")
      (shared-aspects ("ReScript" "Deno" "ML-type inference"))
      (differences ("gungir focuses on data-oriented design")))
    (project
      (name "sparkle-ssg")
      (relationship "sibling")
      (description "Gleam-based SSG")
      (shared-aspects ("functional paradigm" "type safety" "compile-to-JS option")))
    (project
      (name "labnote-ssg")
      (relationship "sibling")
      (description "Scientific documentation SSG")
      (shared-aspects ("structured content" "validation")))
    (project
      (name "orbital-ssg")
      (relationship "sibling")
      (description "Space-themed SSG")
      (shared-aspects ("modern architecture" "MCP integration"))))

  (what-this-is
    ("A static site generator written entirely in ReScript")
    ("A showcase of ML-family type inference in web tooling")
    ("A type-safe alternative to JavaScript/TypeScript SSGs")
    ("MCP-compatible for AI-assisted site generation")
    ("Part of the poly-ssg ecosystem of diverse SSGs"))

  (what-this-is-not
    ("Not a TypeScript project despite JS output")
    ("Not tied to Node.js ecosystem")
    ("Not a general-purpose web framework")
    ("Not limited to BuckleScript-era patterns")))
