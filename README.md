<div align="center">

<img src="./assets/profile-hero.svg" width="100%" alt="SVR Forge — Vignesh Raja Sundararajan | DevOps, SRE and Platform Engineering" />

<br />

### BUILD RESILIENT SYSTEMS. SHIP WITH CONFIDENCE.

**DevOps · Site Reliability Engineering · Platform Engineering · Cloud Infrastructure**

[![Portfolio](https://img.shields.io/badge/IDENTITY-SVR%20FORGE-101A30?style=flat-square&logo=github&logoColor=white)](https://github.com/svrforge)
[![Original work](https://img.shields.io/badge/ORIGINAL%20WORK-7%20COLLECTIONS-0F827B?style=flat-square&labelColor=101A30)](./labs/)
[![Python tests](https://github.com/svrforge/svrforge/actions/workflows/labs-tests.yml/badge.svg)](./.github/workflows/labs-tests.yml)
[![Bash tests](https://github.com/svrforge/svrforge/actions/workflows/shell-ops-tests.yml/badge.svg)](./.github/workflows/shell-ops-tests.yml)

[**EXPLORE WORK**](#featured-original-work) &nbsp; · &nbsp; [**ENGINEERING STACK**](#engineering-stack) &nbsp; · &nbsp; [**CONNECT**](#connect--collaborate)

</div>

---

## Hello, I'm Vignesh.

I'm **Vignesh Raja Sundararajan**, a **DevOps & Platform Engineer with 3+ years of experience** working across cloud infrastructure, Kubernetes, CI/CD and production operations.

I care about the engineering behind the product: **repeatable infrastructure, reliable releases, visible system health and recoverable operations**.

**SVR Forge** is my independent engineering identity. I build and share original, inspectable tools and practical operating guides — with a strong focus on DevOps, SRE and platform engineering, alongside an interest in developer tooling and web engineering.

> **My philosophy:** Build with intent. Verify with evidence. Operate with confidence.

<table>
<tr>
<td width="33%" valign="top">

**01 / BUILD**

Infrastructure as code, cloud platforms, containers and Kubernetes environments.

</td>
<td width="33%" valign="top">

**02 / DELIVER**

Automated CI/CD, deployment validation and predictable release workflows.

</td>
<td width="34%" valign="top">

**03 / OPERATE**

Observability, troubleshooting, secure defaults and production readiness.

</td>
</tr>
</table>

## From code to confidence

<img src="./assets/engineering-lifecycle.svg" width="100%" alt="Engineering lifecycle: plan, provision, build, deploy, observe, improve" />

**Repeatability** &nbsp; / &nbsp; **Least privilege** &nbsp; / &nbsp; **Operational clarity** &nbsp; / &nbsp; **Evidence-driven decisions**

The goal isn't simply to ship a release. It's to make the next deployment, incident response and handover easier to execute and trust.

## Featured original work

**7 original collections** housed inside this profile repository: **5 Python tools**, **1 Bash utilities collection**, and **1 platform operations handbook**. These are real source directories, not seven separate standalone repositories.

<table>
<tr>
<td width="50%" valign="top">

### 01 · [Release Snapshot Checker](./labs/release-snapshot-checker/)

**Pre-release clarity for Kubernetes.**

Offline review of Deployment snapshots: image tags, expected replicas and readiness signals.

<sub>PYTHON / KUBERNETES / RELEASE REVIEW</sub>

</td>
<td width="50%" valign="top">

### 02 · [Kube Drift Diff](./labs/kube-drift-diff/)

**See drift, not private values.**

Compare desired and observed Kubernetes specifications with redacted reporting.

<sub>PYTHON / CONFIGURATION / DRIFT</sub>

</td>
</tr>
<tr>
<td valign="top">

### 03 · [Dockerfile Doctor](./labs/dockerfile-doctor/)

**Better container build habits.**

Identify selected Dockerfile hygiene patterns related to bases, users and install steps.

<sub>PYTHON / DOCKER / HYGIENE</sub>

</td>
<td valign="top">

### 04 · [Terraform Risk Radar](./labs/terraform-risk-radar/)

**Review common IaC risk patterns.**

Spot selected text patterns around public exposure, credential literals and TLS.

<sub>PYTHON / TERRAFORM / STATIC REVIEW</sub>

</td>
</tr>
<tr>
<td valign="top">

### 05 · [Actions Workflow Guard](./labs/actions-workflow-guard/)

**Practical CI workflow review.**

Inspect common GitHub Actions patterns: permissions, action references and triggers.

<sub>PYTHON / ACTIONS / AUTOMATION</sub>

</td>
<td valign="top">

### 06 · [Shell Ops Starter](./labs/shell-ops-starter/)

**Useful commands, safe by default.**

Two original Bash utilities for local deployment preflight and Dockerfile checks, with smoke tests.

<sub>BASH / PREFLIGHT / DIAGNOSTICS</sub>

</td>
</tr>
<tr>
<td colspan="2" valign="top">

### 07 · [Platform Operations Playbook](./labs/platform-operations-playbook/)

**Operational knowledge you can reuse.**

Read-only-first guidance and templates spanning Kubernetes upgrades, OCI reviews, Terraform changes, Jenkins hygiene, incidents and production readiness.

<sub>KUBERNETES / OCI / TERRAFORM / JENKINS / RUNBOOKS</sub>

</td>
</tr>
</table>

<div align="center">

**[EXPLORE ALL ORIGINAL ENGINEERING WORK →](./labs/)**

</div>

> **Scope matters:** The analyzers use offline heuristics; the Bash tools are educational, local checks; and the handbook provides example guidance. None is a production security certification, a live assessment, or evidence of work performed for a named employer. Never upload production credentials or customer data.

## Engineering stack

<div align="center">

**CLOUD / CONTAINERS / INFRASTRUCTURE**

![Oracle Cloud](https://img.shields.io/badge/Oracle_Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)

**DELIVERY / AUTOMATION / OPERATIONS**

![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

</div>

## Quality is part of the work

The executable tools include synthetic examples and tests. Run the five Python test suites and the Bash smoke tests locally from the repository root:

```bash
git clone https://github.com/svrforge/svrforge.git
cd svrforge

for d in release-snapshot-checker kube-drift-diff dockerfile-doctor terraform-risk-radar actions-workflow-guard; do
  (cd "labs/$d" && python -m unittest discover -s tests -v) || exit 1
done

bash labs/shell-ops-starter/tests/smoke.sh
```

[**Python CI**](./.github/workflows/labs-tests.yml) · [**Bash CI**](./.github/workflows/shell-ops-tests.yml) · [**Contribution guide**](./CONTRIBUTING.md) · [**Security policy**](./SECURITY.md)

## Connect & collaborate

Interested in **DevOps, SRE, OCI, Kubernetes, platform tooling, cloud automation, developer experience or modern web engineering**? I welcome focused project feedback, technical discussion and collaboration.

**[GitHub profile](https://github.com/svrforge)** &nbsp; · &nbsp; **[Browse code](./labs/)** &nbsp; · &nbsp; **[Open an issue](https://github.com/svrforge/svrforge/issues)**

---

<div align="center">

### SVR FORGE

**DESIGN FOR RELIABILITY. AUTOMATE WITH PURPOSE.**

<sub>Vignesh Raja Sundararajan · <a href="https://github.com/svrforge">@svrforge</a> · Independent DevOps & Platform Engineering</sub>

</div>
