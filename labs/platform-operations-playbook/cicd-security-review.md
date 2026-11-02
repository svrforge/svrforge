# CI/CD & Jenkins security review

## Goals

Improve pipeline integrity and supply-chain confidence through permission, dependency and artifact checks. Perform review against authorized code/configuration only.

## Review checklist

- Jenkins controller and agents supported and patched.
- Least-privilege service accounts and role separation for production deployments.
- Credentials stored in a secure vault/credentials mechanism rather than plain pipeline source.
- Trusted shared libraries and reviewed pipeline changes.
- Image digests or release provenance and an artifact promotion mechanism.
- Dependencies and build tooling versions pinned/reviewed where practical.
- Approval gates for high-impact operations, especially production deletion.
- Test signal quality, with failed stages preventing release where required.
- Audit trail of commits, builds, approvals and deploys.

## Safe local GitHub Actions review

```bash
python labs/actions-workflow-guard/tool.py labs/actions-workflow-guard/examples/workflow.yml
```

This script performs selected textual checks. **It does not inspect Jenkins secrets or production pipelines** and is not a comprehensive parser or vulnerability scanner.

## Example risk documentation

**Finding:** Build job deploy token has unbounded access.

**Evidence:** Redacted role/policy reference and observed permission scopes.

**Risk:** A compromised build agent may modify resources outside its assigned environment.

**Recommendation:** Scope production deploy identity to required resources and protect approval boundaries. Validate in a sandbox before production policy changes.

## Reporting standards

Never claim "zero vulnerabilities" solely because one scanner returned zero findings. State the tool, scope, configuration, ruleset, date, exclusions and untested attack surfaces.
