;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 hyperpolymath
;; META.scm - Meta-level information for rescribe-ssg

(meta
  (media-type "application/meta+scheme")
  (version "1.0")

  (architecture-decisions
    (adr-001
      (title "Use ReScript as sole implementation language")
      (status "accepted")
      (date "2024-12-29")
      (context "Need type-safe SSG that compiles to JavaScript")
      (decision "Write entire SSG in ReScript, leveraging ML-family type inference")
      (consequences
        (positive
          ("Sound type system - no runtime type errors possible")
          ("Excellent type inference reduces annotation burden")
          ("Clean JavaScript output for debugging"))
        (negative
          ("Smaller ecosystem than TypeScript")
          ("Bindings needed for JS libraries"))))
    (adr-002
      (title "Accessibility-first validation")
      (status "accepted")
      (date "2024-12-29")
      (context "Web accessibility is critical but often overlooked")
      (decision "Include built-in a11y validation as core feature")
      (consequences
        (positive
          ("Sites built correctly by default")
          ("Catches accessibility issues at build time")
          ("Promotes inclusive web development"))
        (negative
          ("Additional validation overhead")
          ("May slow initial builds"))))
    (adr-003
      (title "Adapter architecture for outputs")
      (status "accepted")
      (date "2024-12-29")
      (context "Different hosting targets have different requirements")
      (decision "Use adapter pattern for output generation")
      (consequences
        (positive
          ("Easy to add new output targets")
          ("Clean separation of concerns")
          ("Platform-specific optimizations possible"))
        (negative
          ("Additional abstraction layer")
          ("Adapter maintenance overhead")))))

  (development-practices
    (code-style
      (formatter "ReScript built-in formatter")
      (naming "camelCase for values, PascalCase for modules")
      (modules "One module per file with clear exports")
      (documentation "Doc comments on all public APIs"))
    (testing
      (framework "ReScript test utilities")
      (approach "Property-based testing where applicable")
      (coverage-target "85%")
      (location "test/"))
    (versioning
      (scheme "semantic")
      (changelog "CHANGELOG.adoc"))
    (documentation
      (format "AsciiDoc")
      (cookbook "cookbook.adoc with practical examples")
      (examples "examples/"))
    (branching
      (strategy "trunk-based")
      (main-branch "main")))

  (design-rationale
    (why-rescript
      "ReScript evolved from BuckleScript, bringing OCaml's type system to JavaScript. 
       Unlike TypeScript, ReScript's type system is sound - it provides genuine type 
       safety, not just type annotations. For build tools where correctness matters, 
       this soundness guarantee is invaluable.")
    (why-a11y-first
      "Accessibility is often treated as an afterthought, leading to inaccessible 
       websites. By validating accessibility at build time, rescribe ensures that 
       every generated site meets baseline accessibility standards. This shifts 
       accessibility left in the development process.")
    (why-adapters
      "Static sites deploy to many targets: Netlify, Vercel, S3, GitHub Pages, 
       traditional hosting. Each has different optimization opportunities. The 
       adapter pattern allows output customization while keeping the core engine 
       platform-agnostic.")))
