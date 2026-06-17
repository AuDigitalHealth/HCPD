Instance: example-hcpd-export-response-list-1
InstanceOf: HCPD_Export_Response_List
Usage: #example
Title: "HCPD Export Response List Example: Resources for Removal"
Description: "An example List resource conforming to the HCPD Export Response List profile, containing identifiers of resources flagged for removal from downstream systems."

* meta.lastUpdated = "2026-03-24T10:30:00+10:00"
* status = #current
* mode = #working
* title = "HCPD Resources for Removal"

// Practitioner identifier to be removed
* entry[Practitioner][+].item.identifier.system = "http://ns.electronichealth.net.au/id/hi/hpii/1.0"
* entry[Practitioner][=].item.identifier.value = "8003619900015717"

// Organization identifier to be removed (HPI-O)
* entry[Organization_HPIO][+].item.identifier.system = "http://ns.electronichealth.net.au/id/hi/hpio/1.0"
* entry[Organization_HPIO][=].item.identifier.value = "8003626566707032"

// PractitionerRole identifier to be removed
* entry[HCPD_Local][+].item.identifier.system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* entry[HCPD_Local][=].item.identifier.value = "PR123456"

// Location identifier to be removed
* entry[HCPD_Local][+].item.identifier.system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* entry[HCPD_Local][=].item.identifier.value = "LOC789012"

// Endpoint identifier to be removed
* entry[HCPD_Local][+].item.identifier.system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* entry[HCPD_Local][=].item.identifier.value = "EP345678"