<div align="center">

<img src="./assets/profile-hero.svg" alt="SVR Forge — Vignesh Raja Sundararajan | DevOps, SRE and Platform Engineering" width="100%" />

<br />

**Engineering reliable infrastructure, repeatable delivery and useful developer tools.**

[![DevOps Lab CI](https://github.com/svrforge/svrforge/actions/workflows/labs-tests.yml/badge.svg)](https://github.com/svrforge/svrforge/actions/workflows/labs-tests.yml)
[![Tools](https://img.shields.io/badge/original%20collections-7-64E3CD?style=flat-square&labelColor=102034)](./labs/)
[![License](https://img.shields.io/badge/license-MIT-86ADFF?style=flat-square&labelColor=102034)](./LICENSE)
[![GitHub](https://img.shields.io/badge/%40svrforge-GitHub-DAE8FA?style=flat-square&logo=github&labelColor=102034)](https://github.com/svrforge)

[About](#about) · [Engineering focus](#engineering-focus) · [Original projects](#original-projects) · [Toolbox](#toolbox) · [Collaborate](#collaborate)

</div>

---

## About

Hi, I'm **Vignesh Raja Sundararajan** — a **DevOps & Platform Engineer with 3+ years of experience** working across cloud infrastructure, Kubernetes, CI/CD and production operations.

**SVR Forge** is my independent engineering identity: a place to build, document and share practical automation. I care about systems that are **reproducible, observable, maintainable and secure by default** — not just impressive screenshots.

My principal focus is **DevOps, Site Reliability Engineering and Platform Engineering**. I also work with developer tooling and modern web experiences.

> **My approach:** Simplify the workflow. Automate the repeatable work. Verify the result. Make operations understandable.

## Engineering focus

| **01 · Cloud & platforms** | **02 · Automation & delivery** | **03 · Reliability & security** |
| :--- | :--- | :--- |
| OCI, Kubernetes, Docker and Infrastructure as Code | Jenkins, GitHub Actions, Terraform and release workflows | Deployment validation, troubleshooting, observability and practical security checks |
| Design for repeatability and operational clarity | Reduce manual steps and build confidence in releases | Prefer least privilege, evidence-based checks and safe rollback plans |

**The engineering loop:** `Plan → Build → Validate → Deliver → Observe → Improve`

## Original projects

My original work includes **five Python utilities**, a **Bash operations toolkit**, and a **practical platform operations handbook**. These are maintained as distinct folders in this public profile repository (not yet seven standalone repositories). The Python tools have unit tests; the Bash toolkit has smoke tests; the handbook contains original runbooks and templates.

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>01 · <a href="./labs/release-snapshot-checker/">Release Snapshot Checker</a></h3>
      <p>Review Kubernetes Deployment snapshots before a release: image tags, expected replicas and readiness signals.</p>
      <sub>Focus: Kubernetes release reviews</sub>
    </td>
    <td width="50%" valign="top">
      <h3>02 · <a href="./labs/kube-drift-diff/">Kube Drift Diff</a></h3>
      <p>Compare desired and observed Kubernetes specifications while avoiding exposure of field values in the report.</p>
      <sub>Focus: configuration drift</sub>
    </td>
  </tr>
  <tr>
    <td valign="top">
      <h3>03 · <a href="./labs/dockerfile-doctor/">Dockerfile Doctor</a></h3>
      <p>Spot common Dockerfile hygiene patterns involving base images, user selection and installation steps.</p>
      <sub>Focus: container hygiene</sub>
    </td>
    <td valign="top">
      <h3>04 · <a href="./labs/terraform-risk-radar/">Terraform Risk Radar</a></h3>
      <p>Highlight selected IaC patterns involving network exposure, embedded credentials and TLS settings.</p>
      <sub>Focus: infrastructure review</sub>
    </td>
  </tr>
  <tr>
    <td colspan="2" valign="top">
      <h3>05 · <a href="./labs/actions-workflow-guard/">Actions Workflow Guard</a></h3>
      <p>Check common GitHub Actions workflow hygiene issues, including permissions, action references and event triggers.</p>
      <sub>Focus: CI/CD workflow review</sub>
    </td>
  </tr>
  <tr>
    <td valign="top">
      <h3>06 · <a href="./labs/shell-ops-starter/">Shell Ops Starter</a></h3>
      <p>Two original Bash utilities for read-only local deployment preflight and Dockerfile hygiene. Preserved before fork cleanup.</p>
      <sub>Focus: practical CLI diagnostics</sub>
    </td>
    <td valign="top">
      <h3>07 · <a href="./labs/platform-operations-playbook/">Platform Operations Playbook</a></h3>
      <p>Production-safe-first runbooks for Kubernetes, OCI, Terraform, Jenkins and incident response, with reusable review templates.</p>
      <sub>Focus: operational engineering knowledge</sub>
    </td>
  </tr>
</table>

**[Explore the DevOps Lab →](./labs/)** · [View test workflow](./.github/workflows/labs-tests.yml)

> **Scope note:** The analyzers are educational local heuristics; the runbooks are engineering guidance. None is a production security certification, a live infrastructure assessment, or proof of work performed for a particular employer. Do not upload cloud credentials or customer data.

## Toolbox

<div align="center">

**Cloud · Containers · Infrastructure**

![OCI](https://img.shields.io/badge/Oracle_Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)

**Delivery · Automation · Operations**

![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)

</div>

## Quality, not just presentation

The tools are deliberately small enough to inspect. Their sample fixtures and tests make behavior reproducible. The playbook documents assumptions and stop conditions rather than inventing production incidents.

Run the five Python test suites and Bash smoke tests from the repository root:

```bash
for d in release-snapshot-checker kube-drift-diff dockerfile-doctor terraform-risk-radar actions-workflow-guard; do
  (cd "labs/$d" && python -m unittest discover -s tests -v) || exit 1
done
bash labs/shell-ops-starter/tests/smoke.sh
```

The [Python test workflow](./.github/workflows/labs-tests.yml) and [Bash smoke workflow](./.github/workflows/shell-ops-tests.yml) cover the executable tools. Python's standard library is sufficient for the five Python projects.

## Collaborate

I welcome clear bug reports, focused improvements and practical engineering discussions — especially around Kubernetes, OCI, CI/CD, infrastructure automation, reliability and tooling.

**[Browse the source](./labs/)** · **[Fork cleanup inventory](./FORK-CLEANUP.md)** · **[Open an issue](https://github.com/svrforge/svrforge/issues)** · **[Contributing guide](./CONTRIBUTING.md)** · **[Security policy](./SECURITY.md)**

Please do not share secrets, customer details or private production configurations in issues or example files.

---

<div align="center">

**SVR FORGE**  
*Build with intent. Verify with evidence. Operate with confidence.*

<sub>Vignesh Raja Sundararajan · <a href="https://github.com/svrforge">@svrforge</a> · Independent DevOps & Platform Engineering</sub>

</div>
