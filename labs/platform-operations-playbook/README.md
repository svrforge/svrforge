# Platform Operations Playbook

**SVR Forge original engineering reference** · Kubernetes, OCI, CI/CD, Terraform, production readiness and incident handling.

Built as an actionable, **read-only-first** knowledge base for engineers who own application delivery and platform reliability. These guides are reusable examples, *not* evidence of projects or incidents that actually happened at a particular company. Replace placeholders with your own approved resources and adapt decisions to your change process.

## Runbooks

| Runbook | Outcome |
|---|---|
| [Kubernetes release readiness](kubernetes-release-readiness.md) | Pre-release evidence and deployment go/no-go criteria |
| [Cluster upgrade verification](cluster-upgrade-verification.md) | Before/after cluster upgrade validation |
| [Terraform risk review](terraform-change-review.md) | IaC plan interpretation and approval |
| [OCI account review](oci-read-only-security-review.md) | Least-privilege evidence collection without changes |
| [Jenkins pipeline hygiene](cicd-security-review.md) | Build-agent, credential, and supply-chain review |
| [Incident response structure](incident-response.md) | Consistent severity, communication and recovery |

## Templates

- [Architecture Decision Record](templates/architecture-decision.md)
- [Production Change Review](templates/change-review.md)

## Working principles

1. **Scope first:** Identify affected service, environment, owner, time window and approval.
2. **Read-only first:** Every diagnostic step should minimize privileges, changes and exposure of confidential data.
3. **Evidence over optimism:** An API returning 200 or a successful rollout alone does not establish user-journey success.
4. **Stop conditions:** List what outcome requires pausing a release or upgrading.
5. **Reversible change:** Verify rollback approach *before* starting work.
6. **Privacy:** Never post live manifests, secrets, tenant IDs, audit logs or customer data publicly.

**Author:** Vignesh Raja Sundararajan · [SVR Forge](../../README.md)

MIT licensed. Engineering guidance only; production decisions depend on your own organization's policies.
