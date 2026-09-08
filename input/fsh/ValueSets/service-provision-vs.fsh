ValueSet: Service_Provision_Code_VS
Id: service-provision-code-vs
Title: "Service Provision Code ValueSet"
Description: "The Service Provision Code ValueSet includes values that may be used to identify the service provision condition of a healthcare service."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/ValueSet/service-provision-code-vs"
* ^status = #active
* ^experimental = false
* ^date = "2026-09-10"
* ^purpose = "This ValueSet addresses the business need to provide comprehensive billing arrangement information for healthcare services, extending beyond the base HL7 AU service provision conditions to include mixed billing scenarios specific to the Australian healthcare context."
* ^version = "1.0.0"
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"

* include codes from system http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs