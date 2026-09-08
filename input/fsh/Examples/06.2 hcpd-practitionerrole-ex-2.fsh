Instance: example-healthconnect-practitionerrole-2
InstanceOf: HCPD_PractitionerRole
Usage: #example
Title: "HCPD PractitionerRole Example: Ahpra-Only General Practitioner (Balmain)"
Description: "An example PractitionerRole for a general practitioner registered with Ahpra only (no Medicare provider number), working part-time at the Balmain service location."

* meta.lastUpdated = "2026-01-29T00:00:00Z"

* active = true

* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated

* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI
* identifier[HCPD_Source_Identifier].system = "http://ns.electronichealth.net.au/id/source/pca"
* identifier[HCPD_Source_Identifier].value = "PR-PCA-009875"

* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "a2c71f90-3b8e-4c1d-9f65-2d7890abcdef"

* identifier[ahpraregistrationnumber].system = "http://hl7.org.au/id/ahpra-registration-number"
* identifier[ahpraregistrationnumber].value = "MED0001111111"

* code = $sct#62247001 "General practitioner"

* period.start = "2024-07-01"
* period.end = "2027-06-30"

* practitioner = Reference(Practitioner/example-balmain-practitioner-1)
* organization = Reference(Organization/example-healthconnect-organization-1)

* location = Reference(Location/example-healthconnect-medical-centre-location-1)
* healthcareService = Reference(HealthcareService/example-healthconnect-healthcareservice-1)
* endpoint = Reference(Endpoint/example-hcpd-endpoint-referral)

* telecom.system = #phone
* telecom.value = "0298765432"
* telecom.use = #work

// Part-time: Tuesday, Thursday, Friday only
* availableTime[+].daysOfWeek = #tue
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "08:30:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "17:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[+].daysOfWeek = #thu
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "08:30:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "17:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[+].daysOfWeek = #fri
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "08:30:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "12:30:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney

* notAvailable.description = "Annual leave — not available over Christmas/New Year period"
* notAvailable.during.start = "2026-12-22"
* notAvailable.during.end = "2027-01-09"

* extension[practitioner-role-communication].valueCodeableConcept.coding[+].system = "urn:ietf:bcp:47"
* extension[practitioner-role-communication].valueCodeableConcept.coding[=].code = #en
* extension[practitioner-role-communication].valueCodeableConcept.coding[=].display = "English"
* extension[practitioner-role-communication].valueCodeableConcept.coding[+].system = "urn:ietf:bcp:47"
* extension[practitioner-role-communication].valueCodeableConcept.coding[=].code = #zh
* extension[practitioner-role-communication].valueCodeableConcept.coding[=].display = "Chinese"

* extension[alternate-name].valueHumanName.use = #usual
* extension[alternate-name].valueHumanName.family = "Anderson"
* extension[alternate-name].valueHumanName.given = "Ali"
