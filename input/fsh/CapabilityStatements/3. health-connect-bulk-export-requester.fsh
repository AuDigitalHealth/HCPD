Instance: health-connect-bulk-export-requester
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Health Connect Provider Directory Bulk Export Requester"
Description: "This CapabilityStatement resource defines the expected capabilities of the [Health Connect Provider Directory Bulk Export Requester Actor](ActorDefinition-bulk-export-requester-actor-health-connect.html) when conforming to this implementation guide. This actor is specifically designed for bulk data export operations and does not support standard FHIR REST search interactions. The listed FHIR profiles and operations describe the capabilities required for initiating bulk exports and processing the returned data, including handling resource removal lists."

* name = "HealthConnectProviderDirectoryBulkExportRequester"
* url = "http://digitalhealth.gov.au/fhir/hcpd/CapabilityStatement/health-connect-bulk-export-requester"
* status = #active
* experimental = false
* date = "2026-04-29"
* kind = #requirements
* fhirVersion = #4.0.1

* format[0] = #json
* format[+] = #xml
* format[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* format[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* publisher = "Australian Digital Health Agency"
* contact[0].telecom.system = #email
* contact[0].telecom.value = "help@digitalhealth.gov.au"

* rest.mode = #client
* rest.security.service[0] = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth "OAuth"
* rest.security.description = "All interactions SHALL be secured using OAuth protocols. It SHALL support authentication, authorisation, and audit logging in accordance with local policy and regulatory requirements."

// Parameters (HCPD Export Request Parameters for Bulk Data Export)
* rest.resource[+].type = #Parameters
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-request-parameters"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section defines the supported interactions for submitting [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) resources as search instructions for bulk data export operations. The client SHALL be able to form properly structured Parameters resources containing _outputFormat, _type, _typeFilter, and optionally _since parameters to control bulk data export scope and format. The server validates these parameters before executing the bulk export."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].documentation = "Submit HCPD Export Request Parameters as search instructions for bulk data export operations"
* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
// Aggregated searchInclude parameters from all other resource types
* rest.resource[=].searchInclude[0] = "Provenance:target"
* rest.resource[=].searchInclude[+] = "Organization:partOf"
* rest.resource[=].searchInclude[+] = "Location:organization"
* rest.resource[=].searchInclude[+] = "Location:endpoint"
* rest.resource[=].searchInclude[+] = "HealthcareService:location"
* rest.resource[=].searchInclude[+] = "HealthcareService:organization"
* rest.resource[=].searchInclude[+] = "HealthcareService:endpoint"
* rest.resource[=].searchInclude[+] = "PractitionerRole:practitioner"
* rest.resource[=].searchInclude[+] = "PractitionerRole:service"
* rest.resource[=].searchInclude[+] = "PractitionerRole:organization"
* rest.resource[=].searchInclude[+] = "PractitionerRole:location"
* rest.resource[=].searchInclude[+] = "PractitionerRole:endpoint"
// Aggregated searchRevInclude parameters from all other resource types
* rest.resource[=].searchRevInclude[0] = "Location:organization"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchRevInclude[+] = "HealthcareService:location"
* rest.resource[=].searchRevInclude[+] = "PractitionerRole:service"
* rest.resource[=].searchRevInclude[+] = "PractitionerRole:practitioner"
* rest.resource[=].searchRevInclude[+] = "HealthcareService:endpoint"
* rest.resource[=].searchRevInclude[+] = "Location:endpoint"
* rest.resource[=].searchRevInclude[+] = "PractitionerRole:endpoint"

// List (HCPD Export Response List for processing removal operations)
* rest.resource[+].type = #List
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-response-list"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section defines the required capabilities for processing [HCPD Export Response List](StructureDefinition-hcpd-export-response-list.html) resources received as part of bulk data export operations. The client SHALL be able to read and parse these List resources to identify resource identifiers that must be removed from local systems in compliance with suppression requirements."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[=].documentation = "Read HCPD Export Response List resources received through bulk export operations to identify resources for local removal"
* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false

// Binary (Bulk Export Data Files)
* rest.resource[+].type = #Binary
* rest.resource[=].documentation = "This section defines the required capabilities for retrieving Binary resources containing bulk exported data files. After submitting export parameters and receiving export completion notification, the client SHALL be able to retrieve the Binary resources containing the exported data in ndjson format."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[=].documentation = "Read Binary resources containing bulk exported data files"
* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false

// System-level operations for bulk data export
* rest.operation[+].name = "export"
* rest.operation[=].definition = "http://hl7.org/fhir/uv/bulkdata/OperationDefinition/export"
* rest.operation[=].documentation = "This operation enables the client to initiate bulk data export requests by submitting Parameters input structured according to [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) profile. The operation SHALL accept parameters including _outputFormat, _type, _typeFilter, and optionally _since to control bulk data export scope and format. The operation SHALL return URLs to ndjson files containing the requested resource types. When applicable, the response may include [HCPD Export Response List](StructureDefinition-hcpd-export-response-list.html) resources that the client MUST process to remove those resource identifiers from local systems."
* rest.operation[=].documentation = "This operation enables the client to initiate bulk data export requests by submitting [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) resources to the Health Connect Provider Directory Responder. The operation SHALL return URLs to ndjson files containing the requested resource types. When applicable, the response may include [HCPD Export Response List](StructureDefinition-hcpd-export-response-list.html) resources that the client MUST process to remove those resource identifiers from local systems."