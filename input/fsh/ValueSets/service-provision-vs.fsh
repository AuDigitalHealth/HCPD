ValueSet: Service_Provision_Code_VS
Id: service-provision-code-vs
Title: "Service Provision Code ValueSet"
Description: "The Service Provision Code ValueSet includes values that may be used to identify the service provision condition of a healthcare service."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/ValueSet/service-provision-code-vs"
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
* ^purpose = "This ValueSet addresses the business need to provide comprehensive billing arrangement information for healthcare services, extending beyond the base HL7 AU service provision conditions to include mixed billing scenarios specific to the Australian healthcare context."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* ^version = "1.0.0"
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"

* include http://terminology.hl7.org.au/CodeSystem/service-provision-conditions#BBO
* include http://terminology.hl7.org.au/CodeSystem/service-provision-conditions#FAP
* include http://terminology.hl7.org.au/CodeSystem/service-provision-conditions#NFE

* include codes from system http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs