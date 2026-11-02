#Requires -Version 5.1
$ErrorActionPreference = 'Stop'
$owner = 'devopsvikki'
$projects = @(
  @{Name='release-snapshot-checker'; Description='Offline Kubernetes Deployment release configuration analyzer'},
  @{Name='kube-drift-diff'; Description='Redacted offline Kubernetes desired-vs-observed spec diff'},
  @{Name='dockerfile-doctor'; Description='Offline Dockerfile hygiene analyzer with focused findings'},
  @{Name='terraform-risk-radar'; Description='Local Terraform configuration risk-pattern reviewer'},
  @{Name='actions-workflow-guard'; Description='Offline GitHub Actions workflow hygiene analyzer'}
)
foreach($cmd in @('gh','git')) {
  if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) { throw "$cmd is required. Install it before running." }
}
$login = (& gh api user --jq '.login')
if ($LASTEXITCODE -ne 0 -or $login.Trim() -ne $owner) { throw "GitHub CLI must be authenticated as $owner." }
foreach($p in $projects) {
  & gh repo view "$owner/$($p.Name)" --json name 2>$null | Out-Null
  if($LASTEXITCODE -eq 0) { throw "Refusing to overwrite existing repo $owner/$($p.Name). No repositories created." }
}
Write-Host "This will create five NEW public repositories owned by $owner. Existing repositories remain unchanged."
$confirmation = Read-Host "Type CREATE-5 to continue"
if($confirmation -cne 'CREATE-5') { Write-Host 'Cancelled.'; return }
$working = Join-Path ([System.IO.Path]::GetTempPath()) ("vrs-devops-publish-" + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $working | Out-Null
try {
  $source = Join-Path $working 'source'
  & gh repo clone "$owner/$owner" $source -- --depth 1
  if($LASTEXITCODE -ne 0) { throw 'Unable to clone existing public profile repository.' }
  foreach($p in $projects){
    $name=$p.Name
    $copy=Join-Path $working $name
    Copy-Item -Path (Join-Path $source "labs/$name") -Destination $copy -Recurse
    Push-Location $copy
    try {
      & git init -b main
      if($LASTEXITCODE -ne 0) { throw "git init failed for $name" }
      & git add .
      & git commit -m 'feat: initial original open-source DevOps utility'
      if($LASTEXITCODE -ne 0) { throw "git commit failed. Set git user.name and user.email." }
      & gh repo create "$owner/$name" --public --source . --remote origin --push --description $p.Description
      if($LASTEXITCODE -ne 0) { throw "Could not publish $name" }
      & gh repo edit "$owner/$name" --add-topic devops --add-topic python --add-topic automation
      if($LASTEXITCODE -ne 0) { Write-Warning "Repository created but topic setup failed for $name." }
      Write-Host "Published: https://github.com/$owner/$name"
    } finally { Pop-Location }
  }
} finally {
  Write-Host "Working directory retained for inspection: $working"
}
