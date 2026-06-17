Instance: example-healthconnect-practitionerrole-1
InstanceOf: HCPD_PractitionerRole
Usage: #example
Title: "HCPD PractitionerRole Example: Medicare Provider"
Description: "An example PractitionerRole (Medicare) that conforms to the HCPD PractitionerRole profile."

* meta.lastUpdated = "2025-09-03T01:23:45Z"

* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "16c83541-1b44-4f01-b032-7d5095ed1def"

// Ensure identifiers have unique types, e.g. Medicare:
* identifier[medicareProvider].type = $v2-0203-au#UPIN "Medicare Provider Number"
* identifier[medicareProvider].system = "http://ns.electronichealth.net.au/id/medicare-provider-number"
* identifier[medicareProvider].value = "2426621B"

// Ahpra Registration Number - must match the referenced Practitioner's Ahpra registration
* identifier[ahpraregistrationnumber].system = "http://hl7.org.au/id/ahpra-registration-number"
* identifier[ahpraregistrationnumber].value = "MED0000932945"

* code = $sct#61207006 "Medical pathologist"

* period.start = "2023-01-01"
* practitioner = Reference(Practitioner/example-healthconnect-practitioner-1)
* organization = Reference(Organization/example-healthconnect-organization-1)
* telecom.system = #phone
* telecom.value = "0255507777"
* telecom.use = #work
* availableTime[+].daysOfWeek = #mon
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "10:00:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "17:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[+].daysOfWeek = #tue
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "17:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[+].daysOfWeek = #wed
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "07:00:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "13:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[+].daysOfWeek = #thu
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "17:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[+].daysOfWeek = #fri
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "10:00:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "16:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* location = Reference(Location/example-healthconnect-medical-centre-location-1)
* healthcareService = Reference(HealthcareService/example-healthconnect-healthcareservice-1)

* extension[practitioner-role-communication].valueCodeableConcept.coding[+].system = "urn:ietf:bcp:47"
* extension[practitioner-role-communication].valueCodeableConcept.coding[=].code = #it
* extension[practitioner-role-communication].valueCodeableConcept.coding[=].display = "Italian"
* extension[alternate-name].valueHumanName.use = #usual
* extension[alternate-name].valueHumanName.family = "Smith"
* extension[alternate-name].valueHumanName.given = "Dr. Alex"
* extension[alternate-name].valueHumanName.prefix = "Dr"