# lemi

**Formalization of Digital Filter Theory with Applications to Parametric Audio Equalization**
IFCE · APS 2026.1

## Tech stack

| Layer  | Toolchain                                      |
|--------|------------------------------------------------|
| Lean 4 | elan + lake, Mathlib4 (commit pinned)          |
| Rust   | stable + `thumbv7em-none-eabihf` target        |
| Python | 3.x, stdlib only                               |
| CI     | GitHub Actions                                 |

## Repository layout

```
lemi/
├── .github/workflows/ci.yml
├── lean/
│   ├── FilterParams.lean
│   └── BilinearTransform.lean
├── src/lib.rs
├── tests/
├── eval/rbj_reference.py
├── lakefile.lean
├── Cargo.toml
└── README.md
```

## Files never to commit

`.gitignore` excludes `Artifacts/`, `Diagrams/`, `backlog.html`, `COMMIT-GUIDELINES.md`,
`references.txt`, `authors.txt`, and itself. Stage files individually — never use `git add -A`.

## Git author

Configure once per clone:
```bash
git config user.name "nilripper"
git config user.email "nilripper@riseup.net"
```

## Co-author trailers

Every commit message must end with (blank line before them):
```
Co-authored-by: ArthurSsa <arthursantossampaio90@gmail.com>
Co-authored-by: Zaguaizo <swencan.2@gmail.com>
Co-authored-by: louisesampaio <louisesampaio2005@gmail.com>
```

## Commit format

```
<type>(<scope>): <subject>

<body — optional>

Co-authored-by: ArthurSsa <arthursantossampaio90@gmail.com>
Co-authored-by: Zaguaizo <swencan.2@gmail.com>
Co-authored-by: louisesampaio <louisesampaio2005@gmail.com>
```

Valid types: `feat` `fix` `refactor` `docs` `chore` `build` `test` `style` `perf`

## Commit date override

Every sprint 1 commit must set both env vars:
```bash
GIT_AUTHOR_DATE="YYYY-MM-DDTHH:MM:SS+0000" \
GIT_COMMITTER_DATE="YYYY-MM-DDTHH:MM:SS+0000" \
git commit -m "..."
```

## Remote

```
git@github-personal:nilripper/lemi.git
```

## Branch and PR workflow

1. `git checkout developer && git pull origin developer`
2. `git checkout -b feat/us-XX-<slug>`
3. Implement and verify
4. Commit with date env vars and co-author trailers
5. `git push -u origin feat/us-XX-<slug>`
6. `gh pr create --base developer ...`
7. Merge PR, then pull developer before the next story

## Sprint 1 — story reference

| US    | Branch                          | Date       | Commit subject                                                       |
|-------|---------------------------------|------------|----------------------------------------------------------------------|
| US-01 | `feat/us-01-structured-repo-ci` | 2026-04-13 | `feat(infra): initialize repository structure and CI skeleton`       |
| US-02 | `feat/us-02-cargo-no-std`       | 2026-04-14 | `feat(infra): add Cargo.toml with std/no_std feature flags`          |
| US-03 | `feat/us-03-lakefile-mathlib4`  | 2026-04-15 | `feat(infra): pin Mathlib4 commit in lakefile.lean`                  |
| US-04 | `feat/us-04-full-ci`            | 2026-04-17 | `feat(infra): add full CI pipeline with Cortex-M4 and Python jobs`   |
| US-05 | `feat/us-05-valid-params`       | 2026-04-19 | `feat(lean): define ValidParams structure in FilterParams.lean`       |
| US-06 | `feat/us-06-filter-type`        | 2026-04-20 | `feat(lean): add FilterType inductive type with three constructors`  |
| US-07 | `feat/us-07-omega-a-defs`       | 2026-04-22 | `feat(lean): define ValidParams.omega and ValidParams.A`             |
| US-08 | `feat/us-08-bilinear-prototype` | 2026-04-24 | `feat(lean): add BilinearTransform.lean prototype with sorry`        |

## DoD (Sprint 1)

- All branches merged into `developer` via reviewed PRs
- `lake build` green on all Lean files (`sorry` allowed in S1–S3)
- `cargo build` and `cargo build --no-default-features` pass with no warnings
- No `Box`, `Vec`, or `String` in `src/` hot path
- Commits authored by `nilripper`, co-authored by all colleagues, dated Apr 13–24 2026
