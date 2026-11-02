#Requires -Version 5.1
<#
.SYNOPSIS
  Remove ONLY the 22 audited public forks from svrforge.
.DESCRIPTION
  Verifies the exact login, current GitHub public-fork metadata, protects nonfork
  and private repositories (including XIYARO/xiora), and requires an explicit
  irreversible deletion confirmation. Never changes visibility or source code.
.NOTES
  Requires GitHub CLI: gh auth login; gh auth refresh -h github.com -s delete_repo
  Review FORK-CLEANUP.md before using. The GitHub app cannot execute this script.
#>
$ErrorActionPreference = 'Stop'
$owner = 'svrforge'
$approvedNames = @(
  '90DaysOfDevOps',
  '90DaysOfDevOps-1',
  'aws-devops-project',
  'demo-counter-app',
  'deployed-cloud-native-monitoring-application-on-kubernetes',
  'devops-projects-001',
  'Docker-Zero-to-Hero',
  'dockerlabs',
  'End-to-End-Azure-DevSecOps-Project',
  'java-web-app-docker',
  'Jenkins-Zero-To-Hero',
  'kube2812project',
  'linkedin-skill-assessments-quizzes',
  'microservices',
  'mrdevops_java_app',
  'my-app',
  'postal',
  'Project-ECommerce-Application-Deployment',
  'shell-scripting-project',
  'sonarqube-version',
  'terraformazuredevops',
  'webapplication'
)
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw 'GitHub CLI is missing. Install gh and authenticate as svrforge.'
}
$loginText = & gh api user --jq '.login'
if ($LASTEXITCODE -ne 0 -or $loginText.Trim() -cne $owner) {
  throw 'ABORT: Authenticated account must be exactly svrforge.'
}
$rawList = & gh repo list $owner --limit 200 --json name,isFork,isPrivate
if ($LASTEXITCODE -ne 0) { throw 'ABORT: Cannot retrieve repo list.' }
$all = $rawList | ConvertFrom-Json
$publicForkNames = @($all | Where-Object { $_.isFork -eq $true -and $_.isPrivate -eq $false } | ForEach-Object { $_.name })
$unapproved = @($publicForkNames | Where-Object { $approvedNames -cnotcontains $_ })
$missing = @($approvedNames | Where-Object { $publicForkNames -cnotcontains $_ })
if ($unapproved.Count -gt 0 -or $missing.Count -gt 0) {
  Write-Host 'Public fork inventory changed since audit. Nothing deleted.' -ForegroundColor Yellow
  if ($unapproved.Count) { Write-Host ('Unexpected: ' + ($unapproved -join ', ')) }
  if ($missing.Count) { Write-Host ('Missing: ' + ($missing -join ', ')) }
  throw 'ABORT: Needs renewed verified audit, not automatic expansion.'
}
$reviewed = @()
foreach ($name in $approvedNames) {
  if ($name -match '(?i)xiyaro|xiora') { throw "ABORT: protected name $name" }
  $json = & gh api "repos/$owner/$name"
  if ($LASTEXITCODE -ne 0) { throw "ABORT: Cannot read metadata for $name" }
  $item = $json | ConvertFrom-Json
  if ($item.full_name -cne "$owner/$name" -or $item.fork -ne $true -or
      $item.private -ne $false -or -not $item.parent) {
    throw "ABORT: $name not confirmed to be owned public fork."
  }
  $reviewed += [PSCustomObject]@{
    Repository = $item.full_name
    Upstream = $item.parent.full_name
    Visibility = $item.visibility
    Fork = $item.fork
  }
}
if ($reviewed.Count -ne 22) { throw 'ABORT: Count mismatch.' }
Write-Host ''
Write-Host 'The following 22 CURRENT PUBLIC FORKS will be PERMANENTLY DELETED:' -ForegroundColor Yellow
$reviewed | Format-Table -AutoSize
$evidence = Join-Path ([System.IO.Path]::GetTempPath()) ('svrforge-fork-cleanup-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.json')
$reviewed | ConvertTo-Json -Depth 4 | Set-Content -Path $evidence -Encoding UTF8
Write-Host "Saved metadata inventory to $evidence"
Write-Host 'No existing private repo, XIYARO repo, profile repo, or nonfork will be touched.' -ForegroundColor Green
Write-Host 'This deletion cannot be undone from the GitHub UI.' -ForegroundColor Red
$confirmation = Read-Host 'To proceed type exactly DELETE-22-FORKS'
if ($confirmation -cne 'DELETE-22-FORKS') {
  Write-Host 'Cancelled. No repositories deleted.'
  return
}
$removed = 0
foreach ($name in $approvedNames) {
  # Recheck before EACH deletion: guard against changes between review and action.
  $check = & gh api "repos/$owner/$name"
  if ($LASTEXITCODE -ne 0) { throw "STOP: Could not verify $name before deletion." }
  $data = $check | ConvertFrom-Json
  if ($data.fork -ne $true -or $data.private -ne $false -or
      $data.full_name -cne "$owner/$name" -or $name -match '(?i)xiyaro|xiora') {
    throw "STOP: Protection check failed for $name."
  }
  & gh repo delete "$owner/$name" --yes
  if ($LASTEXITCODE -ne 0) {
    throw "STOP: Could not delete $name. $removed fork(s) already deleted. Resolve GitHub permissions and re-audit."
  }
  $removed++
  Write-Host "Deleted $removed/22: $owner/$name"
}
Write-Host "Deleted $removed verified forks. Existing nonfork/private repositories were not changed."
