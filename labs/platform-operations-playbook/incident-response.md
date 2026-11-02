# Incident response · Engineering guide

## 1. Declare and contain

Identify the customer-facing symptoms, timestamps, scope and safety concerns. Assign a single incident commander and communications owner. For security incidents, involve security/legal responders and preserve evidence under approved procedures.

## 2. Establish a timeline

Capture first observed signal, detection time, changed systems, confirmed impacts, mitigating actions and validation points. Mark observations separate from hypotheses.

## 3. Stabilize before optimizing

Prefer low-risk, reversible mitigations. Any rollback, traffic switch, restart or credential rotation is a **change** requiring authority and coordination. Avoid unapproved broad fixes during uncertainty.

## 4. Communication format

**Status:** Investigating / Mitigating / Monitoring / Resolved

**Customer impact:** What is confirmed; state "unknown" for uncertainty.

**Current action:** Who is executing the next approved action.

**Next checkpoint:** Time and responsible owner.

**Evidence:** Sanitized dashboard / incident ticket references.

## 5. Recovery verification

Confirm critical user journeys, background jobs, queue processing, dependencies, authentication, customer notifications and error budgets. Watch for delayed or duplicate effects after partial recovery.

## 6. Post-incident review

Focus on detection gaps, safeguards, root-contributing factors, unclear ownership, toil and test coverage. Assign specific action items with owners and validation criteria. Avoid blame-driven narratives and fabricated timelines.

## Example update

> We are investigating elevated errors for the checkout API in the approved production environment. The impact scope is still being verified. The on-call team is comparing the deployment timeline with application and dependency telemetry. No remediation has been performed yet. Next update will follow the incident communications schedule.

Example only; not a statement about a real incident.
