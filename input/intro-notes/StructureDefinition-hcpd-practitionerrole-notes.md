### Search parameters
This IG defines and introduces several search parameters in addition to those inherited that make it easier to find and filter `HCPD PractitionerRole` resources in Health Connect implementations. 

#### Search parameters defined in FHIR R4
The following **standard FHIR R4** search parameters are **recommended** for PractitionerRole searching:

- [`identifier`](https://hl7.org/fhir/R4/practitionerrole.html#search) (PractitionerRole.identifier)
  - This search parameter supports searching by any identifier including:
  - **Medicare Provider Number** (system defined in AU Base)
  - **Ahpra Registration Number** (system defined in AU Base) 
  - **Professional Registration Number (PRN)** (peak body identifiers)
  - How search queries can be performed using Medicare Provider Number or Ahpra identifier are described in [AU Core](https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-practitionerrole.html#notes).
  - This search parameter supports the following query use cases where:
  - A peakbodyregistrationnumber OR Ahpra number value is supplied with or without an accompanying system.
      **note** that when a system is not supplied this may result in duplicate value matches, originating from multiple different issuing organizations. 
  - Examples:
  - Medicare Provider Number: `GET /PractitionerRole?identifier=http://ns.electronichealth.net.au/id/medicare-provider-number|2426621B`
  - Ahpra Registration Number: `GET /PractitionerRole?identifier=http://hl7.org.au/id/ahpra-registration-number|MED0000932945`
  - PRN (with system): `GET /PractitionerRole?identifier=http://example.org/fhir/identifier/examplesystem|PRN-123456`
  - PRN (without system): `GET /PractitionerRole?identifier=PRN-123456`

- [`role`](https://hl7.org/fhir/R4/practitionerrole.html#search) (PractitionerRole.code). Token based search: provide `system|code` or `code`.
  - Search for PractitionerRoles by SNOMED or other coding values in `PractitionerRole.code`.
  - Example: `GET /PractitionerRole?role=309339007`

#### Search parameters defined in this IG
The following search parameters are **defined by this IG** and **SHOULD** be supported:

- [`languages`](SearchParameter-languages.html) (PractitionerRole.extension where url = HC practitioner role communication).  Supports `system|code` or `code`.  
  - Find practitioner roles by the languages spoken by the practitioner in this role, stored in the HC communication extension. This is a shared SearchParameter that works across both HealthcareService and PractitionerRole resources.
  - Example: `GET /PractitionerRole?languages=it` (Italian code for bcp-47)
  - Example: `GET /PractitionerRole?languages=de` (German code for bcp-47)

##### Availability 

- [`allday`](SearchParameter-allday.html) (PractitionerRole.availableTime.allDay)
  - Search for practitioner roles that are available all day, i.e. 24 hours. This shared SearchParameter works for both HealthcareService and PractitionerRole resources.
  - Example (all day): `GET /PractitionerRole?allday=true`
  - Example (not all day): `GET /PractitionerRole?allday=false`

- [`daysofweek`](SearchParameter-daysofweek.html) (PractitionerRole.availableTime.daysOfWeek)
  - Search for practitioner roles by days of the week they are available. This shared SearchParameter works for both HealthcareService and PractitionerRole resources.
  - Example (Monday): `GET /PractitionerRole?daysofweek=mon`
  - Example (weekend): `GET /PractitionerRole?daysofweek=sat,sun`

**Availability (Start/End Time)**
- Shared parameters: [starttime](SearchParameter-starttime.md) and [endtime](SearchParameter-endtime.md) work for both HealthcareService and PractitionerRole.
  - Format: Numeric HHMM (e.g., 0800 for 8:00 AM, 1730 for 5:30 PM). Do not include colons in queries.
  - Matching: Numeric comparisons with prefix operators.
  - Prefix operators: `eq` (=), `ge` (>=), `gt` (>), `le` (<=), `lt` (<), `ne` (!=). When no prefix is specified, `eq` is implied.
  - Examples:
  - Exact start: GET /PractitionerRole?starttime=0900
  - Starts before 10 AM: GET /PractitionerRole?starttime=lt1000
  - Exact end: GET /PractitionerRole?endtime=1700
  - Ends after 6 PM: GET /PractitionerRole?endtime=gt1800

**Limitation:** Combination in a query cannot guarantee the correct pairing of `starttime` and `endtime` from the same availableTime block. Use of `daysofweek` can help filter, but may still return mixed results when multiple blocks exist for a day. At an implementation layer further filtering may be needed to ensure correct pairing.

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
        <td>identifier</td>
        <td><b>SHALL</b></td>
        <td><code>token</code></td>
        <td>Requester Actors SHOULD support search using Medicare Provider Number or Ahpra number as defined in the profile.</td>
  </tr>
  <tr>
        <td>role</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td>Standard FHIR `role` search parameter on PractitionerRole.code</td>
  </tr>
  <tr>
        <td>languages</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>identifier+languages</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>allday</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td>Shared SearchParameter for availability across HealthcareService and PractitionerRole</td>
  </tr>
  <tr>
      <td>daysofweek</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td>Shared SearchParameter for availability across HealthcareService and PractitionerRole</td>
  </tr>
  <tr>
      <td>starttime</td>
      <td><b>SHOULD</b></td>
      <td><code>number</code></td>
      <td>Shared SearchParameter. Numeric HHMM format (e.g., 0800).</td>
  </tr>
  <tr>
      <td>endtime</td>
      <td><b>SHOULD</b></td>
      <td><code>number</code></td>
      <td>Shared SearchParameter. Numeric HHMM format (e.g., 1700).</td>
  </tr>
  <tr>
      <td>identifier+daysofweek</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>identifier+starttime</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>number</code></td>
        <td></td>
  </tr>
      <tr>
            <td>role+daysofweek</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code>+<code>token</code></td>
            <td></td>
      </tr>
      <tr>
            <td>role+starttime</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code>+<code>number</code></td>
            <td></td>
      </tr>
      <tr>
      <td>daysofweek+starttime+endtime</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>number</code>+<code>number</code></td>
        <td></td>
  </tr>
 </tbody>
</table>

### Search include parameters

This implementation supports the following `_include` parameters when searching for PractitionerRole resources:

* `_include=PractitionerRole:practitioner` - Include Practitioner resources referenced by the `practitioner` element
* `_include=PractitionerRole:service` - Include HealthcareService resources referenced by the `healthcareService` element
* `_include=PractitionerRole:organization` - Include Organization resources referenced by the `organization` element
* `_include=PractitionerRole:location` - Include Location resources referenced by the `location` element
* `_include=PractitionerRole:endpoint` - Include Endpoint resources referenced by the `endpoint` element

### Search reverse include parameters

This implementation supports the following `_revinclude` parameters when searching for PractitionerRole resources:

* `_revinclude=Provenance:target` - Include Provenance resources that track changes to this PractitionerRole

#### Example usage

```text
GET /PractitionerRole/101?_include=PractitionerRole:practitioner&_include=PractitionerRole:organization&_include=PractitionerRole:location
```

This query returns the PractitionerRole with the associated Practitioner, Organization, and Location details.

