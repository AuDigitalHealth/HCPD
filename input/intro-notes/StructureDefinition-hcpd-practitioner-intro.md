No data is entered directly into Health Connect; all Directory content is sourced from authoritative systems including [PCA](https://developer.digitalhealth.gov.au/fhir/provider-connect-australia/current/index.html?src=/), HI-Service, and NHSD.

### Extensions
Extensions introduced in this profile:
* Practitioner: [Suppressed](StructureDefinition-suppressed.html)
* Practitioner: [Deactivated](StructureDefinition-deactivated.html)

#### Suppressed
The [extension:suppressed](StructureDefinition-suppressed.html) is used to indicate if this resource should be hidden from display in the Provider Directory. A Practitioner may elect to hide their visibility from those searching the Health Connect Provider Directory system. Presence of the extension indicates the resource is suppressed. When this extension is applied to a HCPD Practitioner resource, its use is constrained to just the `practitioner-initiated` code. For more details, please see the extension intro notes.

### Usage notes
The following guidance maps key information requirements for HCPD Practitioner records to fields in the profile. Where a requirement references the HI Service as the authoritative source, publishers SHOULD prefer and validate values-such as practitioner identifiers, and names.

#### Identifiers

**Required Identifier:**
* **HPI-I** - Healthcare Provider Identifier - Individual (mandatory)

#### Professional Registration and Profession
Professional registration should be carried in the `qualification` element. The registration number of the Practitioner should be populated in `qualification.identifier`; the practitioner's profession should be sent as free text in `qualification.code.text`.

  - `qualification.identifier`: Registration number issued by the regulatory body (either issued by Ahpra or a non-Ahpra peak body). Follow the applicable identifier profile for format and issuer information.
  - `qualification.code.text`: The practitioner's profession linked to the registration number as a human-readable string. Because there is no single, authoritative ValueSet that covers all professions reliably, send the profession in `code.text`.
  - `qualification.code.coding` (optional): Only use coded values when you have an authoritative, stable code system for that profession. When `coding` is included, also populate `code.text` with the same label.

Notes:
- For Ahpra-registered practitioners include the Ahpra registration number in `qualification.identifier`. If you can map the profession to a reliable Ahpra code you may include `qualification.code.coding`, but still provide `qualification.code.text`.
- For peak body (non-Ahpra) registrations include the issuing organisation in `qualification.issuer.display` or, when attaching issuer details to the identifier itself, use `qualification.identifier.assigner.display` or `qualification.identifier.system` as appropriate.

This profile requires profession to be present as human-readable text in `qualification.code.text` when the profession is known; coded professions are optional.

#### Personal contact details
Practitioners may optionally provide personal contact details for inclusion in the Provider Directory. This includes `personalPhoneNumber` and `personalEmailAddress`. Publishing systems MUST only include and display these personal contact details if the practitioner has explicitly opted in to being listed; treat these fields as sensitive and do not expose them publicly unless the practitioner has consented.

#### Unsupported Practitioner data attributes
HCPD is currently not authorised to collect, store, use, disclose, or use as search parameters the following Practitioner data attributes. Where a search parameter exists, use of these elements as search parameters is discouraged:

- Gender Identity
- Gender
- Birth Date
- Photo
- Address
- PBSPrescriberNumber

For practitioner sex or gender searches in HCPD, use the supported data element `Recorded Sex or gender (RSG)` rather than `gender` or `gender identity`. Where a search or display requirement refers to sex or gender, publishers SHOULD map to RSG and SHOULD NOT expose `gender` or `gender identity` as user-facing search parameters.

### Data Integrity and Validation

This profile includes invariants to ensure data consistency and proper professional credentialing.

#### Professional Registration Invariants

**`inv-01-qualification-registration-required` (error):**
Ensures at least one professional registration is present in qualifications:
  - At least one qualification with Ahpra registration identifier OR
  - At least one qualification with a peak body registration identifier

**Implementation Validation:**
- Each qualification will include both an identifier and appropriate profession code (at least qualification.code.text). 
