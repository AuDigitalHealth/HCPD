Instance: example-healthconnect-healthcareservice-2
InstanceOf: HCPD_HealthcareService
Usage: #example
Title: "HCPD HealthcareService Example: Geriatric evaluation and management service"
Description: "A HealthcareService example demonstrating all elements defined in the HCPD HealthcareService profile, including all extensions, identifiers, availability windows, eligibility criteria, and telecoms."

* meta.lastUpdated = "2026-01-15T10:00:00+10:00"
* meta.source = "http://ns.electronichealth.net.au/id/source/pca"

// ---------------------------------------------------------------
// Identifiers (both slices required)
// ---------------------------------------------------------------
* identifier[HCPD_Source_Identifier].type = $v2-0203-int#RI
* identifier[HCPD_Source_Identifier].system = "http://ns.electronichealth.net.au/id/source/pca"
* identifier[HCPD_Source_Identifier].value = "HS-PCA-009876"

* identifier[HCPD_Local_Identifier].type = $v2-0203-int#XX "Organization identifier"
* identifier[HCPD_Local_Identifier].system = "http://digitalhealth.gov.au/fhir/hcpd/id/hcpd-local-identifier"
* identifier[HCPD_Local_Identifier].value = "a3f1c802-2e4b-4d90-bef7-8a1234567890"

// ---------------------------------------------------------------
// Status and core references
// ---------------------------------------------------------------
* active = true
* providedBy = Reference(Organization/example-healthconnect-organization-1)
* location = Reference(Location/example-healthconnect-medical-centre-location-1)
* endpoint = Reference(Endpoint/example-hcpd-endpoint-referral)

// ---------------------------------------------------------------
// Service type (1..*, with required coding.code and coding.display)
// ---------------------------------------------------------------
* type[+].coding[+].system = "http://snomed.info/sct"
* type[=].coding[=].code = #1584801000168109
* type[=].coding[=].display = "Geriatric evaluation and management service"

// ---------------------------------------------------------------
// Name and comment
// ---------------------------------------------------------------
* name = "Northside Community Health Centre – General Practice & Aged Care"
* comment = "Bulk-billing general practice with a specialist aged care program. Walk-ins welcome on weekday mornings."

// ---------------------------------------------------------------
// Telecoms (phone, fax, email with contact-purpose)
// ---------------------------------------------------------------
* telecom[+].system = #phone
* telecom[=].value = "(02) 9876 5432"
* telecom[=].use = #work
* telecom[=].extension[contact-purpose].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/contactentity-type#ADMIN "Administrative"

* telecom[+].system = #fax
* telecom[=].value = "(02) 9876 5433"
* telecom[=].use = #work
* telecom[=].extension[contact-purpose].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/contactentity-type#ADMIN "Administrative"

* telecom[+].system = #email
* telecom[=].value = "appointments@northsidehealth.example.com.au"
* telecom[=].use = #work
* telecom[=].extension[contact-purpose].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/contactentity-type#PATINF "Patient"

* telecom[+].system = #url
* telecom[=].value = "https://www.northsidehealth.example.com.au"
* telecom[=].use = #work

// ---------------------------------------------------------------
// Coverage area
// ---------------------------------------------------------------
* coverageArea = Reference(Location/example-healthconnect-mobile-unit-coverage-area-1)

// ---------------------------------------------------------------
// Service provision codes (0..*, all defined codes shown)
// ---------------------------------------------------------------
* serviceProvisionCode[+] = http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs#BB "Bulk Billing"
* serviceProvisionCode[+] = http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs#MIX "Mixed Billing"

// ---------------------------------------------------------------
// Languages offered (0..*)
// ---------------------------------------------------------------
* communication[+] = urn:ietf:bcp:47#en "English"
* communication[+] = urn:ietf:bcp:47#zh "Chinese"
* communication[+] = urn:ietf:bcp:47#vi "Vietnamese"

// ---------------------------------------------------------------
// Appointment requirement
// ---------------------------------------------------------------
* appointmentRequired = true

// ---------------------------------------------------------------
// Eligibility (0..*, multiple criteria)
// ---------------------------------------------------------------
* eligibility[+].code = $sct#933451001000036104 "Older adult 65+ years"
* eligibility[=].comment = "Specialist aged care program for patients 65 and over."

// ---------------------------------------------------------------
// Available times (weekdays and Saturday)
// ---------------------------------------------------------------
* availableTime[+].daysOfWeek[+] = #mon
* availableTime[=].daysOfWeek[+] = #tue
* availableTime[=].daysOfWeek[+] = #wed
* availableTime[=].daysOfWeek[+] = #thu
* availableTime[=].daysOfWeek[+] = #fri
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "08:00:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "18:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney

* availableTime[+].daysOfWeek[+] = #sat
* availableTime[=].allDay = false
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableStartTime.extension[timeZone].valueCode = #Australia/Sydney
* availableTime[=].availableEndTime = "13:00:00"
* availableTime[=].availableEndTime.extension[timeZone].valueCode = #Australia/Sydney

// ---------------------------------------------------------------
// Not available periods (e.g. public holidays)
// ---------------------------------------------------------------
* notAvailable[+].description = "Closed for Christmas and New Year public holidays"
* notAvailable[=].during.start = "2026-12-25"
* notAvailable[=].during.end = "2026-12-28"

* notAvailable[+].description = "Closed for Easter public holidays"
* notAvailable[=].during.start = "2027-04-18"
* notAvailable[=].during.end = "2027-04-22"

// ---------------------------------------------------------------
// Extensions
// ---------------------------------------------------------------

// Active period for this directory entry
* extension[active-period].valuePeriod.start = "2024-01-01"
* extension[active-period].valuePeriod.end = "2027-12-31"

// IAR levels of care (0..* — multiple levels shown)
* extension[iar-levels-of-care][+].valueCodeableConcept = $IARCodeSystem#level1 "Level 1 - Self management"
* extension[iar-levels-of-care][+].valueCodeableConcept = $IARCodeSystem#level2 "Level 2 - Low intensity services"
* extension[iar-levels-of-care][+].valueCodeableConcept = $IARCodeSystem#level3 "Level 3 - Moderate intensity services"

// New patient availability
* extension[new-patient-availability].valueCodeableConcept = https://healthterminologies.gov.au/fhir/CodeSystem/new-patient-availability-1#accepting "Accepting new patients"

// Referral information for referrers
* extension[referral-information-for-referrer].valueMarkdown = """
GP referral **not required** for general practice appointments.

For the aged care program, a referral from a GP or geriatrician is required.

Please include:
- Reason for referral
- Current medications list
- Relevant medical history summary

Send referrals via secure messaging to the SMD endpoint or fax to **(02) 9876 5433**.
"""

// Suppressed — service is hidden from public directory search
* extension[suppressed].extension[suppressedBy].valueCodeableConcept = $HCPD_ResponsiblePartyType_CS#organisation-initiated

