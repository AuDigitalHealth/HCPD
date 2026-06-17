Instance: example-hcpd-export-request-parameters-2
InstanceOf: HCPD_Export_Request_Parameters
Usage: #example
Title: "HCPD Export Request Parameters Example: Delta Export Since Last Retrieval"
Description: "An example Parameters resource showing a delta export request with _since parameter for retrieving changes since a previous export."

* parameter[outputFormat].name = #_outputFormat
* parameter[outputFormat].valueString = "application/fhir+ndjson"

* parameter[type][+].name = #_type
* parameter[type][=].valueString = "Organization,Location,HealthcareService,Practitioner,PractitionerRole,Endpoint,Provenance"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "HealthcareService?service-type=http://snomed.info/sct|789718008&location.address-city=Balmain&location.address-postalcode=2041"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Location?address-city=Balmain&address-postalcode=2041&near=-33.8607|151.1803|100"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Organization?_has:HealthcareService:organization:service-type=http://snomed.info/sct|789718008"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "PractitionerRole?location.address-city=Balmain&location.address-postalcode=2041"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Practitioner?_has:PractitionerRole:practitioner:location.address-city=Balmain"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Endpoint?_has:PractitionerRole:endpoint:location.address-city=Balmain"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Provenance?target.resolve().as(Organization)"

* parameter[since].name = #_since
* parameter[since].valueInstant = "2025-02-01T00:00:00Z"