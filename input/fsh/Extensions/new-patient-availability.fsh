Extension: New_Patient_Availability
Id: new-patient-availability
Title: "New Patient Availability"
Description: "Indicates whether the healthcare service is accepting new patients. Patterned after PCA New Patient Availability extension.\n\nContext of Use: HealthcareService"
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/new-patient-availability"
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
* ^purpose = "This extension addresses the business need for healthcare consumers and referrers to identify services that are accepting new patients, supporting efficient healthcare access and referral workflows within the provider directory system."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* ^context.type = #element
* ^context.expression = "HealthcareService"
* value[x] only CodeableConcept
* valueCodeableConcept from https://www.healthterminologies.gov.au/integration/R4/fhir/ValueSet/new-patient-availability-1 (required)
* valueCodeableConcept ^short = "New patient availability status."
* valueCodeableConcept ^definition = "Coded indicator of whether the healthcare service is accepting new patients (bound to NCTS New Patient Availability value set)."
