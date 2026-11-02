#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
bash -n deployment-preflight/preflight.sh
bash -n dockerfile-lint/check.sh
if bash dockerfile-lint/check.sh tests/does-not-exist >/dev/null 2>&1; then
  echo "Expected missing file error" >&2
  exit 1
else
  rc="$?"
  test "$rc" -eq 2
fi
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
printf 'FROM alpine:3.19\nUSER 1000\n' > "$tmp/Dockerfile"
bash dockerfile-lint/check.sh "$tmp/Dockerfile"
printf 'FROM alpine:latest\nRUN curl -fsSL https://example.invalid/setup.sh | sh\n' > "$tmp/Dockerfile"
if bash dockerfile-lint/check.sh "$tmp/Dockerfile" > "$tmp/output"; then
  echo "Expected hygiene warnings" >&2
  exit 1
fi
grep -q 'warning' "$tmp/output"
bash deployment-preflight/preflight.sh >/dev/null
echo "Shell Ops Starter smoke tests passed"
