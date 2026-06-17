The [value sets](http://hl7.org/fhir/R4/valueset.html) and [code systems](http://hl7.org/fhir/R4/codesystem.html) listed below are defined as part of this implementation guide.

**Note:** This IG consumes terminology from external dependencies where appropriate and also defines a set of IG-local terminology. The sections below list the external terminology this IG references (split by source) and the terminology defined within this IG.

### External Terminology

#### AU Provider Directory (AU PD)

The IG reuses terminology published in the AU Provider Directory (AU PD) implementation guide where applicable. Key AU PD artefacts referenced by this IG include:

ValueSets
- [service-interfaces](https://build.fhir.org/ig/hl7au/au-fhir-pd/ValueSet-service-interfaces.html) — http://hl7.org.au/fhir/pd/ValueSet/service-interfaces
- [endpoint-payload-type](https://build.fhir.org/ig/hl7au/au-fhir-pd/ValueSet-endpoint-payload-type.html) — http://hl7.org.au/fhir/pd/ValueSet/endpoint-payload-type

CodeSystems
- [smd-interfaces](https://build.fhir.org/ig/hl7au/au-fhir-pd/CodeSystem-smd-interfaces.html) — http://hl7.org.au/fhir/pd/CodeSystem/smd-interfaces
- [endpoint-payload-type (AU PD)](https://build.fhir.org/ig/hl7au/au-fhir-pd/CodeSystem-endpoint-payload-type.html) — http://hl7.org.au/fhir/pd/CodeSystem/endpoint-payload-type

#### National Clinical Terminology Service (NCTS)

CodeSystems
- [Facility Amenities](https://healthterminologies.gov.au/fhir/CodeSystem/facility-amenity-1)
- [New Patient Availability](https://www.healthterminologies.gov.au/integration/R4/fhir/CodeSystem/new-patient-availability-1)
- [Service Eligibility](https://healthterminologies.gov.au/fhir/CodeSystem/service-eligibility-1)
- [IAR Levels of Care](https://healthterminologies.gov.au/fhir/CodeSystem/iar-levels-of-care-1)

ValueSets
- [Facility Amenities](https://healthterminologies.gov.au/fhir/ValueSet/facility-amenity-1)
- [New Patient Availability](https://www.healthterminologies.gov.au/integration/R4/fhir/ValueSet/new-patient-availability-1)
- [Service Delivery Role Type](https://healthterminologies.gov.au/fhir/ValueSet/service-delivery-location-role-type-1)
- [Service Eligibility](https://healthterminologies.gov.au/fhir/ValueSet/service-eligibility-1)
- [IAR Levels of Care](https://healthterminologies.gov.au/fhir/ValueSet/iar-levels-of-care-1)


### IG defined Terminology

Terminology which has been defined internally within this IG is listed below. Use of these NCTS profiles is an Australian Digital Health Agency conformance requirement for terminology artefacts intended to create alignment with NCTS publication.

- [https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4](https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4)
- [https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4](https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4)

#### Value sets
{% include list-simple-valuesets.xhtml %}


#### Code systems
{% include list-simple-codesystems.xhtml %}