# dockerfile-doctor

> Offline Dockerfile hygiene hints

**Original project by Vignesh Raja Sundararajan.**

## Why it exists

Catch common Dockerfile hygiene issues such as floating base-image references, missing USER in the final stage, remote ADD and installation scripts piped into a shell. A lightweight learning aid with clear line numbers. It is not a Dockerfile parser, Hadolint replacement, or image vulnerability scanner.

## Run locally

Python 3.10+, no third-party dependencies:

```bash
python tool.py examples/Dockerfile
```

The sample inputs intentionally produce warnings; tools report potential issues rather than certified vulnerabilities.

## Unit tests

```bash
python -m unittest discover -s tests -v
```

## Privacy and safety

Offline-only: reads local files, never connects to a cluster or cloud, never writes configuration. Do not commit private infrastructure exports or secrets. The findings are limited heuristics and do not replace a production security review.

## Open source

Part of [SVR Forge DevOps Lab](../README.md). See [MIT license](../LICENSE). Issues and PRs welcome; do not share confidential logs in public issues.
