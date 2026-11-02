# Security policy

These utilities are **examples for learning and review**, not security scanners or compliance certifications.

## Supported versions

Only the latest code on the `main` branch is maintained. There are no versioned releases or production support guarantees.

## Report responsibly

**Do not publish credentials, production infrastructure manifests, customer logs, private keys or exploitable details in public GitHub issues.** For a potentially sensitive vulnerability, use [GitHub private vulnerability reporting](https://github.com/devopsvikki/devopsvikki/security/advisories/new) when available.

## Data and execution model

The tools read locally supplied example or exported files. They do not request cloud credentials or connect to production infrastructure. Some tools report only field paths to reduce exposure, but your own input files may still contain secrets: sanitize them before sharing.

Security reports are best-effort; no fix timeline is guaranteed.
