## Usage notes 
This extension is used to convey whether the parent resource should be hidden from display in the Provider Directory. It carries coded information about the actor who initiated the suppression.

### Datatype and context
The Suppressed extension is a complex extension that contains information about suppression behaviour. It includes a required `suppressedBy` sub-extension (CodeableConcept) that indicates who initiated the suppression request. The coded values are drawn from the [HCPD Responsible Party Type CodeSystem](CodeSystem-responsible-party-type.html), and the extension also includes an optional `includeSelf` sub-extension (boolean) for Organization-specific behaviour. 

This extension is profiled on the following HCPD resources: Organization, Practitioner, PractitionerRole, HealthcareService, Location, and Endpoint.
- Being an optional cardinality, when absent the resource is visible in Provider Directory listings
- When present, it indicates the resource is suppressed and identifies who initiated the suppression
- For Organization resources, the Suppressed extension includes an `includeSelf` sub-extension that controls whether the Organization itself is suppressed in addition to cascade suppression of child resources

### Suppression scenarios
This extension enables several suppression patterns:

1. **Practitioner self-suppression**:
   - Practitioner with Suppressed extension (practitioner-initiated) automatically hides themselves and cascades to suppress all their roles
   
2. **Organization suppression with cascade control**:
   - Organization with Suppressed extension (organisation-initiated) triggers cascade suppression to all child resources
   - The nested `includeSelf` sub-extension controls whether the Organization itself is also hidden:
     - When true: Organization hides itself and automatically cascades to suppress everything related (locations, services, etc.)
     - When false or missing: Organization remains visible in Provider Directory listings
   
3. **PractitionerRole specific suppression**:
   - PractitionerRole with Suppressed extension is hidden without affecting the Practitioner profile
   - Can be initiated by either practitioner-initiated or organisation-initiated codes

### Processing and client obligations
- The default state of this extension, being optional, is that it is not present on a profile and that resource is visible.
- When present, the Suppressed extension indicates the resource should be suppressed from Provider Directory listings.
- For Organization profiles, the nested `includeSelf` sub-extension controls whether the Organization itself is suppressed in addition to cascade suppression of child resources.
- Suppressed resources remain stored in the internal Health Connect Provider Directory system but are excluded from the external IG and API responses.
- Downstream vendors no longer receive the resources in API payloads but must still handle the consequences of suppression (i.e., missing expected resources).
- Client requester actors of the bulk data export service may receive suppressed resources when the client uses the `_since` parameter in their bulk export request.
- Client requester actors **SHALL** be required to cleanse their local systems of suppressed resources using the related identifiers.

### Hierarchical suppression model
The HCPD Provider Directory operates on a hierarchical model where certain resources are considered children of others. This hierarchy determines the cascading behaviour of suppression and which initiator codes are permitted on each resource type.

**Suppression cascade:**
- **Organization** (parent) → HealthcareService, Location, PractitionerRole, Endpoint (children)
  - When the Suppressed extension is present on an Organization, suppression automatically cascades to its child HealthcareService, Location, PractitionerRole, and Endpoint resources

The coded values in Suppressed indicate who has the authority to suppress a resource, with some resources having competing authorities due to their position in the hierarchy.

| Resource Type | organisation-initiated,<br/>includeSelf = T | organisation-initiated,<br/>includeSelf = F | practitioner-initiated |
|---|:---:|:---:|:---:|
| Organization | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> | <span style="background-color: #FFB6C1">✗</span> |
| HealthcareService | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| Location | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| Endpoint | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| PractitionerRole | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #90EE90">✓</span> |
| Practitioner | <span style="background-color: #FFB6C1">✗</span> | <span style="background-color: #FFB6C1">✗</span> | <span style="background-color: #90EE90">✓</span> |