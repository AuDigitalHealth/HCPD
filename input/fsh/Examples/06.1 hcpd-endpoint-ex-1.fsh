Instance: example-hcpd-endpoint-hl7-fhir-messaging
InstanceOf: HCPD_Endpoint
Usage: #example
Title: "HCPD Endpoint Example: HL7 FHIR Messaging"
Description: "An example Endpoint with HL7 FHIR Messaging Endpoint conforming to the HCPD Endpoint profile."

* meta.source = "http://ns.electronichealth.net.au/id/source/pca"

* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated

// SMD Target Identifier (as per profile slice)
* identifier[HCPD_SMD_Target_Identifier].system = "http://ns.electronichealth.net.au/smd/target"
* identifier[HCPD_SMD_Target_Identifier].value = "SMD001234567890"

// HCPD Source Identifier (as per profile slice)
* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI
* identifier[HCPD_Source_Identifier].system = "http://ns.electronichealth.net.au/id/source/nhsd"
* identifier[HCPD_Source_Identifier].value = "EP-NHSD-001234567890"

// HC Local Identifier (as per profile slice)
* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization Identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "EP001234567890"

// Endpoint status
* status = #off
// Connection type
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-msg
* connectionType.display = "HL7 FHIR Messaging"

// Friendly name
* name = "Sydney General Hospital FHIR Messaging Endpoint"

// Payload types
* payloadType[0] = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#any "Any"

// MIME types supported
* payloadMimeType[0] = #application/pdf
* payloadMimeType[1] = #application/fhir+xml
* payloadMimeType[2] = #application/fhir+json

// Endpoint URL
* address = "https://example.org/smd-sydneyhospital/secure-messaging/endpoint"

// Data encipherment certificate
* extension[encryption-certificate-pem-x509].valueString = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURYVENDQWtXZ0F3SUJBZ0lKQU1mK0R6UjBWV..."

// Contact information
* contact.system = #email
* contact.value = "hl7-fhir-message-support@sydneyhospital.org.au"
* contact.use = #work