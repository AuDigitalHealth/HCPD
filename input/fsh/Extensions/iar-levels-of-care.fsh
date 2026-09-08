Extension: IAR_Levels_Of_Care
Id: iar-levels-of-care
Title: "IAR Levels of Care"
Description: "Indicates the IAR (Initial Assessment and Referral) Levels of Care for a healthcare service."
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/iar-levels-of-care"
* ^status = #active
* ^experimental = false
* ^purpose = "This extension addresses the business requirement to classify mental healthcare services according to the National Initial Assessment and Referral (IAR) framework levels of care, enabling appropriate service matching and referral processes."
* ^context.type = #element
* ^context.expression = "HealthcareService"

* value[x] only CodeableConcept
* valueCodeableConcept ^short = "IAR Levels of Care for the healthcare service."
* valueCodeableConcept ^definition = "The Initial Assessment and Referral (IAR) Levels of Care for the healthcare service."
* valueCodeableConcept from $IARValueSet (required)