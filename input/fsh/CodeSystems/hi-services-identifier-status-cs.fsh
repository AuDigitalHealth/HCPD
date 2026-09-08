CodeSystem: HI_Services_Identifier_Status_CS
Id: hi-services-identifier-status-cs
Title: "HI Services Identifier Status Code System"
Description: "This code system defines concepts that identify the status of a Healthcare Services Identifier, i.e. HPII, HPIO or HSPO."
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4"
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/hi-services-identifier-status-cs"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^valueSet = "http://digitalhealth.gov.au/fhir/hcpd/ValueSet/hi-services-identifier-status-vs"
* ^compositional = false
* ^versionNeeded = true
* ^content = #complete
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* #A "Active" "The Healthcare Services Identifier is currently active and operational."
* #D "Deactivated" "The Healthcare Services Identifier is currently deactivated and not operational."
* #R "Retired" "The Healthcare Services Identifier has been retired and is no longer in use."