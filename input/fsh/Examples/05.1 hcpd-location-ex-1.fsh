Instance: example-healthconnect-mobile-healthcare-unit-1
InstanceOf: HCPD_Location
Usage: #example
Title: "HCPD Location Example: Mobile Healthcare Unit"
Description: "A mobile healthcare unit location example with wheelchair access, conforming to the HCPD Location profile."

* meta.lastUpdated = "2025-09-01T14:45:30Z"

* status = #active

* identifier[+].type = $v2-0203#NATAS "NATA Site Number"
* identifier[=].type.text = "NATA Site Number"
* identifier[=].system = "http://hl7.org.au/id/nata-site"
* identifier[=].value = "162899"

* identifier[+].type = $v2-0203#LSPN "Location Specific Practice Number"
* identifier[=].type.text = "LSPN"
* identifier[=].system = "http://ns.electronichealth.net.au/id/location-specific-practice-number"
* identifier[=].value = "123333"

* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "26ff4c29-692f-45c7-8df7-99cf6b5a8c09"

* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI "Resource Identifier"
* identifier[HCPD_Source_Identifier].system = "http://example.org/fhir/identifier/location" // Example: assigned by external system when ingested
* identifier[HCPD_Source_Identifier].value = "hcpd-SI-4243"

* name = "Mobile Healthcare Unit - Sydney CBD"
* alias = "CBD Mobile Unit"
* address.extension.url = "http://hl7.org.au/fhir/StructureDefinition/address-identifier"
* address.extension.valueIdentifier.type = $v2-0203#GNAF "Geocoded National Address File Identifier"
* address.extension.valueIdentifier.type.text = "G-NAF"
* address.extension.valueIdentifier.system = "http://hl7.org.au/id/gnafidentifier"
* address.extension.valueIdentifier.value = "GANSW718473771"
* address.type = #physical
* address.text = "Shop 8, 151 Castlereagh Street, SYDNEY NSW 2000"
* address.line[0] = "Shop 8"
* address.line[+] = "147-153 Castlereagh Street"
* address.city = "SYDNEY"
* address.state = "NSW"
* address.postalCode = "2000"
* address.country = "AU"

* position.longitude = 151.2093
* position.latitude = -33.8688

* extension[+].url = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-alternate-postal-address"
* extension[=].valueAddress.use = #work
* extension[=].valueAddress.type = #postal
* extension[=].valueAddress.text = "PO Box 123, SYDNEY NSW 2000"
* extension[=].valueAddress.line = "PO Box 123"
* extension[=].valueAddress.city = "SYDNEY"
* extension[=].valueAddress.state = "NSW"
* extension[=].valueAddress.postalCode = "2000"
* extension[=].valueAddress.country = "AU"

* extension[+].url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/amenity"
* extension[=].valueCodeableConcept = $amenityCS#wheelchairAccess "Wheelchair Access"

* telecom[phone].value = "(02) 1234 5678"
* telecom[phone].use = #work

* telecom[email].value = "info@sydneycentralmc.com.au"
* telecom[email].use = #work

* telecom[+].system = #url
* telecom[=].value = "https://www.example.com/sydneycentralmc"
* telecom[=].use = #work

* telecom[+].system = #fax
* telecom[=].value = "+61 2 9999 8888"
* telecom[=].use = #work

* managingOrganization = Reference(example-healthconnect-organization-1)

* type[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MOBL "Mobile Unit"
* type[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#COMM "Community Location"