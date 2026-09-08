Extension: New_Patient_Availability
Id: new-patient-availability
Title: "New Patient Availability"
Description: "Indicates whether the healthcare service is accepting new patients. Patterned after PCA New Patient Availability extension.\n\nContext of Use: HealthcareService"
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/new-patient-availability"
* ^status = #active
* ^experimental = false
* ^purpose = "This extension addresses the business need for healthcare consumers and referrers to identify services that are accepting new patients, supporting efficient healthcare access and referral workflows."
* ^context.type = #element
* ^context.expression = "HealthcareService"

* value[x] only CodeableConcept
* valueCodeableConcept from https://healthterminologies.gov.au/fhir/ValueSet/new-patient-availability-1 (required)
* valueCodeableConcept ^short = "New patient availability status."
* valueCodeableConcept ^definition = "Coded indicator of whether the healthcare service is accepting new patients (bound to NCTS New Patient Availability value set)."
