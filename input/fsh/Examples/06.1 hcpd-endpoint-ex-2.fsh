Instance: example-hcpd-endpoint-referral
InstanceOf: HCPD_Endpoint
Usage: #example
Title: "Sydney Private Clinic: FHIR Referral Endpoint"
Description: "FHIR REST endpoint for Sydney Private Clinic. Receives electronic referrals (ServiceRequest) for Dr. Emily Chen's gynaecology service. Selected via Provider Directory search: location Sydney, wait time <2 weeks."

* meta.source = "http://ns.electronichealth.net.au/id/source/pca"
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated
* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization Identifier"
* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "e1000000-0000-4000-8000-000000000002"
* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI
* identifier[HCPD_Source_Identifier].system = "http://ns.electronichealth.net.au/id/source/nhsd"
* identifier[HCPD_Source_Identifier].value = "EP-NHSD-001234562501"

* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest
* connectionType.display = "HL7 FHIR"
* name = "Sydney Private Clinic – FHIR Referral Endpoint"
* payloadType[0] = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#any "Any"
* payloadMimeType[0] = #application/fhir+json
* address = "https://fhir.sydneyprivateclinic.com.au/fhir"
* contact.system = #email
* contact.value = "referrals@sydneyprivateclinic.com.au"
* contact.use = #work