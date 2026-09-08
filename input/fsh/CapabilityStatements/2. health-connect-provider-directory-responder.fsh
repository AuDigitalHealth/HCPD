Instance: health-connect-provider-directory-responder
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Health Connect Provider Directory Responder"
Description: "This CapabilityStatement resource defines the expected capabilities of the [Health Connect Provider Directory Responder Actor](ActorDefinition-responder-actor-health-connect.html) when conforming to this implementation guide. The listed FHIR profiles, RESTful operations, and search parameters describe only those capabilities exposed for responding to Requester Actor requests. The Health Connect Provider Directory Responder supports additional internal and publishing operations that are not shown here; these are out of scope for this IG and are documented separately for publishing systems. The requirements of the Health Connect Provider Directory Responder may also be impacted by the rules of local jurisdictions or other contextual requirements."

* name = "HealthConnectProviderDirectoryResponder"
* url = "http://digitalhealth.gov.au/fhir/hcpd/CapabilityStatement/health-connect-provider-directory-responder"
* status = #active
* experimental = false
* date = "2026-09-10"
* kind = #instance
* fhirVersion = #4.0.1

* implementation.description = "Health Connect Provider Directory Responder FHIR Server"
* implementation.url = "http://digitalhealth.gov.au/fhir/hcpd"

* format[0] = #json
* format[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* publisher = "Australian Digital Health Agency"
* contact[0].telecom.system = #email
* contact[0].telecom.value = "help@digitalhealth.gov.au"

* rest.mode = #server
* rest.security.service[0] = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth "OAuth"
* rest.security.description = "All interactions SHALL be secured using OAuth protocols. It SHALL support authentication, authorisation, and audit logging in accordance with local policy and regulatory requirements."

// Add HCProvenance resource
* rest.resource[+].type = #Provenance
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-provenance"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "HC Provenance resources track the lineage of data retrieved, updated, or verified from external systems of record."

// Provenance interactions - server capabilities
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].documentation = "Read HC Provenance records"
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].documentation = "Search HC Provenance records by various parameters"

* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
* rest.resource[=].searchInclude[0] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "target"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-target"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL

// Organization
* rest.resource[+].type = #Organization
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-organization"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section defines the supported interactions for the [HCPD Organization](StructureDefinition-hcpd-organization.html) profile of the Organization resource type."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
* rest.resource[=].searchInclude[0] = "Organization:partOf"
* rest.resource[=].searchRevInclude[0] = "Location:organization"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "name" 
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL

// Location
* rest.resource[+].type = #Location
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section describes the supported interactions for the [HCPD Location](StructureDefinition-hcpd-location.html) profile. Each Location resource conforming to this profile identifies a physical or virtual place associated with healthcare services in the Health Connect Provider Directory, enabling clients to discover, filter, and reference service delivery sites."
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
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "locationamenities"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/location-amenities"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "address"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-address"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "locationphysicaltype"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/location-physicaltype"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "near"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-near"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Location-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL

// HealthcareService
* rest.resource[+].type = #HealthcareService
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-healthcareservice"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section describes the supported interactions for the [HCPD Healthcare Service](StructureDefinition-hcpd-healthcareservice.html) profile. Each HealthcareService resource conforming to this profile identifies a healthcare service in the Health Connect Provider Directory, enabling clients to discover, filter, and reference healthcare services that are provided."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
* rest.resource[=].searchInclude[0] = "HealthcareService:location"
* rest.resource[=].searchInclude[+] = "HealthcareService:organization"
* rest.resource[=].searchInclude[+] = "HealthcareService:endpoint"
* rest.resource[=].searchInclude[+] = "HealthcareService:organization"
* rest.resource[=].searchRevInclude[0] = "PractitionerRole:service"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[+].name = "languages"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/languages"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "hsbilling"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/healthcareservice-billing"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "allday"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/allday"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "daysofweek"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/daysofweek"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "starttime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/starttime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "endtime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endtime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "service-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-service-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/HealthcareService-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "healthcareservice-type-display"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/healthcareservice-type-display"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL

// PractitionerRole
* rest.resource[+].type = #PractitionerRole
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section defines the supported interactions for the [HCPD Practitioner Role](StructureDefinition-hcpd-practitionerrole.html) profile of the PractitionerRole resource type. Each PractitionerRole resource conforming to the [HCPD Practitioner Role](StructureDefinition-hcpd-practitionerrole.html) profile describes a practitioner in a role at a healthcare service."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
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
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "allday"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/allday"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "daysofweek"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/daysofweek"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "starttime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/starttime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "endtime"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endtime"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "role"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-role"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "practitionerrole-code-display"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitionerrole-code-display"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL

// Practitioner
* rest.resource[+].type = #Practitioner
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitioner"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section describes the supported interactions for the [HCPD Practitioner](StructureDefinition-hcpd-practitioner.html) profile. Each Practitioner resource conforming to this profile represents an individual healthcare provider registered in the Health Connect Provider Directory, enabling clients to search, identify, and reference practitioners and their associated roles and service locations."
* rest.resource[=].interaction.code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
* rest.resource[=].searchRevInclude[0] = "PractitionerRole:practitioner"
* rest.resource[=].searchRevInclude[+] = "Provenance:target"
* rest.resource[=].searchParam[0].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "regprof"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-regprof"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "rsg"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-rsg"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "identifier-r5"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-identifier-r5"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "active"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-active"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL

// Endpoint
* rest.resource[+].type = #Endpoint
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-endpoint"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This section describes the supported interactions for the [HCPD Endpoint](StructureDefinition-hcpd-endpoint.html) profile. Each Endpoint resource conforming to this profile provides connection details for electronic services available through the Health Connect Provider Directory, allowing clients to discover and interact with service endpoints in a standardised way."
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
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "payloadmimetype"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-payloadmimetype"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "hcepi"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-hcepi"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "connection-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-connection-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "payload-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-payload-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Endpoint-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "suppressed"
* rest.resource[=].searchParam[=].definition = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[=].valueCode = #SHALL

// Parameters (HCPD Export Request Parameters for Bulk Data Export)
* rest.resource[+].type = #Parameters
* rest.resource[=].profile = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-request-parameters"
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].documentation = "This resource declares support for processing [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) resources as input to bulk data export operations. Parameters resources conforming to this profile are used to control the scope, format, and filtering criteria for bulk exports. These resources are processed as part of the $export operation and are not directly stored or searchable."
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

// System-level operations for bulk data export
* rest.operation[+].name = "export"
* rest.operation[=].definition = "http://hl7.org/fhir/uv/bulkdata/OperationDefinition/export"
* rest.operation[=].documentation = "This bulk data export operation expects request parameters conforming to the [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) profile which defines the required parameter structure for _outputFormat, _type, _typeFilter, and optional _since parameters. The server returns URLs to ndjson files containing the requested resource types. Bulk data extraction returns all resources regardless of active status or suppression; implementers SHALL respect the suppressed and deactivated-by extensions on returned resources, filtering these resources before displaying them to end consumers."
