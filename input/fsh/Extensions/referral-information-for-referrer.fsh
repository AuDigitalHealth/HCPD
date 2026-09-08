Extension: Referral_Information_For_Referrer
Id: referral-information-for-referrer
Title: "Referral Information for Referrer"
Description: "Referral instructions and information for healthcare service providers that may wish to refer patients / clients to the healthcare service. "
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/referral-information-for-referrer"
* ^status = #active
* ^experimental = false
* ^context.type = #element
* ^context.expression = "HealthcareService"

* value[x] only markdown
* valueMarkdown ^short = "Referral information for referrer"
* valueMarkdown ^definition = "Information for referrers about referral requirements for this healthcare service."
