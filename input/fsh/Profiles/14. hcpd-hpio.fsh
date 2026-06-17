Profile: HCPD_HPIO_Identifier
Parent: $au-hpio
Id: hcpd-hpio
Title: "HCPD Healthcare Provider Identifier - Organisation (HCPD HPI-O)"
Description: "This identifier profile extends the AU HPI-O profile to include an organization classification extension to indicate whether the organization is a 'seed' or 'network' type."
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
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."

* extension contains
    HI_Service_Organisation_Classification named hi-org-classification 1..1 MS
* extension[hi-org-classification] ^short = "Organization classification"
* extension[hi-org-classification] ^definition = "Organization classification for HPI-O identifiers - can be 'seed' or 'network'."