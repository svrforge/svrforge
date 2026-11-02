# Contributing to SVR Forge DevOps Lab

Thanks for considering a contribution! This repository contains small, **read-only, offline-first educational DevOps tools**.

## Before opening a pull request

1. Check existing issues and briefly describe the problem being solved.
2. Keep changes scoped to one tool unless there's a compelling shared reason.
3. Run the relevant tests: `cd labs/<tool> && python -m unittest discover -s tests -v`.
4. Document new behavior, examples, assumptions and limitations in the tool README.
5. Prefer Python standard library and avoid adding network access or mutation without prior discussion.
6. For a rule change, add at least one positive and one negative test case.

## Pull request checklist

- [ ] No private infrastructure data, tokens, usernames or secrets included
- [ ] Tests pass locally
- [ ] Documentation matches the current implementation
- [ ] New findings avoid printing sensitive input values
- [ ] Any breaking changes are called out

## Project standards

Use descriptive names and clear errors. Preserve local-only behavior. Prefer deterministic inputs, no telemetry, and no undocumented side effects.

Please follow the [Code of Conduct](CODE_OF_CONDUCT.md) and [Security Policy](SECURITY.md).
