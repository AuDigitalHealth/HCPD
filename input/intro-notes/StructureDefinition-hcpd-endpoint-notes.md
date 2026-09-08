
### Search parameters
This IG defines and introduces several search parameters in addition to those inherited from R4, that make it easier to find and filter `HCPD Endpoint` resources in Health Connect implementations.

#### Search parameters defined in this IG
The following search parameters are **defined by this IG** and **SHOULD** be supported:

- [`hcepi`](SearchParameter-endpoint-hcepi.html) (Endpoint.identifier where type = Resource Identifier)
  - Find endpoint records by the HCPD identifier assigned in Health Connect. Uses token matching for exact value matching.
  - Example: `GET /Endpoint?hcepi=EP001234567890`

- [`payloadmimetype`](SearchParameter-endpoint-payloadmimetype.html) (Endpoint.payloadMimeType)
  - Search for endpoints that advertise support for a specific MIME type for payloads.
  
- Typical values present in this IG's example data are:
  - `application/pdf`
  - `application/fhir+xml`
  - `application/fhir+json`
  - Example: `GET /Endpoint?payloadmimetype=application%2Ffhir%2Bjson`

- [`epurl`](SearchParameter-endpoint-url.html) (alias used in this IG for Endpoint.address)
  - Convenience alias used in this IG's documentation to search by endpoint address.
  - Example: `GET /Endpoint?epurl=https://smd.sydneyhospital.org.au/secure-messaging/endpoint`

- [`suppressed`](SearchParameter-suppressed.html) (Endpoint.extension where url = suppressedBy extension)
  - Search for endpoints by their suppression status. Use token semantics with a code from the [Responsible Party Type CodeSystem](CodeSystem-responsible-party-type.html).
  - Example (system\|code): `GET /Endpoint?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|practitioner-initiated`
  - Example (code only): `GET /Endpoint?suppressed=practitioner-initiated`
  - Example (system only): `GET /Endpoint?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|`

#### Search parameters from R4
The following search parameters are **inherited from FHIR R4** and have been deemed useful for implementation within this IG. They **SHOULD** be supported:

- [`name (R4)`](https://hl7.org/fhir/R4/SearchParameter-registry.html#name) (Endpoint.name)
  - Search for endpoints by name (partial matches may be supported).
  - Example: `GET /Endpoint?name=My%20GP%20Service`

- [`connection-type (R4)`](https://hl7.org/fhir/R4/SearchParameter-registry.html#connection-type) (Endpoint.connectionType)
  - Search for endpoints by connection type (for example, `hl7-fhir-rest` or other interface codes).
  - Example: `GET /Endpoint?connection-type=http://terminology.hl7.org.au/CodeSystem/endpoint-connection-type|secure-messaging`

- [`payload-type (R4)`](https://hl7.org/fhir/R4/SearchParameter-registry.html#payload-type) (Endpoint.payloadType)
  - Search for endpoints by payload type (CodeableConcept). Use [AU PD Endpoint payload type ValueSet codes](http://hl7.org.au/fhir/pd/ValueSet/endpoint-payload-type) where applicable.
  - Example: `GET /Endpoint?payload-type=http://hl7.org.au/fhir/pd/CodeSystem/endpoint-payload-type|some-payload`

- [`status (R4)`](https://hl7.org/fhir/R4/endpoint.html#search) (Endpoint.status)
  - Filter endpoints by their operational status. Use token semantics with one of the defined status values: `active`, `suspended`, `error`, `off`, `entered-in-error`, `test`.
  - Example: `GET /Endpoint?status=active`


<br/><br/>*Note:* Support for _id is mandatory for a responder and optional for a requester. Where the expectation for a search parameter differs between actors, the table below will reflect the stronger conformance requirement.

<table class="list">
<tbody>
  <tr>
	<th>Parameter(s)</th>
	<th>Conformance </th>
	<th>Type(s)</th>
	<th>Requirements (when used alone or in combination)</th>
  </tr>
  <tr>
		<td>_id</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>status (R4)</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>hcepi</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>name (R4)</td>
		<td><b>SHOULD</b></td>
		<td><code>string</code></td>
		<td></td>
  </tr>
    <tr>
		<td>connection-type (R4)</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code></td>
		<td></td>
  </tr>
	<tr>
		<td>payload-type (R4)</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>epurl</td>
		<td><b>SHOULD</b></td>
		<td><code>uri</code></td>
		<td></td>
  </tr>
  <tr>
		<td>suppressed</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>payloadmimetype</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>name+connection-type</td>
		<td><b>SHOULD</b></td>
		<td><code>string</code>+<code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>name+payload-type</td>
		<td><b>SHOULD</b></td>
		<td><code>string</code>+<code>token</code></td>
		<td></td>
  </tr>
  <tr>
		<td>connection-type+payloadmimetype</td>
		<td><b>SHOULD</b></td>
		<td><code>token</code>+<code>token</code></td>
		<td></td>
  </tr>
 </tbody>
</table>


### Search reverse include parameters

This implementation supports the following `_revinclude` parameters when searching for Endpoint resources:

- `_revinclude=HealthcareService:endpoint` - Include HealthcareService resources that reference this Endpoint
- `_revinclude=Location:endpoint` - Include Location resources that reference this Endpoint  
- `_revinclude=PractitionerRole:endpoint` - Include PractitionerRole resources that reference this Endpoint
- `_revinclude=Provenance:target` - Include Provenance resources that track changes to this Endpoint

#### Example usage

```text
GET /Endpoint/303?_revinclude=HealthcareService:endpoint&_revinclude=Location:endpoint
```

This query returns the Endpoint resource along with all HealthcareServices and Locations that use this Endpoint.

