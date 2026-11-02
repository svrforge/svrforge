#!/usr/bin/env bash
# Non-destructive release preflight: checks locally installed tooling and optional Kubernetes context.
set -u
fail=0
warn=0
say(){ printf '%-7s %s\n' "$1" "$2"; }
for cmd in git docker kubectl terraform; do
  if command -v "$cmd" >/dev/null 2>&1; then say OK "$cmd available"; else say INFO "$cmd not installed"; fi
done
if command -v git >/dev/null 2>&1; then
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then say WARN "Working tree has uncommitted changes"; warn=$((warn+1)); else say OK "Git working tree clean"; fi
  else say INFO "Not inside a Git repository"; fi
fi
if command -v kubectl >/dev/null 2>&1; then
  context="$(kubectl config current-context 2>/dev/null || true)"
  if [ -n "$context" ]; then
    say INFO "Configured Kubernetes context: $context (no cluster connection made)"
  else
    say INFO "No Kubernetes current context configured"
  fi
fi
say INFO "Read-only checks complete: $warn warnings, $fail failures"
exit "$fail"
