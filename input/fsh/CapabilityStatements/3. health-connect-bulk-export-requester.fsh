Instance: health-connect-bulk-export-requester
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Health Connect Provider Directory Bulk Export Requester"
Description: "This CapabilityStatement resource defines the expected capabilities of the [Health Connect Provider Directory Bulk Export Requester Actor](ActorDefinition-bulk-export-requester-actor-health-connect.html) when conforming to this implementation guide. This actor is specifically designed for bulk data export operations and does not support standard FHIR REST search interactions. The listed FHIR profiles and operations describe the capabilities required for initiating bulk exports and processing the returned data."

* name = "HealthConnectProviderDirectoryBulkExportRequester"
* url = "http://digitalhealth.gov.au/fhir/hcpd/CapabilityStatement/health-connect-bulk-export-requester"
* status = #active
* experimental = false
* date = "2026-09-10"
* kind = #requirements
* fhirVersion = #4.0.1

* format[0] = #json
* format[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
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
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section defines the supported interactions for submitting [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) resources as search instructions for bulk data export operations. The client SHALL be able to form properly structured Parameters resources containing _outputFormat, _type, _typeFilter, and optionally _since parameters to control bulk data export scope and format. The server validates these parameters before executing the bulk export."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].documentation = "Submit HCPD Export Request Parameters as search instructions for bulk data export operations"
* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
* rest.resource[=].searchParam[+].name = "_outputFormat"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "Specifies the output format for bulk export. Fixed to application/fhir+ndjson."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "_type"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "Comma-separated list of resource types to include in the bulk export (e.g. Organization,Location,HealthcareService,Practitioner,PractitionerRole,Endpoint,Provenance)."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "_typeFilter"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "FHIR search expression applied to a specific resource type to filter which resources are included in the export. One _typeFilter SHALL be provided for each resource type specified in _type. Supported filter expressions include: Location?address-state, Location?address-postalcode, Location?address-city, Location?near, Organization?identifier, Organization?name, HealthcareService?service-type, PractitionerRole?location.address-city, PractitionerRole?location.address-postalcode."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "_since"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Only resources updated since the specified instant (ISO 8601) will be included in the export. Used for delta/incremental extracts."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
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
* rest.operation[=].documentation = "This operation enables the client to initiate bulk data export requests by submitting [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) resources to the Health Connect Provider Directory Responder. The operation SHALL accept parameters including _outputFormat, _type, _typeFilter, and optionally _since to control bulk data export scope and format. The operation SHALL return URLs to ndjson files containing the requested resource types. Bulk data extraction returns all resources regardless of active status or suppression; implementers SHALL respect the suppressed and deactivated-by extensions on returned resources, filtering these resources before displaying them to end consumers."
