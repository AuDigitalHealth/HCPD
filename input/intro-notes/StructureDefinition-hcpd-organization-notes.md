### Search parameters for HCPD Organization

This IG defines no new SearchParameters for the Organization resource; it expects implementers to support common Organization parameters from both AU Core and R4.

#### Search parameters defined within AU Core
How these identifier searches can be used is described in [AU Core documentation](https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-organization.html#notes). AU Core recommends using the standard FHIR `identifier` search parameter (token, system|value) for organization identifiers. Examples:

      - ABN: `GET /Organization?identifier=http://hl7.org.au/id/abn|12345678912`
      - ACN: `GET /Organization?identifier=http://hl7.org.au/id/acn|123456789`
      - HPI-O: `GET /Organization?identifier=http://ns.electronichealth.net.au/id/hi/hpio/1.0|8003626566707032`
      - HSP-O: `GET /Organization?identifier=http://ns.electronichealth.net.au/id/hi/hspo/1.0|8003640001234569`

#### Search parameters defined within FHIR R4
The following parameters are inherited from [R4](https://hl7.org/fhir/R4/organization.html) and are commonly useful; implementers SHOULD support them as indicated.

- [`name`](https://hl7.org/fhir/R4/organization.html#search)  
      Standard R4 parameter that searches Organization.name and Organization.alias (partial matches supported). String type. 
      Example: `GET /Organization?name=Example%20Aged`

- [`type`](https://hl7.org/fhir/R4/organization.html#search)  
      Standard R4 parameter that searches Organization.type.coding using token semantics (system|code).
      Example: `Organization?type=http://snomed.info/sct|257652008`

- [`active`](https://hl7.org/fhir/R4/organization.html#search)  
      Standard R4 parameter that filters organizations by their active status (boolean token).
      Example: `GET /Organization?active=true`

      **Note:** Adding `?active=false` returns records that are inactive, Implementers should be aware that returned results MAY include records marked for suppression; it is the responsibility of the implementer that suppressed records SHALL be filtered out before display.

#### Search parameters defined in this IG
The following search parameters are **defined by this IG** and **SHOULD** be supported:

- [`suppressed`](SearchParameter-suppressed.html) (Organization.extension where url = suppressedBy extension)
  - Search for organizations by their suppression status. Use token semantics with a code from the [Responsible Party Type CodeSystem](CodeSystem-responsible-party-type.html).
  - Example (system\|code): `GET /Organization?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|organisation-initiated`
  - Example (code only): `GET /Organization?suppressed=organisation-initiated`
  - Example (system only): `GET /Organization?suppressed=http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type|`

<table class="list">
<tbody>
      <tr>
            <th>Parameter(s)</th>
            <th>Conformance</th>
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
            <td>HPI-O</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code></td>
            <td>The Health Connect Provider Directory Requester and Provider Directory SHOULD support search using the HPI-O identifier as defined in the profile.</td>
      </tr>
      <tr>
            <td>HSP-O</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code></td>
            <td>The Health Connect Provider Directory Requester and Provider Directory SHOULD support search using the HSP-O identifier as defined in the profile.</td>
      </tr>
      <tr>
            <td>ABN</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code></td>
            <td>The Health Connect Provider Directory Requester and Provider Directory SHOULD support search using the ABN identifier as defined in the profile.</td>
      </tr>
      <tr>
            <td>ACN</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code></td>
            <td>Use the standard `identifier` token form. Example: <code>?identifier=http://hl7.org.au/id/acn|123456789</code></td>
      </tr>
            <tr>
            <td>name (R4)</td>
            <td><b>SHOULD</b></td>
            <td><code>string</code></td>
            <td></td>
      </tr>
      <tr>
            <td>type (R4)</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code></td>
            <td></td>
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
            <td>HPI-O + type</td>
            <td><b>SHOULD</b></td>
            <td><code>token</code> + <code>token</code></td>
            <td></td>
      </tr>
</tbody>
</table>

### Search include parameters

This implementation supports the following `_include` parameters when searching for Organization resources:

* `_include=Organization:partof` - Include parent organizations referenced by the `partOf` element

### Search reverse include parameters

This implementation supports the following `_revinclude` parameters when searching for Organization resources:

* `_revinclude=Location:organization` - Include Location resources that reference this Organization through their `managingOrganization` element
* `_revinclude=Provenance:target` - Include Provenance resources that track changes to this Organization

#### Example usage

This query returns a Bundle containing the Organization with id 123, plus any Location and HealthcareService resources that reference it.

```text
GET /Organization?_id=123&_revinclude=Location:organization&_revinclude=HealthcareService:organization
```

This query returns a Bundle containing the Organization with id 123, plus any PractitionerRole resources where PractitionerRole.organization references that Organization.

```text
GET /Organization?_id=123&_revinclude=PractitionerRole:organization
```