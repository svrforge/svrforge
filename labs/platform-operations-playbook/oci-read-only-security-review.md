# Oracle Cloud Infrastructure · Read-only security review

## Boundary

This guide helps an authorized operator collect evidence from OCI for a baseline assessment. Confirm the permitted tenancy, compartments and IAM policies first. Never collect credentials, private keys, customer payloads or unredacted logs.

## Review domains

| Domain | Evidence to collect | Typical concern |
|---|---|---|
| IAM | Users/groups, policies, dynamic groups, federated identities | Unnecessary broad privileges |
| Network | VCNs, route tables, NSGs, security lists, public IP inventory | Unexpected internet exposure |
| Compute/Kubernetes | Shape inventory, cluster endpoint exposure, version support | Unsupported versions or open endpoints |
| Storage | Bucket visibility, encryption, retention and lifecycle policies | Public access or weak retention |
| Logging | Audit logging, flow/service logs, alert destinations | Missing coverage or excessive retention |
| Key management | Key lifecycle and rotation configuration | Unknown owners or expired key policies |

Example **read-only** commands (authorization and OCI CLI configuration required):

```bash
oci iam compartment list --all
oci iam policy list --compartment-id <approved-compartment-ocid> --all
oci network vcn list --compartment-id <approved-compartment-ocid> --all
oci network nsg list --compartment-id <approved-compartment-ocid> --all
oci os bucket list --compartment-id <approved-compartment-ocid> --all
```

Note: the exact OCI CLI command availability and IAM scopes depend on the deployed provider/CLI version. Query only approved compartments.

## Severity method

**Critical:** confirmed externally exploitable weakness or active compromise with material impact.

**High:** credible attack path to sensitive systems or broad privilege with weak compensating control.

**Medium:** meaningful hardening gap with limited exploitability or exposure.

**Low/Info:** hygiene improvement, insufficient evidence or future risk.

Never infer an exploit from an open CIDR alone without checking reachability, listener configuration and compensating controls. Distinguish **not assessed** from **passed**.

## Report each finding with

ID, category, asset alias, time, evidence reference, observed fact, risk hypothesis, impact, likelihood, severity, recommendation, compensating control, owner and validation steps.

Keep redacted screenshots and command outputs in organization-approved evidence storage, not in public pull requests.
