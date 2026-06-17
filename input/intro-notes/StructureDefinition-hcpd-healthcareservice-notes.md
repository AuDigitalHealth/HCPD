### Search parameters
This IG defines and intoduces several search parameters in addition to those inherited, that make it easier to find and filter `HCPD Healthcare Service` resources in Health Connect implementations. The following search parameters are defined and **SHOULD** be supported:

#### Search parameters defined in FHIR R4
- [`service-type`](https://hl7.org/fhir/R4/healthcareservice.html) (HealthcareService.type)
  - Searches `HealthcareService.type`. It is a token search - use the fully-qualified `system|code` form to avoid ambiguity.
  - Examples:
  - Unencoded: `GET /HealthcareService?service-type=http://snomed.info/sct|1256161000168107`
  - Encoded: `GET /HealthcareService?service-type=http%3A%2F%2Fsnomed.info%2Fsct%2F32506021000036107%7C1256161000168107`

Note: Values come from the HCPD Healthcare Service value set (SNOMED). Use codes that are children of 224930009 ("Services"), excluding 700232004 ("General medical service").


#### Search parameters defined in this IG
The following search parameters are **defined by this IG** and **SHOULD** be supported:

- [`languages`](SearchParameter-languages.html) (HealthcareService.communication.coding OR PractitionerRole.extension.where(url='http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitioner-role-communication').value.ofType(CodeableConcept).coding)
  - Search for healthcare services by the languages they support for communication. This shared SearchParameter works for both HealthcareService and PractitionerRole resources. 
  - Supports `system|code` or `code`.  
  - Example: `GET /HealthcareService?languages=it` (Italian code for bcp-47)
  - Example: `GET /HealthcareService?languages=de` (German code for bcp-47)

- [`hsbilling`](SearchParameter-healthcareservice-billing.html) (HealthcareService.serviceProvisionCode)
  - Search for healthcare services by their billing or service provision conditions (for example, bulk billing, fees apply).
  - Example (preferred, unambiguous): `GET /HealthcareService?hsbilling=http://terminology.hl7.org.au/CodeSystem/service-provision-conditions|FAP`

##### Availability

- [`allday`](SearchParameter-allday.html) (HealthcareService.availableTime.allDay | PractitionerRole.availableTime.allDay)
  - Search for services/roles by whether they are available all day. Use token semantics for boolean values.
  - Example: `GET /HealthcareService?allday=true`
  - Example: `GET /PractitionerRole?allday=false`

- [`daysofweek`](SearchParameter-daysofweek.html) (HealthcareService.availableTime.daysOfWeek | PractitionerRole.availableTime.daysOfWeek)
  - Search for services/roles by days of the week they are available. Supports multiple days using OR logic.
  - Available day codes: mon, tue, wed, thu, fri, sat, sun
  - Example: `GET /HealthcareService?daysofweek=mon`
  - Example: `GET /HealthcareService?daysofweek=mon,tue,wed` (multiple days)
  - Example: `GET /PractitionerRole?daysofweek=fri`

**Availability (Start/End Time)**
- Shared parameters: [starttime](SearchParameter-starttime.html) and [endtime](SearchParameter-endtime.html) work for both HealthcareService and PractitionerRole.
  - Format: Numeric HHMM (e.g., 0800 for 8:00 AM, 1730 for 5:30 PM). Do not include colons in queries.
  - Matching: Numeric comparisons with prefix operators.
  - Prefix operators: `eq` (=), `ge` (>=), `gt` (>), `le` (<=), `lt` (<), `ne` (!=). When no prefix is specified, `eq` is implied.
  - Examples:
  - Exact start: GET /HealthcareService?starttime=0800
  - Starts at or after 9 AM: GET /HealthcareService?starttime=ge0900
  - Starts before 10 AM: GET /PractitionerRole?starttime=lt1000
  - Exact end: GET /HealthcareService?endtime=1700
  - Ends at or before 4 PM: GET /HealthcareService?endtime=le1600
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
        <td>service-type (R4) </td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>languages</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>hsbilling</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>service-type+languages</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>service-type+hsbilling</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>languages+hsbilling</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>languages+daysofweek</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>hsbilling+daysofweek</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
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

This implementation supports the following `_include` parameters when searching for HealthcareService resources:

* `_include=HealthcareService:location` - Include Location resources referenced by the `location` element
* `_include=HealthcareService:organization` - Include Organization resources referenced by the `providedBy` element
* `_include=HealthcareService:endpoint` - Include Endpoint resources referenced by the `endpoint` element

### Search reverse include parameters

This implementation supports the following `_revinclude` parameters when searching for HealthcareService resources:

* `_revinclude=PractitionerRole:service` - Include PractitionerRole resources that reference this HealthcareService
* `_revinclude=Provenance:target` - Include Provenance resources that track changes to this HealthcareService

#### Example usage

```text
GET /HealthcareService/789?_include=HealthcareService:location&_include=HealthcareService:organization&_revinclude=PractitionerRole:service
```

This query returns the HealthcareService with its Location, providing Organization, and all associated PractitionerRoles.








