### Search parameters for HCPD Practitioner 
This IG provides a small set of convenience SearchParameters to make it easier to find HC Practitioner resources; it also expects implementers to support common Practitioner parameters from AU Core & AU Base.

#### Search parameters defined within AU Core and AU Base
How search queries can be performed using the HPI-I are described in [AU Core documentation](https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-practitioner.html#notes).

#### Search parameters defined in FHIR R4
The following **standard FHIR R4** search parameters are **recommended** for practitioner identifier and name searches:

- [`identifier`](https://hl7.org/fhir/R4/practitioner.html#search) (Practitioner.identifier)
  - Search practitioners by HPI-I. The AU Core guidance favours using the system|value (token) form.
  - Example: `GET /Practitioner?identifier=http://ns.electronichealth.net.au/id/hi/hpii/1.0|8003619900015717`

      **Note:** This standard search parameter does NOT work on identifiers nested within the qualification data element. Therefore, a custom search parameter `identifier-r5` is described below.

- [`name`](https://hl7.org/fhir/R4/practitioner.html#search) (Practitioner.name)
  - Search by practitioner's name across all name types (official, preferred, etc.)
  - Supports `:contains` modifier for partial matching
  - Example (single name component): `GET /Practitioner?name:contains=Dr`
  - Example (single name component): `GET /Practitioner?name:contains=Helen`
  - Example (multiple components with AND logic): `GET /Practitioner?name:contains=John&name:contains=Helen`
  - **Note**: For combined queries, repeat the parameter for AND logic. Comma-separated values create OR logic (e.g., `name:contains=John,Helen` finds "John" OR "Helen")

- [`active`](https://hl7.org/fhir/R4/practitioner.html#search) (Practitioner.active)
  - Filter practitioners by whether they are currently active. Use token semantics for boolean values.
  - Example: `GET /Practitioner?active=true`
      
      **Note:** Adding `?active=false` returns records that are inactive, Implementers should be aware that returned results MAY include records marked for suppression; it is the responsibility of the implementer that suppressed records SHALL be filtered out before display.

#### Search parameters defined in this IG
The following search parameters are **defined by this IG** and **SHOULD** be supported:

- [`identifier-r5`](SearchParameter-practitioner-identifier-r5.html) (Practitioner.identifier | Practitioner.qualification.identifier)
  - Search a Practitioner record by any identifier, including HPI-I and Professional Registration Number (PRN), mimicks R5-style identifier searching. Supports both `Practitioner.identifier` and `Practitioner.qualification.identifier`.
  - This search parameter supports the following query use cases where:
  - A `peakbodyregistrationnumber` OR `ahpraregistrationnumber` is supplied with or without an accompanying system.
  **Note** that when a system is not supplied this may result in duplicate value matches, originating from multiple different issuing organizations.
  - Examples:
    - HPI-I (with system): `GET /Practitioner?identifier-r5=http://ns.electronichealth.net.au/id/hi/hpii/1.0|8003619900015717`
    - HPI-I (without system): `GET /Practitioner?identifier-r5=8003619900015717`
    - Ahpra (with system): `GET /Practitioner?identifier-r5=http://hl7.org.au/id/ahpra-registration-number|MED0000932945`
    - Ahpra (without system): `GET /Practitioner?identifier-r5=MED0000932945`
    - PRN (with system): `GET /Practitioner?identifier-r5=http://example.org/fhir/identifier/acha-prn|PRN-123456`
    - PRN (without system): `GET /Practitioner?identifier-r5=PRN-123456`

- [`rsg`](SearchParameter-practitioner-rsg.html) (Practitioner.extension(recordedSexorGender).valueCodeableConcept)
  - Search by a practitioner's recorded sex or gender.
  - **Important**: This searches on the 'value' element within the [individual-recordedSexOrGender](https://hl7.org/fhir/extensions/5.2.0/StructureDefinition-individual-recordedSexOrGender.html) extension (typically administrative gender codes). However, to fully understand the meaning, in the returned results the complete extension structure inclusive of metadata elements: `type`, `source`, `sourceDocument`, `effectivePeriod` should be appraised as a whole.
  - Example: `GET /Practitioner?rsg=http://hl7.org/fhir/administrative-gender|male`

- [`suppressed`](SearchParameter-suppressed.html) (Practitioner.extension where url = suppressedBy extension)
  - Search for practitioners by their suppression status. Use token semantics with a code from the [Responsible Party Type CodeSystem](CodeSystem-responsible-party-type.html).
  - Example (system\|code): `GET /Practitioner?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|practitioner-initiated`
  - Example (code only): `GET /Practitioner?suppressed=practitioner-initiated`
  - Example (system only): `GET /Practitioner?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|`

- [`regprof`](SearchParameter-practitioner-regprof.html) (Practitioner.qualification.code.text) Supports both `:contains` & `:exact` modifiers.
  - Search by a practitioner's registered profession using string values.
  - Supports `:contains` modifier for partial matching, `:exact` modifier for precise matching.
  - Example: `GET /Practitioner?regprof=Psychologist`

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
        <td>identifier (R4)</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td>Use this parameter to search identifiers such as HPI-I using system|value or value or system format. **note** This does NOT work on identifiers nested within the qualification data element.</td>
  </tr>
    <tr>
        <td>identifier-r5</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code></td>
        <td>Search by any identifier, i.e AHPRA, HPI-I or PRN. R5-style identifier search across Practitioner.identifier and Practitioner.qualification.identifier</td>
  </tr>
  <tr>
        <td>name (R4)</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code></td>
        <td>Search by practitioner's name across all name types (official, preferred, etc.). Standard FHIR R4 search parameter.</td>
  </tr>
  <tr>
        <td>active (R4)</td>
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
      <td>regprof</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code></td>
        <td>Search by registered profession using string values in `qualification.code.text`.</td>
  </tr>
  <tr>
        <td>identifier-r5+rsg</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>name+rsg</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td></td>
  </tr>
  <tr>
        <td>identifier-r5+rsg</td>
        <td><b>SHOULD</b></td>
        <td><code>token</code>+<code>token</code></td>
        <td>Search by any identifier and recorded sex or gender</td>
  </tr>
  <tr>
      <td>regprof+rsg</td>
        <td><b>SHOULD</b></td>
        <td><code>string</code>+<code>token</code></td>
        <td>Search by registered profession and recorded sex/gender</td>
  </tr>
 </tbody>
</table>

### Search reverse include parameters

This implementation supports the following `_revinclude` parameters when searching for Practitioner resources:

* `_revinclude=PractitionerRole:practitioner` - Include PractitionerRole resources that reference this Practitioner
* `_revinclude=Provenance:target` - Include Provenance resources that track changes to this Practitioner

#### Example usage

```text
GET /Practitioner?_revinclude=PractitionerRole:practitioner
```

This query returns all Practitioner resources and their associated roles and positions.


```text
GET /Practitioner?_revinclude=PractitionerRole:practitioner
```

This query returns all Practitioner resources and their associated roles and positions.
