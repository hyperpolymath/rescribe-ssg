;;; PLAYBOOK.scm — rescribe-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (rescribe-ssg playbook)
  #:export (workflows recipes integrations automation))

;; ============================================================================
;; Development Workflows
;; ============================================================================

(define workflows
  '((feature-development
     ((steps
       ("Create feature branch from main")
       ("Implement changes in ReScript (.res files)")
       ("Run `just build` to compile")
       ("Run `just test` to verify")
       ("Run `just lint` to check formatting")
       ("Commit with conventional commit message")
       ("Push and create pull request"))
      (commands
       ("git checkout -b feature/my-feature")
       ("just build")
       ("just test")
       ("just lint")
       ("git commit -m 'feat: add my feature'"))))

    (bug-fix
     ((steps
       ("Create bugfix branch")
       ("Add failing test that demonstrates bug")
       ("Fix the bug in ReScript")
       ("Verify test passes")
       ("Run full test suite")
       ("Commit and push"))
      (commands
       ("git checkout -b fix/issue-123")
       ("just test")
       ("just test-e2e"))))

    (release
     ((steps
       ("Update version in package.json")
       ("Update CHANGELOG.md")
       ("Update STATE.scm version")
       ("Run full test suite")
       ("Create release commit")
       ("Tag release")
       ("Push with tags"))
      (commands
       ("just test")
       ("just test-e2e")
       ("git tag v1.x.x")
       ("git push origin main --tags"))))))

;; ============================================================================
;; Build Recipes
;; ============================================================================

(define recipes
  '((just-recipes
     ((build
       (description . "Compile ReScript to JavaScript")
       (command . "cd adapters && npm run build")
       (output . "*.mjs files in src/"))
      (test
       (description . "Run unit tests")
       (command . "node src/Rescribe.mjs test-full")
       (output . "Test results"))
      (test-e2e
       (description . "Run end-to-end tests")
       (command . "just build && node tests/e2e/run.mjs")
       (output . "E2E test results"))
      (lint
       (description . "Check code formatting")
       (command . "npx rescript format -check src/")
       (output . "Format violations"))
      (clean
       (description . "Remove build artifacts")
       (command . "npx rescript clean && rm -rf lib/")
       (output . "Cleaned directories"))
      (dev
       (description . "Watch mode development")
       (command . "npx rescript -w")
       (output . "Continuous compilation"))
      (generate
       (description . "Generate static site")
       (command . "node src/Rescribe.mjs generate")
       (output . "HTML files in _site/"))
      (serve
       (description . "Local development server")
       (command . "npx serve _site")
       (output . "Server at http://localhost:3000"))))

    (must-recipes
     ((all
       (description . "Verify all requirements met")
       (checks . ("ReScript installed" "No forbidden languages" "Tests pass")))
      (verify
       (description . "Run verification suite")
       (checks . ("just build" "just test" "just lint")))))))

;; ============================================================================
;; CI/CD Integration
;; ============================================================================

(define integrations
  '((github-actions
     ((workflow . ".github/workflows/ci.yml")
      (triggers . ("push to main" "pull requests"))
      (jobs
       ((build
         (steps . ("checkout" "setup-node" "npm install" "rescript build" "run tests")))
        (lint
         (steps . ("checkout" "setup-node" "rescript format -check")))
        (security
         (steps . ("codeql-init" "codeql-analyze")))))))

    (container
     ((file . "Containerfile")
      (base . "node:20-alpine")
      (stages . ("build" "runtime"))
      (output . "ghcr.io/hyperpolymath/rescribe-ssg")))

    (versioning
     ((tool . "asdf")
      (file . ".tool-versions")
      (runtimes . ("nodejs" "rescript"))))))

;; ============================================================================
;; Automation Rules
;; ============================================================================

(define automation
  '((pre-commit
     ((hooks
       ("rescript format" . "Format ReScript files")
       ("rescript build" . "Verify compilation")
       ("just test" . "Run tests"))))

    (dependabot
     ((ecosystems . ("npm" "github-actions"))
      (schedule . "weekly")
      (grouping . "dependencies")))

    (release-automation
     ((triggers . ("version tag pushed"))
      (actions
       ("build container image")
       ("push to ghcr.io")
       ("create GitHub release")
       ("update documentation"))))))
