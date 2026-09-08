### Search parameters
This IG defines and introduces several search parameters in addition to those inherited from R4, that make it easier to find and filter `HC Location` resources in Health Connect implementations.

#### Search parameters defined in this IG
The following search parameters are **defined by this IG** and **SHOULD** be supported:

- [`locmailaddress`](SearchParameter-location-locmailaddress.html) (Location.extension where url = HC preferred postal address extension). Supports `:contains` modifier. 
  - Search locations by the hcpd-preferred postal address stored in the location's hcpd-specific extension.
  - Example (string-only): `GET /Location?locmailaddress=PO%20Box%20123`

- [`locationamenities`](SearchParameter-location-amenities.html) (Location.extension where url = HC amenity extension)
  - Search for locations by their amenities using the HC amenity extension. Use token semantics for coded amenity values.
  - Example (display text): `GET /Location?locationamenities=WheelchairAccess`

- [`locationphysicaltype`](SearchParameter-location-physicaltype.html) (Location.physicalType)
  - Search for locations by their physicalType field. Use token semantics for coded physical type values from the Location Type (Physical) ValueSet.
  - Example: `GET /Location?locationphysicaltype=http://terminology.hl7.org/CodeSystem/location-physical-type|wa`

- [`suppressed`](SearchParameter-suppressed.html) (Location.extension where url = suppressedBy extension)
  - Search for locations by their suppression status. Use token semantics with a code from the [Responsible Party Type CodeSystem](CodeSystem-responsible-party-type.html).
  - Example (system\|code): `GET /Location?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|practitioner-initiated`
  - Example (code only): `GET /Location?suppressed=practitioner-initiated`
  - Example (system only): `GET /Location?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|`

#### Search parameters from R4
The following search parameters are **inherited from FHIR R4** and have been deemed useful for implementation within this IG. They **SHOULD** be supported:

- [`name (R4)`](https://hl7.org/fhir/R4/searchparameter-registry.html#name) (Location.name and Location.alias)
  - Search for locations by name and alias (partial searches supported).
  - Example: `GET /Location?name:contains=Telehealth`

- [`address (R4)`](https://hl7.org/fhir/R4/searchparameter-registry.html#address) (Location.address)
  - Search for locations by address (partial searches supported).
  - Example: `GET /Location?address=147-153%20Castlereagh%20Street`

- [`type (R4)`](https://hl7.org/fhir/R4/searchparameter-registry.html#type) (Location.type.coding)
  - Search for locations by their type using coded values. Use token semantics for precise code matching.
  - Available codes = MOBL, PTRES, SCHOOL, WORK, COMM, AMB, VI from the NCTS Delivery Location Role Type ValueSet
  - Example (code only): `GET /Location?type=MOBL`

- [`near`](https://hl7.org/fhir/R4/location.html#positional) (Location.position)
  - Search for locations by geographical proximity using latitude|longitude|distance format. 
  - Results can be sorted by distance using the `_sort` parameter. Documented [here](https://hapifhir.io/hapi-fhir/docs/introduction/changelog_2023.html#section11) under GitHub issue [#4650](https://github.com/hapifhir/hapi-fhir/issues/4650).

  - Sort modifiers: `_sort=near` (closest first), `_sort=-near` (furthest first).
  - Example: `GET /Location?near=-33.8688|151.2093|0.5` (within 0.5km of Sydney CBD coordinates)
  - Example with sorting: `GET /Location?near=-33.8688|151.2093|3&_sort=near` (closest locations first within 3km)

- [`status`](https://hl7.org/fhir/R4/location.html#search)
  - For HC Location records, implementers SHALL use only the following `Location.status` values: `active` or `inactive`. The `suspended` status is not used in HCPD.
  - Example: `GET /Location?status=active`

      **Note:** Adding `?status=inactive` records that are inactive. Implementers should be aware that returned results MAY include records marked for suppression; it is the responsibility of the implementer that suppressed records SHALL be filtered out before display.

Implementation note: `Location.status` values are constrained to `active` or `inactive` only. The `suspended` status is not used in HCPD.

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
        <td>name (R4)</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code></td>
        <td></td>
  </tr>
  <tr>
        <td>address (R4)</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code></td>
        <td></td>
  </tr>
  <tr>
        <td>locmailaddress</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code></td>
        <td></td>
  </tr>
  <tr>
      <td>locationamenities</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>locationphysicaltype</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>suppressed</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>type (R4)</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>near (R4)</td>
        <td><b>SHOULD</b></td>
        <td><code>special</code></td>
        <td>Geographical proximity search using latitude|longitude|distance format. Can be sorted by distance using _sort=near</td>
  </tr>
  <tr>
        <td>status (R4)</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>name+type</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>name+locationphysicaltype</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>name+locationamenities</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>address+type</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>address+locationphysicaltype</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>address+locationamenities</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>locmailaddress+type</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>locmailaddress+locationphysicaltype</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
      <td>locmailaddress+locationamenities</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
 </tbody>
</table>

### Search include parameters

This implementation supports the following `_include` parameters when searching for Location resources:

* `_include=Location:endpoint` - Include endpoint resources referenced by the `endpoint` element
* `_include=Location:organization` - Include organization resources referenced by the `managingOrganization` element

### Search reverse include parameters

This implementation supports the following `_revinclude` parameters when searching for Location resources:

* `_revinclude=HealthcareService:location` - Include HealthcareService resources that reference this Location
* `_revinclude=Provenance:target` - Include Provenance resources that track changes to this Location

#### Example usage

```text
GET /Location/456?_include=Location:endpoint&_revinclude=HealthcareService:location
```

This query returns the Location resource, its associated Endpoints, and all HealthcareServices at this Location.
