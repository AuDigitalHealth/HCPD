Extension: Active_Period
Id: active-period
Title: "Active Period"
Description: "The period during which the HealthcareService is considered active."
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/active-period"
* ^status = #active
* ^experimental = false
* ^purpose = "This extension addresses the business need to specify time-bounded availability of healthcare services in the provider directory, enabling accurate representation of service offerings that may have specific active periods."
* ^context.type = #element
* ^context.expression = "HealthcareService"

* value[x] only Period
* valuePeriod ^short = "The period during which the HealthcareService is active."
* valuePeriod ^definition = "The time period during which the HealthcareService is considered active."