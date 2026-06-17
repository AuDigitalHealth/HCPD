Profile: HCPD_Local_Identifier
Parent: Identifier
Id: hcpd-local-identifier
Title: "HCPD Local Identifier (HCPD-LI)"
Description: "This profile of Identifier defines a HCPD Local Identifier (HCPD-LI) used for system reference and internal business logic."
* ^experimental = false
* ^status = #active
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License."
* . ^short = "HCPD Local Identifier (HCPD-LI)"
* . ^definition = "Local Identifier for HCPD Location."
* type 1..
* type = $v2-0203-int#XX
* system 1..
* system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier" (exactly)
* value 1..
* system ^short = "HCPD Local Identifier system"
* system ^definition = "Canonical system for HCPD Local Identifiers (HCPD-LI)."
* value 1..1
* value ^short = "HCPD-LI"