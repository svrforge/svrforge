# Terraform infrastructure change review

## Goal

Explain **what the saved plan will change**, why it is needed, and how risk and cost are controlled. Infrastructure-as-code review cannot be replaced by regex checks alone.

## Recommended workflow

1. Review the PR diff, module source, provider constraints and lockfile.
2. Run `terraform fmt -check` and `terraform validate` in an isolated approved workspace.
3. Produce a Terraform plan only within the authorized environment and with the correct remote state/identity. Planning can contact cloud APIs and acquire state locks; it is **not strictly offline**.
4. Inspect the **saved** plan, keeping any output containing secrets inside an approved secure location.
5. Verify who can approve and apply the change, whether state is backed up, and how to recover.

```bash
terraform fmt -check -recursive
terraform validate
terraform show -no-color approved-plan.tfplan
```

**Security note:** Plans/state can contain secrets. Never commit `.tfstate`, `.tfplan`, provider credentials or raw plan JSON into public repositories.

## Risk matrix

| Change | Questions to answer |
|---|---|
| Destruction/replacement | Is data persistent? Is a recovery plan verified? |
| Network exposure | Are public CIDRs and security groups justified? |
| IAM | Does the new policy grant broader rights? |
| Compute/storage | What is the cost/availability impact? |
| Routing/DNS | Will an existing endpoint lose traffic? |
| Encryption/logging | Are existing protections preserved? |

## Approval note

**Business purpose:** ... · **Proposed plan digest:** ... · **Resources replaced:** ... · **Security review:** ... · **Expected monthly cost impact:** ... · **Rollback/recovery:** ... · **Approver:** ...

Never run `terraform apply` as part of a read-only audit. A plan is not a guarantee the cloud state will remain unchanged before application.
