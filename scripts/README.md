# Publish five independent repositories

These projects are currently original project directories in the existing public `devopsvikki/devopsvikki` repository. The connected GitHub tool cannot create new repositories or change account profile fields.

## Prerequisites

Windows PowerShell 5.1+ with [Git](https://git-scm.com/downloads) and [GitHub CLI](https://cli.github.com/) installed.

```powershell
gh auth login
gh auth status
git config --global user.name "Vignesh Raja Sundararajan"
# Set your actual Git-associated email locally (do not put it into this public script).
```

## Publish the repositories

```powershell
git clone https://github.com/devopsvikki/devopsvikki.git
cd devopsvikki
.\scripts\publish-five-repos.ps1
```

This script checks all five repository names first and refuses to overwrite existing names. It asks for an explicit `CREATE-5` confirmation, creates **new public repositories only**, and does not change visibility on existing repositories. It needs your own authenticated GitHub CLI permissions and may leave a partial set if an individual creation fails.

## Update profile name and bio

```powershell
.\scripts\apply-profile-settings.ps1
```

This separate, opt-in script changes only GitHub **display name and bio** after an explicit `UPDATE-PROFILE` confirmation. It does not change your username.

## Important

Your existing public forks remain public until their visibility is changed through the correct GitHub fork-network process. **Do not delete fork history casually**, and never make any existing private project public just to publish these labs.
