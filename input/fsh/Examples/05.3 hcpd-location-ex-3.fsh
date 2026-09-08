Instance: example-healthconnect-mobile-unit-coverage-area-1
InstanceOf: HCPD_Location
Usage: #example
Title: "HCPD Location Example: Mobile Unit Service Coverage Area"
Description: "A virtual coverage area defining the geographical service boundary for the mobile healthcare unit."

* meta.lastUpdated = "2025-09-01T14:45:30Z"

* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated

* status = #inactive
* identifier[+].type = $v2-0203#LSPN "Location Specific Practice Number"
* identifier[=].type.text = "LSPN"
* identifier[=].system = "http://ns.electronichealth.net.au/id/location-specific-practice-number"
* identifier[=].value = "876543"

* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "8df1a0cf-f7aa-4306-98f1-115653885d78"

* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI "Resource Identifier"
* identifier[HCPD_Source_Identifier].system = "http://example.org/fhir/identifier/location" // Example: assigned by external system when ingested
* identifier[HCPD_Source_Identifier].value = "hcpd-SI-4244"

* name = "Sydney CBD Mobile Unit Service Area"
* description = "Coverage area served by the Sydney CBD Mobile Healthcare Unit, encompassing the central business district and surrounding areas."

* telecom[phone].value = "(02) 1234 5678"
* telecom[phone].use = #work

* telecom[email].value = "info@sydneycentralmc.com.au"
* telecom[email].use = #work

* managingOrganization = Reference(example-healthconnect-organization-1)

* type = http://terminology.hl7.org.au/CodeSystem/location-type#VI "Virtual"

// This coverage area is served by the mobile healthcare unit
* partOf = Reference(example-healthconnect-mobile-healthcare-unit-1)