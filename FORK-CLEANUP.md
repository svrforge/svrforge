# Verified Public Fork Inventory and Cleanup

Audit date: **2026-11-02**, GitHub account **svrforge**.

## Findings

- **22 public fork repositories** verified with GitHub's `fork=true` metadata and upstream `parent`.
- **6 public non-fork repositories** (including `svrforge/svrforge`) are excluded.
- **1 private repository `svrforge/xiora`** excluded and must remain private and untouched.
- **XIYARO is protected**, irrespective of its precise location or future repository name.
- Two independently authored Bash utilities found in the forked `shell-scripting-project` were preserved as [Shell Ops Starter](../labs/shell-ops-starter/) in the original profile repository.

## Exact cleanup scope

| Forked repository | GitHub upstream |
|---|---|
| `svrforge/90DaysOfDevOps` | `TrainWithShubham/90DaysOfDevOps` |
| `svrforge/90DaysOfDevOps-1` | `rajani103/90DaysOfDevOps` |
| `svrforge/aws-devops-project` | `AreebAbdulGhani/aws-devops-project` |
| `svrforge/demo-counter-app` | `iam-vikash/demo-counter-app` |
| `svrforge/deployed-cloud-native-monitoring-application-on-kubernetes` | `AreebAbdulGhani/deployed-cloud-native-monitoring-application-on-kubernetes` |
| `svrforge/devops-projects-001` | `techiescamp/devops-projects` |
| `svrforge/Docker-Zero-to-Hero` | `iam-veeramalla/Docker-Zero-to-Hero` |
| `svrforge/dockerlabs` | `collabnix/dockerlabs` |
| `svrforge/End-to-End-Azure-DevSecOps-Project` | `KUNAL-MAURYA1470/End-to-End-Azure-DevSecOps-Project` |
| `svrforge/java-web-app-docker` | `sandeepdurai/java-web-app-docker` |
| `svrforge/Jenkins-Zero-To-Hero` | `Venkateshd279/Jenkins-Zero-To-Hero` |
| `svrforge/kube2812project` | `Venkateshd279/kube2812project` |
| `svrforge/linkedin-skill-assessments-quizzes` | `Ebazhanov/linkedin-skill-assessments-quizzes` |
| `svrforge/microservices` | `Santhoshsk1802/microservices` |
| `svrforge/mrdevops_java_app` | `iam-vikash/mrdevops_java_app` |
| `svrforge/my-app` | `damodaranj/my-app` |
| `svrforge/postal` | `postalserver/postal` |
| `svrforge/Project-ECommerce-Application-Deployment` | `AreebAbdulGhani/Project-ECommerce-Application-Deployment` |
| `svrforge/shell-scripting-project` | `AreebAbdulGhani/shell-scripting-project` |
| `svrforge/sonarqube-version` | `Venkateshd279/sonarqube-version` |
| `svrforge/terraformazuredevops` | `prabaharan0312126/terraformazuredevops` |
| `svrforge/webapplication` | `veejee2331/webapplication` |

These are genuine GitHub fork-network relationships, **not independent original projects**. An upstream author's original work cannot be presented as our own. Removing a fork deletes the account's copy, GitHub issues/stars and fork history for that repository; it does not affect the upstream repository. Backup anything you separately authored before deleting.

## Removal procedure

The connected GitHub application has **no delete-repository administrative action**; repository write permission is different from repository deletion. The fork repositories have **not** been deleted by this audit.

The [opt-in cleanup script](../scripts/delete-verified-public-forks.ps1) validates the owner, current fork status, public visibility and exact audit inventory immediately before proceeding. It excludes private repositories, non-forks and XIYARO. It saves local inventory evidence, requires the operator to type a deliberate confirmation, and deletes only the 22 verified fork names. It requires GitHub CLI `delete_repo` scope on the operator's machine.

```powershell
gh auth login
gh auth refresh -h github.com -s delete_repo
git clone https://github.com/svrforge/svrforge.git
cd svrforge
.\scripts\delete-verified-public-forks.ps1
```

GitHub permission enforcement and confirmation happen **under the account owner's credentials**. Never paste personal access tokens into chat, GitHub issues or workflow YAML.

### After cleanup

Verify `gh repo list svrforge --limit 200 --json name,isFork,isPrivate` and confirm there are no remaining public forks. Profile pinned repositories must be selected from original work. Existing private repositories and XIYARO remain untouched.
