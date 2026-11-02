# SVR Forge — DevOps Lab

**SVR Forge** is a personal engineering and open-source lab by **Vignesh Raja Sundararajan**. These original, offline-first DevOps utilities are designed for learning and review. These five projects are hosted as independent directories in the existing public profile repository until they are split into separate repositories. They are **not** GitHub forks.

| Project | Focus | Run |
|---|---|---|
| [release-snapshot-checker](release-snapshot-checker/) | Offline Kubernetes Deployment release checks | `python tool.py examples/deployment.json --strict` |
| [kube-drift-diff](kube-drift-diff/) | Redacted Kubernetes desired-vs-actual spec comparison | `python tool.py examples/desired.json examples/actual.json` |
| [dockerfile-doctor](dockerfile-doctor/) | Offline Dockerfile hygiene hints | `python tool.py examples/Dockerfile` |
| [terraform-risk-radar](terraform-risk-radar/) | Terraform text-based risk-pattern review | `python tool.py examples/main.tf` |
| [actions-workflow-guard](actions-workflow-guard/) | Offline GitHub Actions workflow hygiene checks | `python tool.py examples/workflow.yml` |

Every project includes a README, code, unit tests and small example files. They use only the Python standard library and require no cloud credentials. A sample checker finding is not proof of a vulnerability.

### Running all tests

```bash
for d in labs/*/; do (cd "$d" && python -m unittest discover -s tests -v) || exit 1; done
```

### Contribution policy

Contribute clear, scoped bug reports and focused tests. Never upload production secrets, customer data or private infrastructure manifests.

### License

See [MIT LICENSE](LICENSE).
