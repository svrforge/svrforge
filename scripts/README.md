# SVR Forge — GitHub Profile and Project Publishing

Your GitHub username, display name and matching profile README repository are now active:

- [GitHub profile](https://github.com/svrforge)
- [Profile repository](https://github.com/svrforge/svrforge)
- [SVR Forge original DevOps tools](https://github.com/svrforge/svrforge/tree/main/labs)

## Optional account bio setting

Use [GitHub Profile Settings](https://github.com/settings/profile) and set:

`DevOps & Platform Engineer | OCI, Kubernetes, Terraform & CI/CD | Building SVR Forge open-source tools`

The [apply-profile-settings.ps1](./apply-profile-settings.ps1) script offers an optional local alternative with a confirmation gate.

## Optional: publish the original tools as five separate repositories

```powershell
gh auth login
git clone https://github.com/svrforge/svrforge.git
cd svrforge
.\scripts\publish-five-repos.ps1
```

Requires Git, GitHub CLI, a valid local Git commit identity and PowerShell. The script asks for explicit confirmation, checks for existing repository names, and creates only **new public repositories**. It does not modify any existing repository's contents or visibility. Partial publication can occur if a later operation fails.

The five projects are currently **folders** in the profile repository, not separate GitHub repositories.

## Privacy

Do not modify XIYARO or any existing private repository. GitHub public forks have separate network/visibility rules and are not included in this script.
