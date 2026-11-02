#Requires -Version 5.1
$ErrorActionPreference = 'Stop'
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw "GitHub CLI required." }
$user = (& gh api user --jq '.login')
if ($LASTEXITCODE -ne 0 -or $user.Trim() -ne 'svrforge') { throw 'Login to the svrforge account first.' }
$name = 'Vignesh Raja Sundararajan'
$bio = 'DevOps & Platform Engineer | OCI, Kubernetes, Terraform & CI/CD | Building SVR Forge open-source tools'
Write-Host "Update GitHub display name to: $name"
Write-Host "Update GitHub bio to: $bio"
$confirm=Read-Host 'Type UPDATE-PROFILE to continue'
if($confirm -cne 'UPDATE-PROFILE') { Write-Host 'Cancelled'; return }
& gh api -X PATCH user -f "name=$name" -f "bio=$bio" --jq '{login,name,bio}'
if($LASTEXITCODE -ne 0) { throw 'GitHub profile update failed. Check gh auth scope.' }
Write-Host 'No username, profile picture, repository, visibility or privacy settings were modified.'
