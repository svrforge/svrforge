# Kubernetes release readiness

## Objective

Document sufficient evidence for a deployment decision without modifying the cluster. This checklist is intentionally not a substitute for release approval, application-specific tests or operational monitoring.

## 1. Context and access

Record cluster, environment, namespace, deployment, image digest, ticket, approver and rollback owner. Check context *before* inspecting resources.

```bash
kubectl config current-context
kubectl auth can-i get deployments -n <namespace>
kubectl -n <namespace> get deploy <deployment> -o wide
kubectl -n <namespace> describe deploy <deployment>
kubectl -n <namespace> get pods -l app=<label> -o wide
kubectl -n <namespace> get events --sort-by=.lastTimestamp
```

Use authorized namespace/labels only. Resource descriptions, events and environment output can include sensitive identifiers; keep evidence in an approved store.

## 2. Release gates

| Area | Evidence | Hold condition |
|---|---|---|
| Rollout status | Desired/available replica counts and deployment conditions | Unavailable pods without explanation |
| Readiness | Working health endpoints and probe status | Not-ready targets or repeated probe failures |
| Capacity | Requests/limits, node pressure and autoscaling | No room for surge or expected traffic |
| Image provenance | Approved immutable image digest | Unapproved tag or mismatched artifact |
| Dependencies | DB/messaging/network smoke tests | Unresolved dependent-service failures |
| App verification | Business-critical user journeys | Any critical regression |
| Operational readiness | Alerts, monitoring, on-call, rollback playbook | No qualified rollback owner |

```bash
kubectl -n <namespace> rollout status deployment/<deployment> --timeout=60s
kubectl -n <namespace> get hpa
kubectl -n <namespace> get pods -l app=<label>
```

`rollout status` is an observation of rollout state, not an instruction to initiate a deployment. A green rollout is only **one** release gate.

## 3. Communication template

**Service:** ... · **Cluster:** ... · **Change:** ... · **Verification:** passed / failed / not evaluated · **Owner:** ... · **Decision:** GO / HOLD · **Evidence link:** ...

## 4. Rollback preparation

Before approval, identify previous release artifact, schema backward-compatibility, rollback authority and escalation. **Do not execute `rollout undo` simply because a health check failed.** Consider data migration compatibility and incident command first.
