# SVR Forge — GitHub publishing and profile setup

Current GitHub login: [svrforge](https://github.com/svrforge).

The account has already been renamed, but its public repository with the README is still `svrforge/devopsvikki`. GitHub will only feature that README when the repository is renamed to **`svrforge/svrforge`**.

## First: activate GitHub profile README

Open [this repository's Settings](https://github.com/svrforge/devopsvikki/settings) → General → Repository name → rename `devopsvikki` to `svrforge`. This does **not** change any other repository.

## Next: set display name and bio

[GitHub Profile Settings](https://github.com/settings/profile)

- Name: **Vignesh Raja Sundararajan**
- Bio: **DevOps & Platform Engineer | OCI, Kubernetes, Terraform & CI/CD | Building SVR Forge open-source tools**

Alternatively, use authenticated GitHub CLI on your own Windows computer:

```powershell
gh auth login
git clone https://github.com/svrforge/devopsvikki.git
cd devopsvikki
.\scripts\apply-profile-settings.ps1
```

This script asks for explicit confirmation and changes only your display name and bio.

## Optional: publish five distinct public repositories

```powershell
.\scripts\publish-five-repos.ps1
```

This script prompts before creating any new public repository and refuses to overwrite existing names. It never changes existing repositories' visibility. You should set Git's `user.name` and `user.email` first.

## Safety

Don't commit cloud secrets, production manifests or customer data. Leave XIYARO and every pre-existing private repository completely unchanged. Fork visibility/detachment requires a separate review.
