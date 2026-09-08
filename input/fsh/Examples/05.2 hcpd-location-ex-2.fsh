Instance: example-healthconnect-virtual-telehealth-service-1
InstanceOf: HCPD_Location
Usage: #example
Title: "HCPD Location Example: Virtual Telehealth Service"
Description: "A virtual telehealth service location example without physical address, conforming to the HCPD Location profile."

* meta.lastUpdated = "2025-09-01T14:45:30Z"

* status = #active

* identifier[+].type = $v2-0203#LSPN "Location Specific Practice Number"
* identifier[=].type.text = "LSPN"
* identifier[=].system = "http://ns.electronichealth.net.au/id/location-specific-practice-number"
* identifier[=].value = "565656"

* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "c1e61f66-151f-42e2-8c61-7ae40951b5e3"

* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI "Resource Identifier"
* identifier[HCPD_Source_Identifier].system = "http://example.org/fhir/identifier/location" // Example: assigned by external system when ingested
* identifier[HCPD_Source_Identifier].value = "hcpd-SI-4244"

* name = "Virtual Telehealth Service"
* alias = "Ye Old Virtual Telehealth Service"

// Telehealth contact points
* telecom[phone].value = "+61 2 8000 0000"
* telecom[phone].use = #work

* telecom[email].value = "telehealth-support@mockhealth.au"
* telecom[email].use = #work

* telecom[+].system = #url
* telecom[=].value = "https://example.com/telehealth.mockservice.au/session/virtual-123"
* telecom[=].use = #work

* telecom[+].system = #url
* telecom[=].value = "https://example.com/telehealth.mockservice/consult"
* telecom[=].use = #work

* managingOrganization = Reference(example-healthconnect-organization-1)

* type = http://terminology.hl7.org.au/CodeSystem/location-type#VI "Virtual"
