Extension: HI_Service_Organisation_Classification
Id: hi-org-classification
Title: "HI Service Organisation Classification"
Description: "Extension to record whether an organisation's HPIO is a 'seed' or 'network' type in the HI service."
Context: Organization.identifier
* ^status = #active
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^purpose = "This extension addresses the business need to classify organizations in the Health Connect Provider Directory as either seed or network entities, supporting proper organizational hierarchy representation and directory management workflows."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* ^experimental = false
* . ^short = "Indicates whether an organisation is a seed or network"
* . ^definition = "This extension applies to Organization, and indicates whether an organisation is a seed or network in the HI service."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hi-org-classification"
* ^status = #active
* value[x] only CodeableConcept
* valueCodeableConcept from HI_Org_Classification_VS (required)
* valueCodeableConcept ^short = "Indicates whether an organisation is a seed or network"
* valueCodeableConcept ^definition = "This extension applies to Organization, and indicates whether an organisation is a seed or network in the HI service."