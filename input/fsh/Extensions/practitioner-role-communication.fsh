Extension: PractitionerRole_Communication
Id: practitioner-role-communication
Title: "Practitioner Role Communication"
Description: "Practitioner Role Communication. This extension captures communication preferences and capabilities for a practitioner in a given role."
Context: PractitionerRole
* . ^short = "Practitioner role communication preferences"
* . ^definition = "This extension applies to PractitionerRole, and represents a language the practitioner can use in patient communication when acting in a role at a HealthcareService."
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/practitioner-role-communication"
* ^status = #active
* ^experimental = false

* value[x] only CodeableConcept
* valueCodeableConcept 0..1
* valueCodeableConcept from $common-languages-australia-2 (required)