Instance: health-connect-provider-directory-requester
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Health Connect Provider Directory Requester"
Description: "This [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html) resource defines the expected capabilities 
of the [Health Connect Provider Directory Requester Actor](ActorDefinition-requester-actor-health-connect.html) when conforming to this implementation guide. The complete 
list of FHIR profiles, RESTful operations, and search parameters supported by Health Connect Provider Directory Requester Actor are defined in this CapabilityStatement. 
The requirements of the Health Connect Provider Directory Requester actor may also be impacted by the rules of local jurisdictions or other contextual requirements."

* name = "HealthConnectProviderDirectoryRequester"
* url = "http://digitalhealth.gov.au/fhir/hcpd/CapabilityStatement/health-connect-provider-directory-requester"
* status = #active
* experimental = false
* date = "2026-03-31"
* kind = #requirements
* fhirVersion = #4.0.1

* format[0] = #json
* format[+] = #xml
* format[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* format[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHOULD
* publisher = "Australian Digital Health Agency"
* contact[0].telecom.system = #email
* contact[0].telecom.value = "help@digitalhealth.gov.au"

* rest.mode = #client
* rest.security.service[0] = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth "OAuth"
* rest.security.description = "All interactions SHOULD be secured using OAuth protocols. It SHOULD support authentication, authorisation, and audit logging in accordance with local policy and regulatory requirements."

// HCPD_Provenance resource
* rest.resource[+].type = #Provenance
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-provenance"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHOULD
* rest.resource[=].documentation = "This resource is used to track the provenance of data retrieved, updated, or verified from external systems of record for HC resources."

// Provenance interactions - client capabilities
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].documentation = "Read HCPD Provenance records to understand data lineage"
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].documentation = "Search for HCPD Provenance records by target resource"

* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
* rest.resource[=].searchInclude[0] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "target"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-target"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Organization
* rest.resource[+].type = #Organization
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-organization"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section defines the supported interactions by a Requester Actor for the HCPD Organization profile of the Organization resource type."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
* rest.resource[=].searchInclude[0] = "Organization:partOf"
* rest.resource[=].searchRevInclude[0] = "Location:organization"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Location
* rest.resource[+].type = #Location
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHOULD
* rest.resource[=].documentation = "This section introduces the supported interactions by a Requester Actor for the HCPD Location profile."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
* rest.resource[=].searchInclude[0] = "Location:organization"
* rest.resource[=].searchInclude[+] = "Location:endpoint"
* rest.resource[=].searchRevInclude[0] = "HealthcareService:location"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "locmailaddress"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/location-locmailaddress"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "locationamenities"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/location-amenities"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "address"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-address"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "locationphysicaltype"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/location-physicaltype"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "near"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-near"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
 
// HealthcareService
* rest.resource[+].type = #HealthcareService
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-healthcareservice"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHOULD
* rest.resource[=].documentation = "This section introduces the supported interactions by a Requester Actor for the [HCPD Healthcare Service](StructureDefinition-hcpd-healthcareservice.html) profile."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchInclude[0] = "HealthcareService:location"
* rest.resource[=].searchInclude[+] = "HealthcareService:organization"
* rest.resource[=].searchInclude[+] = "HealthcareService:endpoint"
* rest.resource[=].searchRevInclude[0] = "PractitionerRole:service"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "languages"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/languages"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "hsbilling"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/healthcareservice-billing"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "allday"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/allday"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "daysofweek"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/daysofweek"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "starttime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/starttime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "endtime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endtime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "service-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-service-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// PractitionerRole
* rest.resource[+].type = #PractitionerRole
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHOULD
* rest.resource[=].documentation = "This section defines the supported interactions for the [HCPD Practitioner Role](StructureDefinition-hcpd-practitionerrole.html) profile of the PractitionerRole resource type. Each PractitionerRole resource conforming to the [HCPD Practitioner Role](StructureDefinition-hcpd-practitionerrole.html) profile describes a practitioner in a role at a healthcare service."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchInclude[0] = "PractitionerRole:practitioner"
* rest.resource[=].searchInclude[+] = "PractitionerRole:service"
* rest.resource[=].searchInclude[+] = "PractitionerRole:organization"
* rest.resource[=].searchInclude[+] = "PractitionerRole:location"
* rest.resource[=].searchInclude[+] = "PractitionerRole:endpoint"
* rest.resource[=].searchRevInclude[0] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "languages"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/languages"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "allday"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/allday"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "daysofweek"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/daysofweek"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "starttime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/starttime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "endtime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endtime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "role"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-role"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Practitioner
* rest.resource[+].type = #Practitioner
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitioner"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section defines the supported interactions for the [HCPD Practitioner](StructureDefinition-hcpd-practitioner.html) profile of the Practitioner resource type."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchRevInclude[0] = "PractitionerRole:practitioner"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "regprof"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-regprof"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "rsg"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-rsg"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "identifier-r5"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-identifier-r5"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Endpoint
* rest.resource[+].type = #Endpoint
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-endpoint"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[=].valueCode = #SHOULD
* rest.resource[=].documentation = "This section defines the supported interactions for the [HCPD Endpoint](StructureDefinition-hcpd-endpoint.html) profile of the Endpoint resource type. Each Endpoint resource conforming to the [HCPD Endpoint](StructureDefinition-hcpd-endpoint.html) profile is a read-only proxy for a corresponding Endpoint resource published by the HCPD portal."
* rest.resource[=].interaction.code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
* rest.resource[=].searchRevInclude[0] = "HealthcareService:endpoint"
* rest.resource[=].searchRevInclude[+] = "Location:endpoint"
* rest.resource[=].searchRevInclude[+] = "PractitionerRole:endpoint"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "epurl"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-url"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "payloadmimetype"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-payloadmimetype"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "hcepi"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-hcepi"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "connection-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-connection-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "payload-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-payload-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.interaction.code = #search-system
* rest.interaction.documentation = "**Definition**:\r\n    \n This operation is a RESTful *search* interaction (whole system interaction), across multiple resource types (as described in the [FHIR specification](https://www.hl7.org/fhir/http.html#search)). \r\n    \n\r\n    \n **Behaviour**:\r\n    \n This operation is used by a client system operated by a Health Connect Provider Directory Requester to get resources that match the specified search parameters. .\r\n    \n\r\n    \n The following  search parameters are supported:\r\n    \n\r\n    \n * *_lastUpdated* is used to get the resources that have been added or changed since the requesting system last synchronised their local data store with Health Connect Provider Directory Requester.  This search parameter supports the ```gt``` and ```lt``` comparison prefixes.\r\n    \n * *_type* is used to filter the resources returned by their resource type. The available types are: \r\n    \n\r\n    \n   * ```HealthcareService``` (returns resources conforming to the [HCPD Healthcare Service](StructureDefinition-hcpd-healthcareservice.html) profile)\r\n    \n   * ```PractitionerRole``` (returns resources conforming to the [HCPD Practitioner Role](StructureDefinition-hcpd-practitionerrole.html) profile)\r\n    \n   * ```Organization``` (returns resources conforming to the [HCPD Organization](StructureDefinition-hcpd-organization.html) profile)\r\n    \n   * ```Location``` (returns resources conforming to the [HCPD Location](StructureDefinition-hcpd-location.html) profile)\r\n    \n   * ```Practitioner``` (returns resources conforming to the [HCPD Practitioner](StructureDefinition-hcpd-practitioner.html) profile)\r\n    \n   * ```Provenance``` (returns resources conforming to the [HCPD Provenance](StructureDefinition-hcpd-provenance.html) profile)\r\n    \n   \r\n    \n \r\n    \n All of the following query parameters are required in order to receive the complete set of resources that have been created, changed or published since *[last_synchronized]*:\r\n    \n\r\n    \n ``` _lastUpdated=[last_synchronized] ```\r\n    \n ```_type=HealthcareService,PractitionerRole,Practitioner,Organization,Location,Provenance ```\r\n    \n ```_include=Location:organization ```\r\n    \n ```_include=HealthcareService:organization ```\r\n    \n ```_include=HealthcareService:location ```\r\n    \n ```_include=PractitionerRole:organization ```\r\n    \n ```_include=PractitionerRole:location ```  \r\n    \n ```_include=PractitionerRole:service ```\r\n    \n ```_include=PractitionerRole:practitioner ``` \r\n    \n ```_include=Provenance:target ```   \r\n    \n ```_include:iterate=HealthcareService:organization  ```  \r\n    \n ```_include:iterate=HealthcareService:location ```\r\n    \n ```_include:iterate=PractitionerRole:organization ```\r\n    \n ```_include:iterate=PractitionerRole:location ```\r\n    \n ```_include:iterate=PractitionerRole:service ```\r\n    \n ```_include:iterate=PractitionerRole:practitioner ```\r\n    \n \r\n    \n As described above the resources returned in the Bundle exclude any *Identifiers* (e.g. HPI-Is) that cannot be disclosed to the subscriber.\r\n    \n \r\n    \n This operation supports 'paging' ([see FHIR specification](https://www.hl7.org/fhir/search.html#Paging)).  If there are too many resources to return in one ```Bundle```, the FHIR server adds a *next* link to the response ```Bundle```. The contents of the result ```Bundle``` therefore comprise all instances of the requested resource types whose *lastUpdated* timestamp is greater than the \\<lastSync\\> in the request query expression and less than or equal to \\<lastInBundle\\> where \\<lastInBundle\\> is the greatest *lastUpdated* value of all resources included in the result ```Bundle```. The Subscriber Agent FHIR server sets the *next* link to the filter expression that was used in the original request except that \\<lastSync\\> is replaced with \\<lastInBundle\\>. If the *next* link is not present in the Bundle, then there are no more service offerings available.    "
* rest.searchParam[0].name = "_lastUpdated"
* rest.searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest.searchParam[=].type = #date
* rest.searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.searchParam[=].extension[=].valueCode = #SHOULD
* rest.searchParam[+].name = "_type"
* rest.searchParam[=].type = #token
* rest.searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.searchParam[=].extension[=].valueCode = #SHOULD
* rest.searchParam[+].name = "_include"
* rest.searchParam[=].type = #special
* rest.searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.searchParam[=].extension[=].valueCode = #SHOULD
* rest.searchParam[+].name = "_resultId"
* rest.searchParam[=].type = #special
* rest.searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.searchParam[=].extension[=].valueCode = #SHOULD