No data is entered directly into Health Connect; all Directory content is sourced from authoritative systems including [PCA](https://developer.digitalhealth.gov.au/fhir/provider-connect-australia/current/index.html?src=/), HI-Service, and NHSD.

### Extensions
Extensions introduced in this profile:
* Provenance.target: [Target path](http://hl7.org/fhir/extensions/StructureDefinition-targetPath.html)

### Usage notes
The guidance below is organised by system role to clarify the different responsibilities for systems that create provenance records versus those that consume them.

#### Provenance resource utilisation patterns

The HCPD Provenance profile supports two distinct patterns of use:

**Resource-level provenance** tracks changes to an entire FHIR resource. In this pattern:
- The `target` element references the complete resource that was created, updated, or verified (constrained to HCPD profile types: HCPD_Organization, HCPD_Practitioner, etc.)
- The `activity` element categorizes the type of operation using codes from the Provenance Activity Type value set (CREATE, UPDATE, DELETE, VERIFY, etc.)
- The `recorded` element provides a timestamp indicating when the provenance event was recorded by the source system
- The `agent.who` element identifies the actor (organization, practitioner, or system) responsible for performing the activity
- The `entity` element, when present, references source records or systems that provided the data, with entity.role typically set to "source"

**Atomic element-level provenance** tracks changes to specific data elements within a resource. This more granular approach uses the [Target path](http://hl7.org/fhir/extensions/StructureDefinition-targetPath.html) extension (introduced in this profile) to enable precise tracking:
- The `target` element to reference the resource containing the changed elements
- The `target.extension[targetPath]` to specify exactly which data elements were affected using FHIRPath expressions, enabling atomic-level tracking
- Multiple targetPath extensions can be included to track changes to multiple elements in a single provenance record
- The same `activity`, `recorded`, `agent.who`, and `entity` elements as resource-level provenance

The atomic element-level approach is particularly valuable in Health Connect's context where Directory data may be selectively updated from different authoritative sources. For example, a practitioner's contact details might be updated from one source while their qualifications are verified from another, with separate provenance records documenting each specific change.

#### Systems consuming/auditing Provenance resources (searching systems)

- Systems that query or audit Provenance resources can use the FHIRPath expressions in `target.extension[targetPath].valueString` to identify the exact data elements that were changed. 
- When building reconciliation tools or audit trails, these FHIRPath expressions reference the changed elements in the target resource. For example, if a provenance record contains `target.extension[targetPath].valueString` = "telecom.where(system='phone').value", the consuming system knows that the practitioner's phone number was updated, and can use this path to highlight the specific changed field in an audit report.
- Note that the FHIRPath identifies which field changed but does not contain the actual values (old or new) 
- To see the current value, the consuming system would need to evaluate the FHIRPath against the current target resource.
- When processing audit trails, ensure that FHIRPath expressions are valid and can be successfully evaluated against the referenced target resource.

##### Search include parameters

This implementation supports the following `_include` parameter when searching for Provenance resources:

* `_include=Provenance:target` - Include the target resources (Organization, Location, HealthcareService, PractitionerRole, Practitioner, or Endpoint) that this Provenance resource tracks

This IG also supports the R4 SearchParameters for Provenance, which are detailed [here](https://hl7.org/fhir/R4/provenance.html#search).

##### Example usage

```text
GET /Provenance?agent.who=Organization/12345&_include=Provenance:target
```

This query searches for all provenance records where Organization/12345 was the agent performing the activity, and includes the actual resources (practitioners, locations, etc.) whose changes are documented by these provenance records.


