# Managed Kubernetes cluster upgrade validation

Use this template for a version upgrade after an approved change window. Cluster versions and provider-specific support policies must be checked against current official documentation.

## Baseline before the change

- Record cluster version, node pools, add-ons, CNI/CSI versions, and namespace owners.
- Export only approved, sanitized baselines: pod readiness, deployments, daemonsets, statefulsets, ingress and storage health.
- Verify APIs deprecated or removed by the target Kubernetes version.
- Confirm capacity, backups, rollback/recovery limits and communication channels.

```bash
kubectl version
kubectl get nodes -o wide
kubectl get pods -A --field-selector=status.phase!=Running
kubectl get deploy,sts,ds -A
kubectl get pvc -A
kubectl get ingress -A
kubectl get events -A --sort-by=.lastTimestamp
```

A Pending/Succeeded/Completed pod is not automatically a defect; compare against expected workload behavior.

## After the change

1. Check control plane and node version consistency. Mixed versions may be temporarily expected during a staged upgrade.
2. Check pod placement, DNS resolution, networking policies, ingress routes, certificate health and persistent volumes.
3. Check autoscaling, admission controllers, service accounts and secrets delivery without exposing values.
4. Test actual application journeys: login, reads/writes, notifications, scheduled jobs, integrations and external API connectivity.
5. Compare latency, error rates, saturation and queue depth with the pre-change baseline.
6. Request explicit owner sign-off, not just infrastructure-layer green checks.

```bash
kubectl get nodes
kubectl get componentstatuses  # legacy/deprecated on many clusters; skip if unsupported
kubectl get pods -A
kubectl get deploy,sts,ds -A
kubectl get hpa -A
kubectl get pvc -A
```

`kubectl get componentstatuses` is deprecated and may not work; provider-specific control-plane health is preferred.

## Hold and escalation

Escalate when workloads unexpectedly fail readiness, key integrations regress, storage loses access, security policy changes, or customer-visible error rates rise. Do not delete old clusters or decommission nodes until validation sign-offs and data retention requirements are met.

## Evidence record

Date/time (UTC), cluster, old/new version, node readiness, workload readiness, application journey results, dashboards, owner approvals, residual risk and final decision.
