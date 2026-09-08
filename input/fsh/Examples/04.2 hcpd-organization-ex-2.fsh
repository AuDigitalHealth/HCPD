Instance: example-healthconnect-organization-2
InstanceOf: HCPD_Organization
Usage: #example
Title: "HCPD Organization Example: Home Care Support Service"
Description: "A Home Care Support Service example conforming to the HCPD Organization profile with HSP-O identifier."

* meta.lastUpdated = "2025-09-15T14:20:00Z"

* active = false
* partOf = Reference(example-healthconnect-organization-1)
* identifier[hspo].value = "8003641000000209"
* identifier[hspo].extension[hcpd-hspo-status].valueCoding = $hcpd-hi-status-cs#A "Active"
* identifier[hspo].value = "8003641000000217"
* identifier[hspo].extension[hi-org-classification].valueCodeableConcept.coding = $hi-org-class-cs#seed "Seed"
* identifier[abn].system = "http://hl7.org.au/id/abn"
* identifier[abn].type.text = "ABN"
* identifier[abn].value = "98765432109"
* identifier[acn].system = "http://hl7.org.au/id/acn"
* identifier[acn].type.text = "ACN"
* identifier[acn].value = "987654321"

* name = "Caring Hands Home Support"
* alias = "Caring Hands"
* alias = "CHHS"

* telecom[+].system = #phone
* telecom[=].value = "(02) 9555 1200"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "(02) 9555 1201"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "admin@caringhands.com.au"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "support@caringhands.com.au"
* telecom[=].use = #work

* telecom[+].system = #url
* telecom[=].value = "https://www.caringhands.com.au"
* telecom[=].use = #work
* telecom[+].system = #fax
* telecom[=].value = "+61 2 9555 1299"
* telecom[=].use = #work

// Physical/Registered Address - Required may be physical or both
* address[physical].type = #physical
* address[physical].line = "Suite 15, 88 Liverpool Street"
* address[physical].city = "Sydney"
* address[physical].state = "NSW"
* address[physical].postalCode = "2000"
* address[physical].country = "AU"