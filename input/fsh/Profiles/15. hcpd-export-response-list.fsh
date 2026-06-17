Profile: HCPD_Export_Response_List
Parent: List
Id: hcpd-export-response-list
Title: "HCPD Export Response List"
Description: "This profile defines a List resource used in context of the Bulk Data Extraction capability. This communicates which resources should be removed from downstream systems. It MAY contain identifiers from ALL HCPD resource types."
* ^status = #active
* ^experimental = false
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^purpose = "This profile addresses the business requirement for indicating to downstream client requester systems which resources should be cleansed, once parties have indicated their intent to not have their data published on HCPD."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* . ^short = "HCPD BDE List Resource for Bulk Data Extract"
* . ^definition = "Defines how a List resource is represented within the HCPD. Context of use being the Bulk Data Extraction capability for resource removal operations."

* status = #current
* mode = #working
* title 1..1 MS
* title = "HCPD Resources for Removal"
* title ^short = "Fixed title for HCPD removal list"

* entry 1..* MS
* entry ^short = "Identifiers for removal by HCPD client systems" 
* entry ^definition = "Each entry contains an identifier flagged for removal from HCPD client requester systems."
* entry ^slicing.discriminator.type = #pattern
* entry ^slicing.discriminator.path = "item.identifier.system"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slice based on identifier system to group entries by resource type for removal"

* entry contains
    Practitioner 0..* and
    Organization_HPIO 0..* and
    Organization_HSPO 0..* and
    HCPD_Local 0..*

* entry[Practitioner].item.identifier 1..1 MS
* entry[Practitioner].item.identifier.system 1..1 MS
* entry[Practitioner].item.identifier.system = "http://ns.electronichealth.net.au/id/hi/hpii/1.0" (exactly)
* entry[Practitioner].item.identifier ^short = "HPI-I identifier for practitioner removal"

* entry[Organization_HPIO].item.identifier 1..1 MS
* entry[Organization_HPIO].item.identifier.system 1..1 MS
* entry[Organization_HPIO].item.identifier.system = "http://ns.electronichealth.net.au/id/hi/hpio/1.0" (exactly)
* entry[Organization_HPIO].item.identifier ^short = "HPI-O identifier for organization removal"

* entry[Organization_HSPO].item.identifier 1..1 MS
* entry[Organization_HSPO].item.identifier.system 1..1 MS
* entry[Organization_HSPO].item.identifier.system = "http://ns.electronichealth.net.au/id/hi/hspo/1.0" (exactly)
* entry[Organization_HSPO].item.identifier ^short = "HSP-O identifier for organization removal"

* entry[HCPD_Local].item.identifier 1..1 MS
* entry[HCPD_Local].item.identifier.system 1..1 MS
* entry[HCPD_Local].item.identifier.system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier" (exactly)
* entry[HCPD_Local].item.identifier ^short = "HCPD local identifier for Location, HealthcareService, Endpoint, or PractitionerRole removal"