# actions-workflow-guard

> Offline GitHub Actions workflow hygiene checks

**Original project by Vignesh Raja Sundararajan.**

## Why it exists

Detect broad write permissions, pull_request_target triggers, mutable action references and common download-to-shell patterns in GitHub Actions workflows. No API tokens or network calls needed. Text heuristics are insufficient for a full CI security assessment or precise YAML interpretation.

## Run locally

Python 3.10+, no third-party dependencies:

```bash
python tool.py examples/workflow.yml
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
