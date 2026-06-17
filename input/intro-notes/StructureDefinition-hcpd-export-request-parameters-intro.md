## Scope
This section describes the structure and intended use for a HCPD Export Request Parameters resource. This resource is used **ONLY** within the context of the [Bulk Data Extract](bulk-data-extraction.html) capability of the HCPD system for submitting export requests. It contains the parameters that control the scope, format, and filtering of bulk data export operations.

The HCPD Export Request Parameters resource is used by [Client Requestor Actors](ActorDefinition-requester-actor-health-connect.html) to specify their bulk data export requirements. This profile ensures consistent parameter usage across different export scenarios including geographical filtering, organization-centric extraction, and healthcare service type-centric extraction.

## Usage notes
The HCPD Export Request Parameters resource contains standard FHIR bulk export parameters that control the export operation. This profile enforces proper parameter usage and ensures that type and typeFilter parameters are synchronized.

### Standard FHIR Bulk Export parameters
- `_type` - Comma-separated list of resource types to include (Organization,Location,Practitioner,PractitionerRole,HealthcareService,Endpoint,Provenance)
- `_since` - Only resources updated since specified timestamp (ISO 8601 format)
- `_typeFilter` - Apply export criteria to specific resource types (e.g., `Location?address-state=NSW`)
- `_outputFormat` - Output format (mandatory, fixed to application/fhir+ndjson)

### Parameter synchronization
The profile includes invariant `hcpd-exp-1` which enforces that the number of `_typeFilter` parameters **SHALL** equal the number of resource types specified in the comma-separated `_type` parameter. This ensures that each resource type has a corresponding filter, maintaining consistent export behavior.

### Supported export scenarios
Based on the parameter combinations, the following export scenarios are supported:

#### Geographical filtering
- **State-based**: _typeFilter=Location?address-state=[STATE]
- **Postcode-based**: _typeFilter=Location?address-postalcode=[POSTCODE]
- **Proximity-based**: _typeFilter=Location?near=[LAT]|[LNG]|[DISTANCE]
- **City/suburb**: _typeFilter=Location?address-city=[CITY]

#### Organization-centric extraction
- **HPI-O identifier**: _typeFilter=Organization?identifier=http://ns.electronichealth.net.au/id/hi/hpio/1.0|[HPIO]
- **ABN identifier**: _typeFilter=Organization?identifier=http://hl7.org.au/id/abn|[ABN]
- **ACN identifier**: _typeFilter=Organization?identifier=http://hl7.org.au/id/acn|[ACN]
- **Organization name**: _typeFilter=Organization?name=[NAME]

#### Healthcare service type-centric extraction
- **SNOMED-CT service types**: _typeFilter=HealthcareService?service-type=[SYSTEM]|[CODE]

### Implementation requirements
Client Requestor Actors **SHALL** use this profile structure when submitting bulk export requests to ensure consistent parameter formatting and validation. When using `_type` and `_typeFilter` parameters, the number of filter parameters **MUST** equal the number of resource types specified (enforced by invariant hcpd-exp-1).

### Parameter reference

<table class="grid">
<thead>
<tr>
<th>Parameter Name</th>
<th>Cardinality</th>
<th>Value Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>_outputFormat</td>
<td>1..1</td>
<td>string</td>
<td>Fixed to "application/fhir+ndjson"</td>
</tr>
<tr>
<td>_type</td>
<td>1..*</td>
<td>string</td>
<td>Comma-separated resource types: Organization,Location,HealthcareService,Practitioner,PractitionerRole,Endpoint,Provenance</td>
</tr>
<tr>
<td>_typeFilter</td>
<td>1..*</td>
<td>string</td>
<td>FHIR search parameters for filtering specific resource types (one entry per _type value)</td>
</tr>
<tr>
<td>_since</td>
<td>0..1</td>
<td>instant</td>
<td>ISO 8601 timestamp - only export resources updated since this date</td>
</tr>
</tbody>
</table>