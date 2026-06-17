CodeSystem: ServiceProvision_CS
Id: service-provision-cs
Title: "Service Provision CodeSystem"
Description: "The Service Provision CodeSystem defines a concept (in addition to those defined in [Service Provision Conditions Australian Concepts](https://hl7.org.au/fhir/4.1.0/CodeSystem-service-provision-conditions.html) that may be used to identify the service provision condition of a healthcare service in HCPD."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs"
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
* ^purpose = "This CodeSystem makes available additional service provision codes beyond those available in the HL7 AU Base, specifically to support mixed billing scenarios within the Health Connect Provider Directory."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* ^caseSensitive = true
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete
* ^count = 1
* ^version = "1.0.0"
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4"

* #MIX "Mixed Billing" "Bulk billing available with conditions, fees may apply"