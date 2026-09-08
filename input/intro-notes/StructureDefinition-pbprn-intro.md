No data is entered directly into Health Connect; all Directory content is sourced from authoritative systems including [PCA](https://developer.digitalhealth.gov.au/fhir/provider-connect-australia/current/index.html?src=/), HI-Service, and NHSD.

### Peak Body Professional Registration Number (PBPRN)

The Peak Body Professional Registration Number profile defines an identifier for a healthcare practitioner’s professional registration, as recorded in the Health Connect Provider Directory context (as received from HI services). This identifier is used to capture the registration number assigned by a professional association or peak body, particularly for practitioners who are **not Ahpra-registered**, and is recorded against a Practitioner's HPI-I record.

### Usage notes

- This is a profile of the `identifier` element on [HCPD Practitioner](StructureDefinition-hcpd-practitioner.html) and [HCPD PractitionerRole](StructureDefinition-hcpd-practitionerrole.html).
- Use this profile when a practitioner's professional registration number is issued by a non-Ahpra professional association or peak body.
- **Cardinality differences**: HCPD Practitioner allows 0 to many PRN identifiers (`0..*`), while HCPD PractitionerRole allows only 0 to 1 PRN identifier (`0..1`).
- In this identifier profile the assigning system is **mandatory** but is not fixed. This is by design as this identifier may be used to represent many different non-Ahpra peak bodies. See [Supported Peak Body Systems](pbprn-systems.html) for the full list of valid `system` URIs.  
- The PRN should be used in addition to, or instead of, an Ahpra registration number, depending on the practitioner’s registration status.
- Ensure that the system and value are populated according to the assigning authority’s requirements for accurate identification and interoperability.
- The PRN enables implementers to distinguish between different types of practitioner registration numbers and to support Directory queries, reconciliation, and validation.

#### Key requirements

- The profile fixes the `type` element to the v2 identifier code `PRN` (Provider number) from the v2-0203 code system (this is implemented in the profile as `type = $v2-0203-int#PRN`). Implementations **SHOULD** use the following coding when constructing the `type` element:
    ```json
    {
        "coding": [
            {
                "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                "code": "PRN",
                "display": "Provider number"
            }
        ]
    }
    ```
- The `value` element is mandatory (cardinality 1..) and holds the practitioner's registration number as assigned by the authority (for example `1234567`).
- The `assigner` element is not constrained by this profile (it may be populated to reference the issuing organisation where available, but it is not required). Implementers are encouraged to populate `assigner.display` to improve provenance and traceability when the issuing Organization resource is not available.
- A warning-level invariant `inv-01-system-or-assigner` checks that a `system` or `assigner` (or both) is present to ensure proper identification of the authoritative body that issued the registration number.

Implementers must ensure that the Peak Body Registration Number is used only for valid, assigned registration numbers and that all required elements are present and correct. This supports accurate practitioner identification and data integrity across the Health Connect Provider Directory.