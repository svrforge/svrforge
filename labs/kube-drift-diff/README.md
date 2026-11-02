# kube-drift-diff

> Redacted Kubernetes desired-vs-actual spec comparison

**Original project by Vignesh Raja Sundararajan.**

## Why it exists

Compare two locally exported Kubernetes resource JSON snapshots by kind, namespace and name. Ignore status/metadata changes and output changed spec paths without secret values. Useful for lightweight GitOps drift education; list order is significant and merge semantics are not modeled.

## Run locally

Python 3.10+, no third-party dependencies:

```bash
python tool.py examples/desired.json examples/actual.json
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
