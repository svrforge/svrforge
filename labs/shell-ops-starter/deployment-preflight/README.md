# Deployment Preflight (read-only Bash)
A small, safe command-line checklist before a deployment. Works without cloud credentials.

## Usage
```bash
bash deployment-preflight/preflight.sh
```

## What it checks
- Presence of common DevOps CLIs: Git, Docker, kubectl and Terraform
- Whether the current Git working tree has uncommitted changes
- Local kubectl current-context configuration (does **not** connect to the cluster)

## Security boundaries
No cluster API calls, credentials, config changes, package installs, network requests or deployments. Informational warnings do not block execution. Exit code 0 means the script completed, **not** that production is safe to deploy.

## Verification
```bash
bash -n deployment-preflight/preflight.sh
bash deployment-preflight/preflight.sh
```
