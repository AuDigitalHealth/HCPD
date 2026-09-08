Instance: example-healthconnect-organization-1
InstanceOf: HCPD_Organization
Usage: #example
Title: "HCPD Organization Example: Aged Care Facility"
Description: "An Aged Care Facility example conforming to the HCPD Organization profile."

* meta.lastUpdated = "2025-08-30T09:15:00Z"

* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated
* extension[suppressed].extension[includeSelf].valueBoolean = true

* active = true
* identifier[hpio].value = "8003626566707032"
* identifier[hpio].extension[hpio-status].valueCoding = $hcpd-hi-status-cs#A "Active"
* identifier[hpio].extension[hi-org-classification].valueCodeableConcept.coding = $hi-org-class-cs#network "Network"
* identifier[abn].system = "http://hl7.org.au/id/abn"
* identifier[abn].type.text = "ABN"
* identifier[abn].value = "41824753556"
* identifier[acn].system = "http://hl7.org.au/id/acn"
* identifier[acn].type.text = "ACN"
* identifier[acn].value = "123456789"


* name.extension[dataAbsentReason].valueCode = #masked
* alias = "Ye old Example Aged Care"

* telecom[+].system = #phone
* telecom[=].value = "(03) 5550 4075"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "(03) 5550 4076"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "reception@example.com.au"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "admin@example.com.au"
* telecom[=].use = #work

* telecom[+].system = #url
* telecom[=].value = "https://www.example.com/mocklocation"
* telecom[=].use = #work
* telecom[+].system = #fax
* telecom[=].value = "+61 2 6666 7777"
* telecom[=].use = #work

// Physical/Registered Address - Required may be physical or both
* address[physical].type = #physical
* address[physical].line = "175 Liverpool Street"
* address[physical].city = "Sydney"
* address[physical].state = "NSW"
* address[physical].postalCode = "2000"
* address[physical].country = "AU"
