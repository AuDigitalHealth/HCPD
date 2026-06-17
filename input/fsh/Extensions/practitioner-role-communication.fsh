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
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* value[x] only CodeableConcept
* valueCodeableConcept 0..1
* valueCodeableConcept from $common-languages-australia-2 (required)