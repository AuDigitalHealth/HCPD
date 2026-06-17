CodeSystem: HI_Org_Classification_CS
Id: hi-org-classification-cs
Title: "HI Service Organisation Classification CodeSystem"
Description: "Internal code system that describes whether an organisation is a 'seed' or 'network' type in the HI Service."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/hi-org-classification-cs"
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
* ^purpose = "This CodeSystem supports the classification of organisations within provider directory systems, enabling the distinction between 'seed' organisations (primary entities in the HI Service) and 'network' organisations (subsidiary or related entities)."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* ^caseSensitive = true
* ^compositional = false
* ^versionNeeded = true
* ^content = #complete
* ^version = "1.0.0"
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4"
* #seed "Seed" "The organisation is a 'seed' in the HI Service"
* #network "Network" "The organisation is a 'network' in the HI Service"
