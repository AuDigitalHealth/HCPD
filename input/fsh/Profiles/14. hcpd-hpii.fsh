Profile: HCPD_HPII_Identifier
Parent: $au-hpii
Id: hcpd-hpii
Title: "HCPD Healthcare Provider Identifier (HCPD HPI-I)"
Description: "This identifier profile extends the AU HPI-I profile to include status extensions similar to those available in AU IHI. A HPI-I is assigned under the Healthcare Identifiers (HI) Service to a Practitioner."
* ^status = #active
* ^experimental = false
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2025 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* extension contains
    HI_Services_Identifier_Status named hcpd-hpii-status 1..1 MS
* extension[hcpd-hpii-status] ^short = "HPI-I status"
* extension[hcpd-hpii-status] ^definition = "HPI-I status associated with an HPI-I identifier."