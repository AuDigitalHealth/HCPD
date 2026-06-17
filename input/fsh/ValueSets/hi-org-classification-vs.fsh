ValueSet: HI_Org_Classification_VS
Id: hi-org-classification-vs
Title: "HI Service Organization Classification ValueSet"
Description: "All codes in the HI Service Organization Classification CodeSystem code system."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/ValueSet/hi-org-classification-vs"
* ^status = #active
* ^experimental = false
* ^date = "2026-04-29"
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^purpose = "This ValueSet supports the identification and classification of organisations within provider directory systems, enabling systems to distinguish between seed and network organization types for directory management purposes."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* include codes from system http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/hi-org-classification-cs