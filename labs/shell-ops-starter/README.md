# Shell Ops Starter

Two **original, read-only Bash utilities** written for the SVR Forge project, moved here from a separate forked repository to preserve original work before fork cleanup.

| Tool | Purpose | Run |
|---|---|---|
| [Deployment preflight](deployment-preflight/) | Local Git state, CLI availability and configured Kubernetes context | `bash deployment-preflight/preflight.sh` |
| [Dockerfile lint](dockerfile-lint/) | Minimal Dockerfile warnings about latest tags, downloads piped to shell and missing USER | `bash dockerfile-lint/check.sh path/to/Dockerfile` |

**Security:** Scripts are educational heuristics. They do not call cloud APIs, deploy or write infrastructure. A clean output is not proof of deployment readiness or supply-chain security.

## Test
```bash
bash tests/smoke.sh
```

## Provenance
The two Bash scripts were independently authored and previously committed under `shell-scripting-project/deployment-preflight` and `shell-scripting-project/dockerfile-lint`. The surrounding repository is a GitHub fork of another author's project and is **not** presented as independently authored here. This directory preserves only those original additions.

License: [MIT](../../LICENSE). Contributions follow the [main guidance](../../CONTRIBUTING.md).
