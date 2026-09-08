Profile: HCPD_Local_Identifier
Parent: Identifier
Id: hcpd-local-identifier
Title: "HCPD Local Identifier (HCPD-LI)"
Description: "This profile of Identifier defines a HCPD Local Identifier (HCPD-LI) used for system reference and internal business logic."
* ^experimental = false
* ^status = #active
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