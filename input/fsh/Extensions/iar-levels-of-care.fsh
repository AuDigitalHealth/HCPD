Extension: IAR_Levels_Of_Care
Id: iar-levels-of-care
Title: "IAR Levels of Care"
Description: "Indicates the IAR (Initial Assessment and Referral) Levels of Care for a healthcare service.\n\nContext of Use: HealthcareService\n\nCodes from: http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/hcpd-iar-levels-of-care"
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/iar-levels-of-care"
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
* ^purpose = "This extension addresses the business requirement to classify mental healthcare services according to the National Initial Assessment and Referral (IAR) framework levels of care, enabling appropriate service matching and referral processes within the provider directory."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. This resource includes material that is based on Commonwealth of Australia material."
* ^context.type = #element
* ^context.expression = "HealthcareService"
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "IAR Levels of Care for the healthcare service."
* valueCodeableConcept ^definition = "The Initial Assessment and Referral (IAR) Levels of Care for the healthcare service."
* valueCodeableConcept from $IARValueSet (required)