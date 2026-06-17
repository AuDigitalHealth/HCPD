Invariant: inv-01-address-postalcode-4-digits
Description: "If present, postalCode shall be 4 digits"
Expression: "address.postalCode.matches('^[0-9]{4}$')"
Severity: #error

Profile: HCPD_Service_Coverage_Area
Parent: AUCoreLocation
Id: hcpd-service-coverage-area
Title: "HCPD Service Coverage Area"
Description: "This profile of Location represents an Australian geographic coverage area i.e. postcodes where this service is provided.
For a healthcare service, that is provided through a physical location but have eligibility restrictions applicable in terms of only residents for certain postcodes/suburbs can receive this service, then the details of coverage area and eligibility should be provided here."
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

* . ^short = "Australian geographic area in which a service is available."

* obeys inv-01-address-postalcode-4-digits

* address 1..1 MS
* address ^short = "The address that defines the coverage area where the service is available"

* address.city MS
* address.city ^short = "Australian city, town or suburb"
* address.city ^definition = "An Australian city, town or suburb where the service is available."

* address.state MS
* address.state ^short = "Australian state or territory"
* address.state ^definition = "An Australian state or territory where the service is available."
* address.state from $australian-states-territories-2 (required)

* address.postalCode MS

* address.country 1..1 MS
* address.country = "AU"
* address.country ^short = "Australia as a 2 digit ISO 3166 code"
* address.country ^definition = "The 2 digit ISO 3166 code for Australia (AU)."

* managingOrganization MS
* managingOrganization only Reference(HCPD_Organization)
