Extension: HI_Services_Identifier_Status
Id: hi-services-identifier-status
Title: "HI Services Identifier Status"
Description: "Indicates the status of the Australian Healthcare Services Identifier."
Context: Identifier
* ^status = #active
* ^experimental = false
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2025 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* . ^short = "Indicates the status of the Australian Healthcare Services Identifier."
* . ^definition = "The status of the Australian Healthcare Services Identifier at the last date of verification by HI services. Only services with status 'Active' should be displayed & discoverable externally, whereas the record of services with any other status are retained for internal auditing, tracking, reporting & analytics purposes."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hi-services-identifier-status"
* valueCoding 1..1
* valueCoding from HI_Services_Identifier_Status_VS (required)