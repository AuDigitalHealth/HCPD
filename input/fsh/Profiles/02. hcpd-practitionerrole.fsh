Profile: HCPD_PractitionerRole
Parent: AUCorePractitionerRole
Id: hcpd-practitionerrole
Title: "HCPD PractitionerRole"
Description: "This profile defines a Health Connect Provider Directory entry for a practitioner role within an organisation."
* ^status = #active
* ^experimental = false
* ^purpose = "This profile addresses the business requirement to define practitioner roles within healthcare organizations in the provider directory, enabling the representation of practitioner-organization-location relationships and associated service offerings for referral and directory search purposes."
* . ^definition = "Directory entry for a provider at a location for an organisation."

* extension contains Suppressed named suppressed 0..1 MS and Deactivated named deactivated 0..1 MS
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding from $HCPD_ResponsiblePartyType_VS (required)
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding 1..2 MS
* extension[suppressed] ^short = "Indicates whether the PractitionerRole should be hidden."
* extension[suppressed] ^definition = "A coded value, when present, indicates whether the PractitionerRole should be hidden from display in the Provider Directory."
* extension[suppressed] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[suppressed] ^extension[=].extension[+].url = "code"
* extension[suppressed] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[suppressed] ^extension[=].extension[+].url = "actor"
* extension[suppressed] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[suppressed] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[suppressed] ^extension[=].extension[+].url = "code"
* extension[suppressed] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[suppressed] ^extension[=].extension[+].url = "actor"
* extension[suppressed] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension[suppressed] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[suppressed] ^extension[=].extension[+].url = "code"
* extension[suppressed] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[suppressed] ^extension[=].extension[+].url = "actor"
* extension[suppressed] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* extension[deactivated].extension[deactivatedBy].valueCodeableConcept.coding from $HCPD_ResponsiblePartyType_VS (required)
* extension[deactivated].extension[deactivatedBy].valueCodeableConcept.coding 1..2 MS
* extension[deactivated] ^short = "Indicates whether the PractitionerRole should be hidden."
* extension[deactivated] ^definition = "When present, this extension marks the PractitionerRole as deactivated, and deactivation automatically cascades to all child resources."
* extension[deactivated] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[deactivated] ^extension[=].extension[+].url = "code"
* extension[deactivated] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[deactivated] ^extension[=].extension[+].url = "actor"
* extension[deactivated] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[deactivated] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[deactivated] ^extension[=].extension[+].url = "code"
* extension[deactivated] ^extension[=].extension[=].valueCode = #SHALL:ignore
* extension[deactivated] ^extension[=].extension[+].url = "actor"
* extension[deactivated] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension[deactivated] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[deactivated] ^extension[=].extension[+].url = "code"
* extension[deactivated] ^extension[=].extension[=].valueCode = #SHALL:ignore
* extension[deactivated] ^extension[=].extension[+].url = "actor"
* extension[deactivated] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system: must include at least one HCPD Location Identifier known to this profile"
* identifier ^slicing.ordered = false
* identifier 2..* MS
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
* identifier ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier ^extension[=].extension[+].url = "code"
* identifier ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier ^extension[=].extension[+].url = "actor"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* identifier ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"

* identifier contains HCPD_Local_Identifier 1..1 MS and HCPD_Source_Identifier 1..1 MS

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
* identifier[HCPD_Local_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* identifier[HCPD_Source_Identifier] only HCPD_Source_Identifier
* identifier[HCPD_Source_Identifier] ^short = "Identifier attributed from source system. Source for PractitionerRole: PCA."
* identifier[HCPD_Source_Identifier] ^definition = "Unique identifier for the PractitionerRole attributed from source system. Not exposed externally but can be used for system reference or internal business logic."
* identifier[HCPD_Source_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier[HCPD_Source_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier[HCPD_Source_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[HCPD_Source_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* identifier[HCPD_Source_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[HCPD_Source_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Source_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* identifier[medicareProvider] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[medicareProvider] ^extension[=].extension[+].url = "code"
* identifier[medicareProvider] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[medicareProvider] ^extension[=].extension[+].url = "actor"
* identifier[medicareProvider] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* identifier[medicareProvider] ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier[medicareProvider] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"
* identifier contains peakbodyregistrationnumber 0..1 MS
* identifier[peakbodyregistrationnumber] only Peak_Body_Professional_Registration_Number
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
* identifier[peakbodyregistrationnumber] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[+].url = "code"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[peakbodyregistrationnumber] ^extension[=].extension[+].url = "actor"
* identifier[peakbodyregistrationnumber] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* identifier[ahpraregistrationnumber] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[ahpraregistrationnumber] ^extension[=].extension[+].url = "code"
* identifier[ahpraregistrationnumber] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[ahpraregistrationnumber] ^extension[=].extension[+].url = "actor"
* identifier[ahpraregistrationnumber] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* active 1..1 MS
* active ^short = "Whether this practitioner's role is active. Only active externally exposed."
* active ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* active ^extension[=].extension[+].url = "code"
* active ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* active ^extension[=].extension[+].url = "actor"
* active ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* active ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* active ^extension[=].extension[+].url = "code"
* active ^extension[=].extension[=].valueCode = #SHOULD:handle
* active ^extension[=].extension[+].url = "actor"
* active ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* active ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* active ^extension[=].extension[+].url = "code"
* active ^extension[=].extension[=].valueCode = #SHOULD:handle
* active ^extension[=].extension[+].url = "actor"
* active ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* period ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* period ^extension[=].extension[+].url = "code"
* period ^extension[=].extension[=].valueCode = #SHOULD:handle
* period ^extension[=].extension[+].url = "actor"
* period ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* practitioner 1.. MS
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
* practitioner ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* practitioner ^extension[=].extension[+].url = "code"
* practitioner ^extension[=].extension[=].valueCode = #SHOULD:handle
* practitioner ^extension[=].extension[+].url = "actor"
* practitioner ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* organization 1..  MS
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
* organization ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* organization ^extension[=].extension[+].url = "code"
* organization ^extension[=].extension[=].valueCode = #SHOULD:handle
* organization ^extension[=].extension[+].url = "actor"
* organization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code ^extension[=].extension[+].url = "code"
* code ^extension[=].extension[=].valueCode = #SHOULD:handle
* code ^extension[=].extension[+].url = "actor"
* code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* code ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-practitionerrole"

* code.coding 1..* MS
* code.coding ^short = "The practitioner's occupation or profession or role type"
* code.coding ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code.coding ^extension[=].extension[+].url = "code"
* code.coding ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* code.coding ^extension[=].extension[+].url = "actor"
* code.coding ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* code.coding ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code.coding ^extension[=].extension[+].url = "code"
* code.coding ^extension[=].extension[=].valueCode = #SHOULD:handle
* code.coding ^extension[=].extension[+].url = "actor"
* code.coding ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* code.coding ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code.coding ^extension[=].extension[+].url = "code"
* code.coding ^extension[=].extension[=].valueCode = #SHOULD:handle
* code.coding ^extension[=].extension[+].url = "actor"
* code.coding ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* code.coding.code 1..1 MS
* code.coding.code ^short = "The SNOMED CT-AU code of the practitioner occupation or profession or role type"
* code.coding.code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code.coding.code ^extension[=].extension[+].url = "code"
* code.coding.code ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* code.coding.code ^extension[=].extension[+].url = "actor"
* code.coding.code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* code.coding.code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code.coding.code ^extension[=].extension[+].url = "code"
* code.coding.code ^extension[=].extension[=].valueCode = #SHOULD:handle
* code.coding.code ^extension[=].extension[+].url = "actor"
* code.coding.code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* code.coding.code ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* code.coding.code ^extension[=].extension[+].url = "code"
* code.coding.code ^extension[=].extension[=].valueCode = #SHOULD:handle
* code.coding.code ^extension[=].extension[+].url = "actor"
* code.coding.code ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* code.coding.display 1..1 MS
* code.coding.display ^short = "The SNOMED CT-AU display name of the practitioner occupation or profession or role type"

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
* location ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* location ^extension[=].extension[+].url = "code"
* location ^extension[=].extension[=].valueCode = #SHOULD:handle
* location ^extension[=].extension[+].url = "actor"
* location ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* healthcareService ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* healthcareService ^extension[=].extension[+].url = "code"
* healthcareService ^extension[=].extension[=].valueCode = #SHOULD:handle
* healthcareService ^extension[=].extension[+].url = "actor"
* healthcareService ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* telecom  MS
* telecom ^short = "Contact details for the practitioner in this role."
* telecom ^definition = "Details for contacting the practitioner in this role."
* telecom ^definition = "Healthcare details describing where the role is being provided."
* telecom ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom ^extension[=].extension[+].url = "code"
* telecom ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* telecom ^extension[=].extension[+].url = "actor"
* telecom ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* telecom ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom ^extension[=].extension[+].url = "code"
* telecom ^extension[=].extension[=].valueCode = #SHOULD:handle
* telecom ^extension[=].extension[+].url = "actor"
* telecom ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* telecom ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom ^extension[=].extension[+].url = "code"
* telecom ^extension[=].extension[=].valueCode = #SHOULD:handle
* telecom ^extension[=].extension[+].url = "actor"
* telecom ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"


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
* availableTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime ^extension[=].extension[+].url = "code"
* availableTime ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime ^extension[=].extension[+].url = "actor"
* availableTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
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
* availableTime.daysOfWeek ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.daysOfWeek ^extension[=].extension[+].url = "code"
* availableTime.daysOfWeek ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.daysOfWeek ^extension[=].extension[+].url = "actor"
* availableTime.daysOfWeek ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
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
* availableTime.allDay ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.allDay ^extension[=].extension[+].url = "code"
* availableTime.allDay ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.allDay ^extension[=].extension[+].url = "actor"
* availableTime.allDay ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
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
* availableTime.availableStartTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.availableStartTime ^extension[=].extension[+].url = "code"
* availableTime.availableStartTime ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.availableStartTime ^extension[=].extension[+].url = "actor"
* availableTime.availableStartTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
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
* availableTime.availableEndTime ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* availableTime.availableEndTime ^extension[=].extension[+].url = "code"
* availableTime.availableEndTime ^extension[=].extension[=].valueCode = #SHOULD:handle
* availableTime.availableEndTime ^extension[=].extension[+].url = "actor"
* availableTime.availableEndTime ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* endpoint ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* endpoint ^extension[=].extension[+].url = "code"
* endpoint ^extension[=].extension[=].valueCode = #SHOULD:handle
* endpoint ^extension[=].extension[+].url = "actor"
* endpoint ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* extension[practitioner-role-communication] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[practitioner-role-communication] ^extension[=].extension[+].url = "code"
* extension[practitioner-role-communication] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[practitioner-role-communication] ^extension[=].extension[+].url = "actor"
* extension[practitioner-role-communication] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

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
* extension[alternate-name] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[alternate-name] ^extension[=].extension[+].url = "code"
* extension[alternate-name] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[alternate-name] ^extension[=].extension[+].url = "actor"
* extension[alternate-name] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
