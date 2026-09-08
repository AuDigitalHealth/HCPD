Profile: HCPD_Source_Identifier
Parent: Identifier
Id: hcpd-source-identifier
Title: "HCPD Source Identifier (HCPD-SI)"
Description: "This profile of Identifier defines a HCPD Source Identifier (HCPD-SI)."
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2025 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* . ^short = "HCPD Source Identifier (HCPD-SI)"
* . ^definition = "The HCPD Source Identifier (HCPD-SI) is issued by the source of data ingestion and then respected by each HCPD instance."
* type 1..1
* type = $v2-0203-int#RI
* type ^short = "Coded identifier type for HCPD Source identifier"
* system 1..1
* system ^short = "HCPD Source Identifier system. Not fixed to receive individual source systems."
* system ^definition = "Canonical system for HCPD Source Identifiers (HCPD-SI)."
* value 1..1
* value ^short = "Vendor Directory Identifier"

