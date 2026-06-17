Extension: Referral_Information_For_Referrer
Id: referral-information-for-referrer
Title: "Referral Information for Referrer"
Description: "Referral instructions and information for healthcare service providers that may wish to refer patients / clients to the healthcare service. "
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/referral-information-for-referrer"
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
* ^context.type = #element
* ^context.expression = "HealthcareService"
* value[x] only markdown
* valueMarkdown ^short = "Referral information for referrer"
* valueMarkdown ^definition = "Information for referrers about referral requirements for this healthcare service."
