## Usage notes
This extension indicates whether a Health Connect Provider Directory resource has been deactivated and identifies the party responsible for initiating the status change. It carries coded information about the actor who initiated the deactivation and is applied to the `active` element (Organization, Practitioner, PractitionerRole, HealthcareService) or the `status` element (Location, Endpoint). This extension is expected to be present whenever that element indicates the resource is no longer active.

### Datatype and context
The DeactivatedBy extension is a simple extension with a single required CodeableConcept value. It is applied directly to the `active` or `status` element of the relevant HCPD resource profiles. The coded value is drawn from the [Responsible Party Type CodeSystem](http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type).

This extension is profiled on the following HCPD resource elements with fixed values:
- `Organization` — organisation-initiated only
- `Practitioner` — practitioner-initiated only
- `PractitionerRole` — either code permitted
- `HealthcareService` — organisation-initiated only
- `Location` — organisation-initiated only
- `Endpoint` — organisation-initiated only

### Deactivation scenarios

1. **Practitioner self-deactivation**:
   - Practitioner sets their own `active = false`, carrying `practitioner-initiated` in DeactivatedBy
   - This cascades to deactivate all their associated PractitionerRole resources

2. **Organisation-initiated deactivation**:
   - An organisation administrator sets `active = false` (or `status` to a non-active value) on any of their resources, carrying `organisation-initiated` in DeactivatedBy
   - When applied to an Organization, deactivation automatically cascades to all child HealthcareService, Location, PractitionerRole, and Endpoint resources

3. **PractitionerRole deactivation**:
   - A PractitionerRole may be deactivated by either party; the code indicates which actor initiated the change without affecting the referenced Practitioner

### Relationship to the Suppressed extension
Both DeactivatedBy and the Suppressed extension follow the same cascade hierarchy. The key distinction is:

| | Suppressed | DeactivatedBy |
|---|---|---|
| **Purpose** | Hides the resource from directory display while keeping it active in the system | Records who changed the `active`/`status` element to a non-active state |
| **Applied to** | The resource root | The `active` or `status` element directly |
| **Resource remains active?** | Yes — suppression is a visibility flag only | No — the resource is genuinely inactive |

### Cascade hierarchy
The deactivation cascade follows the same organisational hierarchy as suppression:

| Resource Type | organisation-initiated | practitioner-initiated |
|---|:---:|:---:|
| Organization | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| HealthcareService | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| Location | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| Endpoint | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| PractitionerRole | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #90EE90">✓</span> |
| Practitioner | <span style="background-color: #FFB6C1">✗</span> | <span style="background-color: #90EE90">✓</span> |
