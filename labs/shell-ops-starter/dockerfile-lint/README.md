# Dockerfile Hygiene Checker
Tiny, dependency-free **educational** static checker. It makes no changes and never builds or runs an image.

## Run
```bash
bash dockerfile-lint/check.sh path/to/Dockerfile
```

Checks basic patterns: `:latest` base images, common download-to-shell commands and missing `USER`. The check is deliberately incomplete (multi-stage files, heredocs and shell variations can evade detection). For comprehensive analysis use Hadolint and image scanning tools such as Trivy. Exit 1 means one or more warnings; exit 2 means missing file.

## Validate
```bash
bash -n dockerfile-lint/check.sh
```
