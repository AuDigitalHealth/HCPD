Instance: example-healthconnect-healthcareservice-1
InstanceOf: HCPD_HealthcareService
Usage: #example
Title: "HCPD HealthcareService Example: Residential Aged Care"
Description: "A Residential Aged Care HealthcareService example conforming to the HCPD HealthcareService profile."

* meta.lastUpdated = "2025-09-02T18:00:00Z"

* providedBy = Reference(Organization/example-healthconnect-organization-1)
* type = http://snomed.info/sct#1584801000168109 "Geriatric evaluation and management service"
* location = Reference(Location/example-healthconnect-medical-centre-location-1)
* extension[+].url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/active-period"
* extension[=].valuePeriod.start = "2022-01-01"
* extension[=].valuePeriod.end = "2025-12-31"
* name = "Healthcare service with Residential Aged Care service type"
* telecom[+].system = #phone
* telecom[=].value = "(02) 1234 5678"
* telecom[=].use = #work
* telecom[=].extension[contact-purpose].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/contactentity-type#ADMIN "Administrative"

* appointmentRequired = true
* availableTime.daysOfWeek[+] = #mon
* coverageArea.reference = "Location/example-healthconnect-mobile-unit-coverage-area-1"
* endpoint.reference = "Endpoint/example-hcpd-endpoint-hl7-fhir-messaging"
* availableTime.daysOfWeek[+] = #tue
* availableTime.daysOfWeek[+] = #wed
* availableTime.daysOfWeek[+] = #thu
* availableTime.daysOfWeek[+] = #fri
* availableTime.allDay = false
* availableTime.availableStartTime = "08:00:00"
* availableTime.availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime.availableEndTime = "17:30:00"
* availableTime.availableEndTime.extension[timeZone].valueCode = #Australia/Sydney
* extension[+].url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/referral-information-for-referrer"
* extension[=].valueMarkdown = """
**Referral required** from a GP or specialist.

Please include:
- Recent medical history
- Current medications

Referrals can be faxed to **(02) 1234 5679**.
"""
* extension[+].url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/iar-levels-of-care"
* extension[=].valueCodeableConcept = $IARCodeSystem#level3 "Level 3 - Moderate intensity services"
* extension[+].url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/new-patient-availability"
* extension[=].valueCodeableConcept = https://healthterminologies.gov.au/fhir/CodeSystem/new-patient-availability-1#accepting "Accepting new patients"

* active = true

* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI
* identifier[HCPD_Source_Identifier].system = "http://ns.electronichealth.net.au/id/source/pca"
* identifier[HCPD_Source_Identifier].value = "HS-PCA-001234"

* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "17fbd35e-ca2f-43a6-8ffc-9f0f95e65b4e"

* eligibility.code = $sct#933451001000036104 "Older adult 65+ years"

* communication[+] = urn:ietf:bcp:47#it "Italian"
* communication[+] = urn:ietf:bcp:47#zh "Chinese"

* serviceProvisionCode[+] = http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs#FAP "Fees Apply"
* serviceProvisionCode[+] = http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs#NFE "No Fee"
