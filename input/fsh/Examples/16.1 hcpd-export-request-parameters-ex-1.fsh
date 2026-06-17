Instance: example-hcpd-export-request-parameters-1
InstanceOf: HCPD_Export_Request_Parameters
Usage: #example
Title: "HCPD Export Request Parameters Example: Cardiology Services in Balmain"
Description: "An example Parameters resource conforming to the HCPD Export Request Parameters profile, requesting export of all cardiology services in Balmain including organizations, locations, services, roles and practitioners."

* parameter[outputFormat].name = #_outputFormat
* parameter[outputFormat].valueString = "application/fhir+ndjson"

* parameter[type][+].name = #_type
* parameter[type][=].valueString = "Location,HealthcareService,Organization,PractitionerRole,Practitioner"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Location?address-city=Balmain&address-postalcode=2041&near=-33.8607|151.1803|100"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "HealthcareService?service-type=http://snomed.info/sct|789718008&location.address-city=Balmain&location.address-postalcode=2041"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Organization?_has:HealthcareService:organization:service-type=http://snomed.info/sct|789718008"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "PractitionerRole?location.address-city=Balmain&location.address-postalcode=2041"

* parameter[typeFilter][+].name = #_typeFilter
* parameter[typeFilter][=].valueString = "Practitioner?_has:PractitionerRole:practitioner:location.address-city=Balmain"