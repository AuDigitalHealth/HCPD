Extension: Active_Period
Id: active-period
Title: "Active Period"
Description: "The period during which the HealthcareService is considered active in the Health Connect Provider Directory Responder. Patterned after PCA Active Period."
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/active-period"
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
* ^purpose = "This extension addresses the business need to specify time-bounded availability of healthcare services in the provider directory, enabling accurate representation of service offerings that may have specific active periods."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* ^context.type = #element
* ^context.expression = "HealthcareService"
* value[x] only Period
* valuePeriod ^short = "The period during which the HealthcareService is active."
* valuePeriod ^definition = "The time period during which the HealthcareService is considered active in the Health Connect Provider Directory Responder."