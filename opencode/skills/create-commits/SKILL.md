---
name: create-commits
description: Split uncommitted changes into a coherent series of focused Git commits, grouped by file set and change type, with English commit messages. Use when the user asks to commit changes, including Russian requests such as "закоммить", "создай коммиты", or "сделай серию коммитов".
---

# Create Commits

Turn uncommitted work into a clean series of commits. One commit should represent
one logical change, and the repository should stay consistent at that point when
practical.

## When to use

- The user asks to commit, split changes into commits, or commit work group by
  group.
- Examples: "commit these changes", "make a series of commits", "split this into
  commits", "commit by file groups".
- Russian examples: "закоммить", "создай коммиты", "сделай коммиты", "сделай
  серию коммитов", "разбей изменения на коммиты", "закоммить по группам".
- Do not push, amend, rebase, squash, or otherwise rewrite history unless the
  user explicitly asks for it.

## Workflow

1. Read the repository context.
   - Run `git rev-parse --show-toplevel`, `git status --porcelain=v1`,
     `git diff`, `git diff --cached`, and `git log --oneline -10`.
   - Read `AGENTS.md`, `CONTRIBUTING.md`, and `README.md` for repository rules.
     Repository conventions override this skill.
   - If the directory is not a Git repository, stop and report it.

2. Inventory the changes.
   - List modified, added, deleted, and renamed files.
   - Group them by feature, layer, package, and change type.
   - Identify generated files, caches, secrets, local environment files, and real
     user data that must not be committed.

3. Plan the commit series before staging.
   - Order commits from foundational to dependent changes: moves and renames,
     dependencies, implementation, migrations, tests, configuration, docs.
   - Keep refactoring, behavior changes, tests, and documentation in separate
     commits when they can stand alone.
   - Prefer self-contained commits; avoid leaving the tree broken when practical.
   - Do not create vague "misc changes" or "various fixes" commits.

4. Stage explicitly.
   - Use `git add <paths>` for whole files.
   - Use `git add -p` or an intermediate file state when one file contains
     changes for different commits.
   - Never use `git add -A` or `git add .`; unrelated user work may be present.
   - Check `git diff --cached --stat` and `git status --short` before every
     commit.
   - Never stage secrets, `.env` files, credentials, real personal data, build
     artifacts, dependency caches, or generated output unless the user explicitly
     asks for it.

5. Write the commit message.
   - Write commit messages in English, even if the conversation is in another
     language.
   - Use a short past-tense subject: `Added ...`, `Removed ...`, `Moved ... to
     ...`, `Updated ...`, `Extracted ...`, `Renamed ...`, `Fixed ...`.
   - Keep the subject within about 72 characters and do not end it with a period.
   - Add a body only when it explains why the change was made or records a
     non-obvious constraint.
   - Do not use conventional-commit prefixes unless the repository already uses
     them.

6. Verify the result.
   - After each commit, confirm that the staged set matched the message.
   - After the series, run the repository checks: `ruff`, `mypy`, `pytest`, or
     their project equivalents.
   - Inspect `git status --short` and `git log --oneline`.
   - Report the commit list, check results, and anything intentionally left
     uncommitted.

## Grouping heuristics

- One architectural layer or package per commit when the change is large.
- Move or rename files in a dedicated commit and update imports there.
- Unit tests belong with the code they cover; integration tests may be separate.
- Database migrations and schema changes get their own commit.
- Dependency and lockfile updates go together, before the first commit that uses
  them.
- Environment examples and ignore rules are usually a separate commit.
- Documentation goes last, or with the feature when the change is small.

## Commit message examples

- `Added broker report repository`
- `Removed legacy parser class`
- `Moved ImportReport to the use cases package`
- `Updated README for PostgreSQL persistence`
- `Extracted XML parsing into an adapter`
- `Renamed report models to domain models`

## Stop and ask

- A file or hunk could reasonably belong to more than one commit.
- The user asks for history rewriting, amend, squash, rebase, or push.
- There is a risk of committing secrets, credentials, or real personal data.
- The working tree contains unrelated changes that the user may not want
  committed.
