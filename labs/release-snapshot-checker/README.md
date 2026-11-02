# release-snapshot-checker

> Offline Kubernetes Deployment release checks

**Original project by Vignesh Raja Sundararajan.**

## Why it exists

Check exported Deployment snapshots for replica availability hints, floating image tags, missing readiness probes and incomplete CPU/memory resource declarations. Runs fully offline, uses no kubeconfig and never makes cluster API calls. Its findings are opinions to review, not a certification of release safety.

## Run locally

Python 3.10+, no third-party dependencies:

```bash
python tool.py examples/deployment.json --strict
```

The sample inputs intentionally produce warnings; tools report potential issues rather than certified vulnerabilities.

## Unit tests

```bash
python -m unittest discover -s tests -v
```

## Privacy and safety

Offline-only: reads local files, never connects to a cluster or cloud, never writes configuration. Do not commit private infrastructure exports or secrets. The findings are limited heuristics and do not replace a production security review.

## Open source

Part of [VRS DevOps Lab](../README.md). See [MIT license](../LICENSE). Issues and PRs welcome; do not share confidential logs in public issues.
