Instance: example-hcpd-endpoint-smd
InstanceOf: HCPD_Endpoint
Usage: #example
Title: "HCPD Endpoint Example: SMD Target"
Description: "An example Endpoint with an SMD target identifier for secure messaging conforming to the HCPD Endpoint profile."

* meta.source = "http://ns.electronichealth.net.au/id/source/pca"

// SMD Target Identifier (as per profile slice)
* identifier[HCPD_SMD_Target_Identifier].system = "http://ns.electronichealth.net.au/smd/target"
* identifier[HCPD_SMD_Target_Identifier].value = "SMD001234567890"

// HC Local Identifier (as per profile slice)
* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization Identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "EP001234567890"

// Endpoint status
* status = #active

// Connection type - secure messaging
* connectionType = http://terminology.hl7.org.au/CodeSystem/endpoint-connection-type#secure-messaging
* connectionType.display = "Secure Messaging"

// Friendly name
* name = "Sydney General Hospital SMD Endpoint"

// Payload types for secure messaging
* payloadType[0] = $AUEndpointPayloadTypeCS#http://ns.hl7.org.au/hl7v2/profiles/HL7AU-OO-REF-SIMPLIFIED-201706 "HL7 V2.4 REF message (Level 2)"

// MIME types supported
* payloadMimeType[0] = #application/pdf
* payloadMimeType[1] = #application/fhir+xml
* payloadMimeType[2] = #application/fhir+json

// Endpoint URL
* address = "https://smd.sydneyhospital.org.au/secure-messaging/endpoint"

// Data encipherment certificate
* extension[data-encipherment-certificate].valueString = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURYVENDQWtXZ0F3SUJBZ0lKQU1mK0R6UjBWV..."

// Contact information
* contact.system = #email
* contact.value = "smd-support@sydneyhospital.org.au"
* contact.use = #work