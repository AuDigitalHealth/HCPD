## Scope
This section describes the structure and intended use for a HCPD Export Response List resource. This resource is used **ONLY** within the context of the [Bulk Data Extract](bulk-data-extraction.html) capability of the HCPD system. Practitioners and Organizations may elect to no longer have their data published on the HCPD system. This intent can be communicated through the upstream data ingestion source (PCA) and will subsequently cascade to HCPD.  

The HCPD Export Response List resource is used to communicate to [Client Requester Actors](ActorDefinition-requester-actor-health-connect.html) which resources **SHALL** be removed from their local systems. Conformance with this requirement is mandatory. Client Requester Actors **SHALL** establish and maintain processes to ensure that the identified resources are removed in accordance with this specification.

## Usage notes

The List resource contains entries with identifiers organized by resource type slicing based on the identifier system. Each entry represents a resource that must be removed from downstream systems.

### Supported identifier systems

<table class="grid">
<thead>
<tr>
<th>Resource Type(s)</th>
<th>Identifier System</th>
<th>Identifier Name</th>
</tr>
</thead>
<tbody>
<tr>
<td>Organization</td>
<td>http://ns.electronichealth.net.au/id/hi/hpio/1.0</td>
<td><a href="StructureDefinition-hcpd-hpio.html">HPI-O</a></td>
</tr>
<tr>
<td>Organization</td>
<td>http://ns.electronichealth.net.au/id/hi/hspo/1.0</td>
<td><a href="StructureDefinition-hcpd-hspo.html">HSP-O</a></td>
</tr>
<tr>
<td>Practitioner</td>
<td>http://ns.electronichealth.net.au/id/hi/hpii/1.0</td>
<td><a href="https://hl7.org.au/fhir/6.0.0/StructureDefinition-au-hpii.html">HPI-I</a></td>
</tr>
<tr>
<td>Location, HealthcareService, PractitionerRole, Endpoint</td>
<td>http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier</td>
<td><a href="StructureDefinition-hcpd-local-identifier.html">HCPD Local Identifier</a></td>
</tr>
</tbody>
</table> 

## Usage notes
The HCPD Export Response List resource contains identifiers for HCPD resources that should be removed, i.e. (Organization, HealthcareService, Location, Practitioner, PractitionerRole & EndPoint instances). 
- Individual resources are flagged for removal via use of the `entry` elements with `entry.item.identifier` values. 
- Each entry contains an `entry.item.identifier` with the `system|value` pair of the resource to be removed.
- The identifier systems indicate the resource type and particular identifiers that are used and can be expected by implementers:

### Implementation requirements and processing
Client Requester Actors of the Bulk Data Extract capability **SHALL** establish processes/mechanisms where identifiers contained within a `HCPD Export Response List` resource can be referenced to resources, and then those resources are to be purged from their local systems.


