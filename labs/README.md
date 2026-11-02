# SVR Forge — Original Engineering Work

A collection of **independently authored** DevOps learning utilities and platform-operation reference material by **Vignesh Raja Sundararajan**. All work currently lives in project folders within the GitHub profile repository rather than in standalone repositories.

## Original Python tools

| Project | Purpose | Example |
| :--- | :--- | :--- |
| [release-snapshot-checker](release-snapshot-checker/) | Offline Kubernetes Deployment readiness hints | `python tool.py examples/deployment.json --strict` |
| [kube-drift-diff](kube-drift-diff/) | Redacted desired-vs-actual spec changes | `python tool.py examples/desired.json examples/actual.json` |
| [dockerfile-doctor](dockerfile-doctor/) | Common Dockerfile build hygiene patterns | `python tool.py examples/Dockerfile` |
| [terraform-risk-radar](terraform-risk-radar/) | Selected offline IaC anti-patterns | `python tool.py examples/main.tf` |
| [actions-workflow-guard](actions-workflow-guard/) | GitHub Actions workflow hygiene rules | `python tool.py examples/workflow.yml` |

## Additional original work

| Collection | What's inside |
| :--- | :--- |
| [shell-ops-starter](shell-ops-starter/) | Two original Bash utilities migrated out of a forked repo, plus smoke tests |
| [platform-operations-playbook](platform-operations-playbook/) | Kubernetes/OCI/Terraform/Jenkins runbooks, incident framework and review templates |

## Test the tools

```bash
for d in release-snapshot-checker kube-drift-diff dockerfile-doctor terraform-risk-radar actions-workflow-guard; do
  ( cd "labs/$d" && python -m unittest discover -s tests -v ) || exit 1
done
bash labs/shell-ops-starter/tests/smoke.sh
```

Run these commands from the **repository root**. Python tools use the Python standard library; Bash utilities require Bash. None require cloud credentials or perform deployments.

## Scope and responsible use

The tools are heuristics and may produce false positives, false negatives or incomplete results. The playbook is educational guidance, **not evidence of completed production incidents or audits**. Never commit or post private infrastructure exports, production credentials or customer data. Contributions should include reproducible, synthetic examples.

License: [MIT](../LICENSE). See [contribution guidelines](../CONTRIBUTING.md) and [security policy](../SECURITY.md).
