Profile: HCPD_HealthcareService
Parent: AUCoreHealthcareService
Id: hcpd-healthcareservice
Title: "HCPD HealthcareService"
Description: "This profile defines a Health Connect Provider Directory entry for a healthcare service offered by an organisation."
* ^status = #active
* ^experimental = false
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^purpose = "This profile solves the business problem of standardising healthcare service representation in the provider directory, enabling consistent description of services, their availability, coverage areas, and associated care levels to facilitate service discovery and patient referral processes."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* . ^definition = "Health Connect entry for a healthcare service at a location by an organisation."

* extension contains IAR_Levels_Of_Care named iar-levels-of-care 0..* MS
* extension[iar-levels-of-care] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[iar-levels-of-care] ^extension[=].extension[+].url = "code"
* extension[iar-levels-of-care] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[iar-levels-of-care] ^extension[=].extension[+].url = "actor"
* extension[iar-levels-of-care] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[iar-levels-of-care] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[iar-levels-of-care] ^extension[=].extension[+].url = "code"
* extension[iar-levels-of-care] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[iar-levels-of-care] ^extension[=].extension[+].url = "actor"
* extension[iar-levels-of-care] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension contains New_Patient_Availability named new-patient-availability 0..1 MS
* extension[new-patient-availability] ^short = "Indicates if Healthcare service is accepting new patients"
* extension[new-patient-availability] ^definition = "Indicates if Healthcare service is accepting new patients. A value of True means the service is accepting new patients."
* extension[new-patient-availability] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[new-patient-availability] ^extension[=].extension[+].url = "code"
* extension[new-patient-availability] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[new-patient-availability] ^extension[=].extension[+].url = "actor"
* extension[new-patient-availability] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[new-patient-availability] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[new-patient-availability] ^extension[=].extension[+].url = "code"
* extension[new-patient-availability] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[new-patient-availability] ^extension[=].extension[+].url = "actor"
* extension[new-patient-availability] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension contains Referral_Information_For_Referrer named referral-information-for-referrer 0..1 MS
* extension[referral-information-for-referrer] ^short = "Referral information for referrers"
* extension[referral-information-for-referrer] ^definition = "Information for referrers about referral requirements for this healthcare service."
* extension[referral-information-for-referrer] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[referral-information-for-referrer] ^extension[=].extension[+].url = "code"
* extension[referral-information-for-referrer] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[referral-information-for-referrer] ^extension[=].extension[+].url = "actor"
* extension[referral-information-for-referrer] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[referral-information-for-referrer] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[referral-information-for-referrer] ^extension[=].extension[+].url = "code"
* extension[referral-information-for-referrer] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[referral-information-for-referrer] ^extension[=].extension[+].url = "actor"
* extension[referral-information-for-referrer] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #open
* identifier ^definition = "Identifier for the HealthCare Service that is used to identify the HealthCare Service across multiple disparate systems."
* identifier ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier ^extension[=].extension[+].url = "code"
* identifier ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier ^extension[=].extension[+].url = "actor"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier ^extension[=].extension[+].url = "code"
* identifier ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier ^extension[=].extension[+].url = "actor"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* identifier contains HCPD_Local_Identifier 1..1 MS

* identifier[HCPD_Local_Identifier] only HCPD_Local_Identifier
* identifier[HCPD_Local_Identifier] ^short = "Local identifier for the HealthcareService attributed by HC"
* identifier[HCPD_Local_Identifier] ^definition = "Local identifier for the HealthcareService attributed by Health Connect. Used for system reference and internal business logic."
* identifier[HCPD_Local_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier[HCPD_Local_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* providedBy 1.. MS
* providedBy only Reference(HCPD_Organization)
* providedBy ^short = "Providing organisation"
* providedBy ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* providedBy ^extension[=].extension[+].url = "code"
* providedBy ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* providedBy ^extension[=].extension[+].url = "actor"
* providedBy ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* providedBy ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* providedBy ^extension[=].extension[+].url = "code"
* providedBy ^extension[=].extension[=].valueCode = #SHOULD:handle
* providedBy ^extension[=].extension[+].url = "actor"
* providedBy ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* type 1.. MS
* type from $service-type-1 (required)
* type ^short = "A high-level descriptor describing the type of healthcare service(s) offered by the organisation"
* type ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type ^extension[=].extension[+].url = "code"
* type ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* type ^extension[=].extension[+].url = "actor"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* type ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-healthcareservice"
* type ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type ^extension[=].extension[+].url = "code"
* type ^extension[=].extension[=].valueCode = #SHOULD:handle
* type ^extension[=].extension[+].url = "actor"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* type ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-healthcareservice"
* type.coding 1..* MS
* type.coding ^short = "Describes the service(s) offered. At least one coding is required"
* type.coding ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type.coding ^extension[=].extension[+].url = "code"
* type.coding ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* type.coding ^extension[=].extension[+].url = "actor"
* type.coding ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* type.coding ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type.coding ^extension[=].extension[+].url = "code"
* type.coding ^extension[=].extension[=].valueCode = #SHOULD:handle
* type.coding ^extension[=].extension[+].url = "actor"
* type.coding ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* type.coding.code 1..1 MS
* type.coding.code ^short = "The healthcare service type code from SNOMED-CT-AU"
* type.coding.code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type.coding.code ^extension[=].extension[+].url = "code"
* type.coding.code ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* type.coding.code ^extension[=].extension[+].url = "actor"
* type.coding.code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* type.coding.code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type.coding.code ^extension[=].extension[+].url = "code"
* type.coding.code ^extension[=].extension[=].valueCode = #SHOULD:handle
* type.coding.code ^extension[=].extension[+].url = "actor"
* type.coding.code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* type.coding.display 1..1 MS
* type.coding.display ^short = "The display name of the healthcare service type from SNOMED-CT-AU"

* location 1..1 MS
* location only Reference(HCPD_Location)
* location ^short = "Single location for this service"
* location ^definition = "The location where this healthcare service may be provided."
* location ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* location ^extension[=].extension[+].url = "code"
* location ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* location ^extension[=].extension[+].url = "actor"
* location ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* location ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* location ^extension[=].extension[+].url = "code"
* location ^extension[=].extension[=].valueCode = #SHOULD:handle
* location ^extension[=].extension[+].url = "actor"
* location ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* comment 0..1 MS
* comment ^short = "Additional description and/or any specific information about the healthcare service, not covered elsewhere"
* comment ^definition = "Additional details, that the service provider can add for their directory listing, as a free text, that is not covered by other available data elements."
* comment ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* comment ^extension[=].extension[+].url = "code"
* comment ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* comment ^extension[=].extension[+].url = "actor"
* comment ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* comment ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* comment ^extension[=].extension[+].url = "code"
* comment ^extension[=].extension[=].valueCode = #SHOULD:handle
* comment ^extension[=].extension[+].url = "actor"
* comment ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* telecom MS
* telecom ^short = "Phone number, fax number, email"
* telecom ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom ^extension[=].extension[+].url = "code"
* telecom ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* telecom ^extension[=].extension[+].url = "actor"
* telecom ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* telecom ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* telecom ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-healthcareservice"

* telecom.extension contains http://hl7.org.au/fhir/StructureDefinition/contact-purpose named contact-purpose 0..1 MS
* telecom.extension[contact-purpose].valueCodeableConcept from http://terminology.hl7.org.au/ValueSet/contact-purpose (extensible)

* telecom ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom ^extension[=].extension[+].url = "code"
* telecom ^extension[=].extension[=].valueCode = #SHOULD:handle
* telecom ^extension[=].extension[+].url = "actor"
* telecom ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* telecom ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* telecom ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-healthcareservice"

* coverageArea MS
* coverageArea ^short = "The location(s) that this healthcare service is available to"
* coverageArea only Reference(HCPD_Service_Coverage_Area)
* coverageArea ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* coverageArea ^extension[=].extension[+].url = "code"
* coverageArea ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* coverageArea ^extension[=].extension[+].url = "actor"
* coverageArea ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* coverageArea ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* coverageArea ^extension[=].extension[+].url = "code"
* coverageArea ^extension[=].extension[=].valueCode = #SHOULD:handle
* coverageArea ^extension[=].extension[+].url = "actor"
* coverageArea ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* serviceProvisionCode 0..* MS
* serviceProvisionCode from Service_Provision_Code_VS (required)
* serviceProvisionCode ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* serviceProvisionCode ^extension[=].extension[+].url = "code"
* serviceProvisionCode ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* serviceProvisionCode ^extension[=].extension[+].url = "actor"
* serviceProvisionCode ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* serviceProvisionCode ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* serviceProvisionCode ^extension[=].extension[+].url = "code"
* serviceProvisionCode ^extension[=].extension[=].valueCode = #SHOULD:handle
* serviceProvisionCode ^extension[=].extension[+].url = "actor"
* serviceProvisionCode ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* communication 0..* MS
* communication ^short = "The languages that this healthcare service is offered in"
* communication ^definition = "Including the languages that the service is offered in, will help assist the requester / searcher in making informed decision and choose the service that meet their requirement when seeking healthcare service."
* communication ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* communication ^extension[=].extension[+].url = "code"
* communication ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* communication ^extension[=].extension[+].url = "actor"
* communication ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* communication ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* communication ^extension[=].extension[+].url = "code"
* communication ^extension[=].extension[=].valueCode = #SHOULD:handle
* communication ^extension[=].extension[+].url = "actor"
* communication ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* appointmentRequired 0..1 MS
* appointmentRequired ^short = "Whether an appointment is required for this service"
* appointmentRequired ^definition = "Whether an appointment is required for this service, or walk-in accepted – Yes or No (Null value represent ‘no data available’)."
* appointmentRequired ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* appointmentRequired ^extension[=].extension[+].url = "code"
* appointmentRequired ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* appointmentRequired ^extension[=].extension[+].url = "actor"
* appointmentRequired ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* appointmentRequired ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* appointmentRequired ^extension[=].extension[+].url = "code"
* appointmentRequired ^extension[=].extension[=].valueCode = #SHOULD:handle
* appointmentRequired ^extension[=].extension[+].url = "actor"
* appointmentRequired ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* availableTime MS
* availableTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime ^extension[=].extension[+].url = "code"
* availableTime ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* availableTime ^extension[=].extension[+].url = "actor"
* availableTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* availableTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime ^extension[=].extension[+].url = "code"
* availableTime ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime ^extension[=].extension[+].url = "actor"
* availableTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* availableTime.daysOfWeek 0..* MS
* availableTime.daysOfWeek ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.daysOfWeek ^extension[=].extension[+].url = "code"
* availableTime.daysOfWeek ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* availableTime.daysOfWeek ^extension[=].extension[+].url = "actor"
* availableTime.daysOfWeek ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* availableTime.daysOfWeek ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.daysOfWeek ^extension[=].extension[+].url = "code"
* availableTime.daysOfWeek ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.daysOfWeek ^extension[=].extension[+].url = "actor"
* availableTime.daysOfWeek ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* availableTime.allDay MS
* availableTime.allDay ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.allDay ^extension[=].extension[+].url = "code"
* availableTime.allDay ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* availableTime.allDay ^extension[=].extension[+].url = "actor"
* availableTime.allDay ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* availableTime.allDay ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.allDay ^extension[=].extension[+].url = "code"
* availableTime.allDay ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.allDay ^extension[=].extension[+].url = "actor"
* availableTime.allDay ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* availableTime.availableStartTime MS
* availableTime.availableStartTime.extension[timeZone] ^sliceName = "timeZone"
* availableTime.availableStartTime.extension[timeZone] ^short = "The date on which an organisation commences offering a service"
* availableTime.availableStartTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.availableStartTime ^extension[=].extension[+].url = "code"
* availableTime.availableStartTime ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* availableTime.availableStartTime ^extension[=].extension[+].url = "actor"
* availableTime.availableStartTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* availableTime.availableStartTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.availableStartTime ^extension[=].extension[+].url = "code"
* availableTime.availableStartTime ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.availableStartTime ^extension[=].extension[+].url = "actor"
* availableTime.availableStartTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* availableTime.availableEndTime MS
* availableTime.availableEndTime.extension[timeZone] ^sliceName = "timeZone"
* availableTime.availableEndTime.extension[timeZone] ^short = "The date on which an organisation ceases to offer a service"
* availableTime.availableEndTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.availableEndTime ^extension[=].extension[+].url = "code"
* availableTime.availableEndTime ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* availableTime.availableEndTime ^extension[=].extension[+].url = "actor"
* availableTime.availableEndTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* availableTime.availableEndTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.availableEndTime ^extension[=].extension[+].url = "code"
* availableTime.availableEndTime ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.availableEndTime ^extension[=].extension[+].url = "actor"
* availableTime.availableEndTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* notAvailable MS
* notAvailable ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* notAvailable ^extension[=].extension[+].url = "code"
* notAvailable ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* notAvailable ^extension[=].extension[+].url = "actor"
* notAvailable ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* notAvailable ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* notAvailable ^extension[=].extension[+].url = "code"
* notAvailable ^extension[=].extension[=].valueCode = #SHOULD:handle
* notAvailable ^extension[=].extension[+].url = "actor"
* notAvailable ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* notAvailable.description MS
* notAvailable.description ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* notAvailable.description ^extension[=].extension[+].url = "code"
* notAvailable.description ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* notAvailable.description ^extension[=].extension[+].url = "actor"
* notAvailable.description ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* notAvailable.description ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* notAvailable.description ^extension[=].extension[+].url = "code"
* notAvailable.description ^extension[=].extension[=].valueCode = #SHOULD:handle
* notAvailable.description ^extension[=].extension[+].url = "actor"
* notAvailable.description ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* notAvailable.during MS
* notAvailable.during ^short = "Date range that the service is not available - can be open-ended if service is closing"
* notAvailable.during ^definition = "Date range that the service is not available - can be open-ended if service is closing."
* notAvailable.during ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* notAvailable.during ^extension[=].extension[+].url = "code"
* notAvailable.during ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* notAvailable.during ^extension[=].extension[+].url = "actor"
* notAvailable.during ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* notAvailable.during ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* notAvailable.during ^extension[=].extension[+].url = "code"
* notAvailable.during ^extension[=].extension[=].valueCode = #SHOULD:handle
* notAvailable.during ^extension[=].extension[+].url = "actor"
* notAvailable.during ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* eligibility 0..* MS
* eligibility ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* eligibility ^extension[=].extension[+].url = "code"
* eligibility ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* eligibility ^extension[=].extension[+].url = "actor"
* eligibility ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* eligibility ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* eligibility ^extension[=].extension[+].url = "code"
* eligibility ^extension[=].extension[=].valueCode = #SHOULD:handle
* eligibility ^extension[=].extension[+].url = "actor"
* eligibility ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* eligibility.code MS
* eligibility.code from https://healthterminologies.gov.au/fhir/ValueSet/service-eligibility-1 (required)
* eligibility.code ^short = "Eligibility requirements for the healthcare service."
* eligibility.code ^definition = "Eligibility requirements for the healthcare service, bound to the HealthConnect Service Eligibility ValueSet."
* eligibility.code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* eligibility.code ^extension[=].extension[+].url = "code"
* eligibility.code ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* eligibility.code ^extension[=].extension[+].url = "actor"
* eligibility.code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* eligibility.code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* eligibility.code ^extension[=].extension[+].url = "code"
* eligibility.code ^extension[=].extension[=].valueCode = #SHOULD:handle
* eligibility.code ^extension[=].extension[+].url = "actor"
* eligibility.code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"


* extension contains http://digitalhealth.gov.au/fhir/cc/StructureDefinition/active-period named active-period 0..1 MS
* extension[active-period] ^short = "The period during which the HealthcareService is active."
* extension[active-period] ^definition = "The time period during which the HealthcareService is considered active in the HealthConnect directory."
* extension[active-period] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[active-period] ^extension[=].extension[+].url = "code"
* extension[active-period] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[active-period] ^extension[=].extension[+].url = "actor"
* extension[active-period] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[active-period] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[active-period] ^extension[=].extension[+].url = "code"
* extension[active-period] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[active-period] ^extension[=].extension[+].url = "actor"
* extension[active-period] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"


* endpoint 0..* MS
* endpoint only Reference(HCPD_Endpoint)
* endpoint ^short = "Reference to all linked endpoints that are related to this healthcare service for electronic communication or exchange"
* endpoint ^definition = "This will provide the linked endpoints that are related to this healthcare service, that can be discovered by other organisations for system-to-system electronic communication."
* endpoint ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* endpoint ^extension[=].extension[+].url = "code"
* endpoint ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* endpoint ^extension[=].extension[+].url = "actor"
* endpoint ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* endpoint ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* endpoint ^extension[=].extension[+].url = "code"
* endpoint ^extension[=].extension[=].valueCode = #SHOULD:handle
* endpoint ^extension[=].extension[+].url = "actor"
* endpoint ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

