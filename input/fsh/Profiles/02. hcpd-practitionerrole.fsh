Invariant: inv-01-identifier-registration-required
Description: "Either Ahpra or PRN identifier SHALL exist, but not both. While a practitioner can have more than one professional registration and
professions (e.g. nurse and midwife), the relevant registration that is applicable for this role only is captured."
Expression: "(identifier.type.coding.where(code = 'AHPRA').exists() and identifier.type.coding.where(code = 'PRN').exists().not()) or (identifier.type.coding.where(code = 'PRN').exists() and identifier.type.coding.where(code = 'AHPRA').exists().not())"
Severity: #error

Invariant: inv-02-identifier-registration-match
Description: "PractitionerRole registration identifiers SHOULD match with the referenced Practitioner's registration identifiers in qualifications"
Expression: "practitioner.resolve().qualification.identifier.where(type.coding.where(code = 'AHPRA').exists()).value.intersect(identifier.where(type.coding.where(code = 'AHPRA').exists()).value).exists() or practitioner.resolve().qualification.identifier.where(type.coding.where(code = 'PRN').exists()).value.intersect(identifier.where(type.coding.where(code = 'PRN').exists()).value).exists()"
Severity: #warning

Profile: HCPD_PractitionerRole
Parent: AUCorePractitionerRole
Id: hcpd-practitionerrole
Title: "HCPD PractitionerRole"
Description: "This profile defines a Health Connect Provider Directory entry for a practitioner role within an organisation."
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
* ^purpose = "This profile addresses the business requirement to define practitioner roles within healthcare organizations in the provider directory, enabling the representation of practitioner-organization-location relationships and associated service offerings for referral and directory search purposes."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* . ^definition = "Directory entry for a provider at a location for an organisation."

* obeys inv-01-identifier-registration-required
* obeys inv-02-identifier-registration-match

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system: must include at least one HCPD Location Identifier known to this profile"
* identifier ^slicing.ordered = false
* identifier 1..* MS
* identifier ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier ^extension[=].extension[+].url = "code"
* identifier ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier ^extension[=].extension[+].url = "actor"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* identifier ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier ^extension[=].extension[+].url = "code"
* identifier ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier ^extension[=].extension[+].url = "actor"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* identifier ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"

* identifier contains HCPD_Local_Identifier 1..1 MS

* identifier[HCPD_Local_Identifier] ^definition = "Local identifier for the PractitionerRole attributed by Health Connect. Used for system reference and internal business logic."
* identifier[HCPD_Local_Identifier] only HCPD_Local_Identifier
* identifier[HCPD_Local_Identifier] ^short = "Local identifier for the PractitionerRole attributed by HC"
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

* identifier[medicareProvider] 0..1 MS
* identifier[medicareProvider] ^short = "Medicare provider number"
* identifier[medicareProvider] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[medicareProvider] ^extension[=].extension[+].url = "code"
* identifier[medicareProvider] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier[medicareProvider] ^extension[=].extension[+].url = "actor"
* identifier[medicareProvider] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier[medicareProvider] ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier[medicareProvider] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* identifier[medicareProvider] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[medicareProvider] ^extension[=].extension[+].url = "code"
* identifier[medicareProvider] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[medicareProvider] ^extension[=].extension[+].url = "actor"
* identifier[medicareProvider] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* identifier[medicareProvider] ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier[medicareProvider] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* identifier contains peakbodyregistrationnumber 0..1 MS
* identifier[peakbodyregistrationnumber] only HCPD_Peak_Body_Registration_Number
* identifier[peakbodyregistrationnumber] ^short = "Professional association / Peak body association (for non-Ahpra registered practitioners), as recorded against the HPI-I record"
* identifier[peakbodyregistrationnumber] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[+].url = "code"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier[peakbodyregistrationnumber] ^extension[=].extension[+].url = "actor"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier[peakbodyregistrationnumber] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[+].url = "code"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[peakbodyregistrationnumber] ^extension[=].extension[+].url = "actor"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* identifier contains ahpraregistrationnumber 0..1 MS
* identifier[ahpraregistrationnumber] only $au-ahpraregistrationnumber
* identifier[ahpraregistrationnumber] ^short = "Ahpra Registration Number"
* identifier[ahpraregistrationnumber] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[ahpraregistrationnumber] ^extension[=].extension[+].url = "code"
* identifier[ahpraregistrationnumber] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier[ahpraregistrationnumber] ^extension[=].extension[+].url = "actor"
* identifier[ahpraregistrationnumber] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier[ahpraregistrationnumber] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[ahpraregistrationnumber] ^extension[=].extension[+].url = "code"
* identifier[ahpraregistrationnumber] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[ahpraregistrationnumber] ^extension[=].extension[+].url = "actor"
* identifier[ahpraregistrationnumber] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* period 0..1 MS
* period ^short = "The period during which the practitioner is active in this role."
* period ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* period ^extension[=].extension[+].url = "code"
* period ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* period ^extension[=].extension[+].url = "actor"
* period ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* period ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* period ^extension[=].extension[+].url = "code"
* period ^extension[=].extension[=].valueCode = #SHOULD:handle
* period ^extension[=].extension[+].url = "actor"
* period ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* practitioner 1.. 
* practitioner only Reference(HCPD_Practitioner)
* practitioner ^short = "Practitioner in the role"
* practitioner ^definition = "Australian practitioner directory entry in this role."
* practitioner ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* practitioner ^extension[=].extension[+].url = "code"
* practitioner ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* practitioner ^extension[=].extension[+].url = "actor"
* practitioner ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* practitioner ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* practitioner ^extension[=].extension[+].url = "code"
* practitioner ^extension[=].extension[=].valueCode = #SHOULD:handle
* practitioner ^extension[=].extension[+].url = "actor"
* practitioner ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* organization 1.. 
* organization only Reference(HCPD_Organization)
* organization ^short = "Organisation providing this role. Reference to be the same organisation as the referenced HealthcareService for this role."
* organization ^definition = "Australian organisation directory entry providing this role."
* organization ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* organization ^extension[=].extension[+].url = "code"
* organization ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* organization ^extension[=].extension[+].url = "actor"
* organization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* organization ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* organization ^extension[=].extension[+].url = "code"
* organization ^extension[=].extension[=].valueCode = #SHOULD:handle
* organization ^extension[=].extension[+].url = "actor"
* organization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* code 1..1 MS
* code ^short = "The primary role of the practitioner"
* code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code ^extension[=].extension[+].url = "code"
* code ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* code ^extension[=].extension[+].url = "actor"
* code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* code ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code ^extension[=].extension[+].url = "code"
* code ^extension[=].extension[=].valueCode = #SHOULD:handle
* code ^extension[=].extension[+].url = "actor"
* code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* code ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"

* location 1..1 MS
* location only Reference(HCPD_Location) 
* location ^short = "Location at which this role is provided. Reference to be the same Location as the referenced HealthcareService for this role."
* location ^definition = "Location details describing where the role is being provided."
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

* healthcareService 1..1 MS
* healthcareService only Reference(HCPD_HealthcareService)
* healthcareService ^short = "Healthcare service at which this role is provided."
* healthcareService ^definition = "Healthcare details describing where the role is being provided."
* healthcareService ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* healthcareService ^extension[=].extension[+].url = "code"
* healthcareService ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* healthcareService ^extension[=].extension[+].url = "actor"
* healthcareService ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* healthcareService ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* healthcareService ^extension[=].extension[+].url = "code"
* healthcareService ^extension[=].extension[=].valueCode = #SHOULD:handle
* healthcareService ^extension[=].extension[+].url = "actor"
* healthcareService ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* telecom 
* telecom ^short = "Contact details for the practitioner in this role."
* telecom ^definition = "Details for contacting the practitioner in this role."

* availableTime 0..* MS
* availableTime ^short = "Times that the practitioner provides the healthcare service in this role at this location."
* availableTime ^definition = "Times that the practitioner provides the healthcare service in this role at this location."
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

* endpoint 0..* MS
* endpoint only Reference(HCPD_Endpoint)
* endpoint ^short = "Technical endpoints for this practitioner role."
* endpoint ^definition = "Details for service based communication with the practitioner in this role. This can include web services, messaging profiles and other protocol based communication."
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

* extension contains PractitionerRole_Communication named practitioner-role-communication 0..* MS
* extension[practitioner-role-communication] ^short = "Practitioner role communication preferences"
* extension[practitioner-role-communication] ^definition = "Communication preferences and available modes for a practitioner in this role."
* extension[practitioner-role-communication] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[practitioner-role-communication] ^extension[=].extension[+].url = "code"
* extension[practitioner-role-communication] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[practitioner-role-communication] ^extension[=].extension[+].url = "actor"
* extension[practitioner-role-communication] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[practitioner-role-communication] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[practitioner-role-communication] ^extension[=].extension[+].url = "code"
* extension[practitioner-role-communication] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[practitioner-role-communication] ^extension[=].extension[+].url = "actor"
* extension[practitioner-role-communication] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* extension contains http://digitalhealth.gov.au/fhir/cc/StructureDefinition/alternate-name named alternate-name 0..1 MS
* extension[alternate-name] ^short = "Alternate name for this practitioner role"
* extension[alternate-name] ^definition = "Name by which a practitioner chooses to be known in the context of the delivery of a specific healthcare service."
* extension[alternate-name] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[alternate-name] ^extension[=].extension[+].url = "code"
* extension[alternate-name] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[alternate-name] ^extension[=].extension[+].url = "actor"
* extension[alternate-name] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[alternate-name] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[alternate-name] ^extension[=].extension[+].url = "code"
* extension[alternate-name] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[alternate-name] ^extension[=].extension[+].url = "actor"
* extension[alternate-name] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
