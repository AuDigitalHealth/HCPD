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
* rest.security.description = "All interactions SHOULD be secured using OAuth protocols. It SHOULD support authentication, authorisation, and audit logging in accordance with local policy and regulatory requirements."

// HCPD_Provenance resource
* rest.resource[+].type = #Provenance
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-provenance"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHOULD
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
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
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
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Location
* rest.resource[+].type = #Location
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHOULD
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
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
 
// HealthcareService
* rest.resource[+].type = #HealthcareService
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-healthcareservice"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHOULD
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
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "healthcareservice-type-display"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/healthcareservice-type-display"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// PractitionerRole
* rest.resource[+].type = #PractitionerRole
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHOULD
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
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "practitionerrole-code-display"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitionerrole-code-display"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Practitioner
* rest.resource[+].type = #Practitioner
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitioner"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
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
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

// Endpoint
* rest.resource[+].type = #Endpoint
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-endpoint"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHOULD
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
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHOULD

