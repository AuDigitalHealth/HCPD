No data is entered directly into Health Connect; all Directory content is sourced from authoritative systems including [PCA](https://developer.digitalhealth.gov.au/fhir/provider-connect-australia/current/index.html?src=/), HI-Service, and NHSD.

### Extensions
Extensions introduced in this profile:
* Organization: [HCPD Organization Classification](StructureDefinition-hi-org-classification.html)
* Organization: [Suppressed](StructureDefinition-suppressed.html)
* Organization: [Deactivated](StructureDefinition-deactivated.html)

#### Suppressed
The [extension:suppressed](StructureDefinition-suppressed.html) is used to indicate if this resource should be hidden from display in the Provider Directory. An Organisation may elect to hide their visibility from those searching the Health Connect Provider Directory system. When this extension is applied to a HCPD Organization resource, its use is constrained to just the `organisation-initiated` code. When present it **SHALL** be excluded from Provider Directory listings. For more details, please see the extension intro notes.

#### Organisation classification
The [extension:hi-org-classification](StructureDefinition-hi-org-classification.html) is used to indicate whether an organisation's HPI-O and HSP-O record in the HI Service is classified as a 'seed' or 'network' type. Note HSP-O can only be of 'seed' type.

The following identifiers both profile the aforementioned classification extension within their definitions:
    * [HCPD HPI-O](StructureDefinition-hcpd-hpio.html) on Organization.identifier[hpio]
    * [HCPD HSP-O](StructureDefinition-hcpd-hspo.html) on Organization.identifier[hspo]

### Usage notes 
The following guidance maps key information requirements for HCPD Organization records to fields in the profile. Where a requirement references the HI Service as the authoritative source, publishers SHOULD prefer and validate values-such as organisation identifiers and names-against the HI Service where practicable.

#### Identifiers
The HCPD Organization profile supports the identifier slices introduced in AU Core (as indicated by the must support flag). At least one authoritative identifier (for example HPI-O, HSP-O, ABN, or other recognised identifier) SHOULD be provided to enable consistent and correct identification of the healthcare organisation and to support validation against the HI Service where applicable. Organisation identifiers can also be used as search parameters to locate organisation records.

A HCPD Organization resource may also contain additional business partner identifiers. These are considered secondary to the HPI-O/HSP-O and MAY not match identifier slices defined in [AU Core Organization](https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-organization.html).

#### Name suppression
Where the organisation name must not be disclosed, implementers MAY populate `Organization.name` using the [Data Absent Reason](http://hl7.org/fhir/StructureDefinition/data-absent-reason) extension and set the code to `masked`.

Note: HI Service is expected to assign only one national identifier type to an Organization (either HPI‑O or HSP‑O), not both. As such, the profile defines the following invariants:

- `inv-01-identifier-hpi-or-hsp-required`: Either an HPI-O (hpio) or an HSP-O (hspo) identifier must be present on the Organization. (severity: error)
- `inv-02-identifier-not-both-hpio-hspo`: Warn if both HPI-O and HSP-O identifiers are present on the same Organization. (severity: warning)

