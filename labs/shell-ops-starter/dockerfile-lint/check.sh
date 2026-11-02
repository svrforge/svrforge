#!/usr/bin/env bash
# Dependency-free Dockerfile hygiene checker. Read-only; deliberately not a security scanner.
set -u
file="${1:-Dockerfile}"
if [ ! -f "$file" ]; then echo "ERROR: File not found: $file" >&2; exit 2; fi
warnings=0
while IFS= read -r line || [ -n "$line" ]; do
  case "$line" in
    [Ff][Rr][Oo][Mm]\ *:latest*|[Ff][Rr][Oo][Mm]\ *:latest\ *) echo "WARN: Floating :latest base image"; warnings=$((warnings+1));;
  esac
  case "$line" in
    *"curl "*" | sh"*|*"wget "*" | sh"*) echo "WARN: Piping downloads directly to shell"; warnings=$((warnings+1));;
  esac
done < "$file"
if ! grep -Eiq '^[[:space:]]*USER[[:space:]]+' "$file"; then echo "WARN: No USER instruction; final image may run as root"; warnings=$((warnings+1)); fi
echo "Dockerfile hygiene check completed: $warnings potential warning(s)"
test "$warnings" -eq 0
