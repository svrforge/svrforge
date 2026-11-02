# terraform-risk-radar

> Terraform text-based risk-pattern review

**Original project by Vignesh Raja Sundararajan.**

## Why it exists

Review Terraform files locally for open CIDRs, literal credentials and insecure TLS flags. Its JSON findings include only generic descriptions, paths and line numbers—not matched secrets. This is intentionally heuristic text analysis; it does not evaluate HCL expressions or Terraform plans.

## Run locally

Python 3.10+, no third-party dependencies:

```bash
python tool.py examples/main.tf
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
