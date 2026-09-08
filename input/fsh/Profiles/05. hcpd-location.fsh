Profile: HCPD_Location
Parent: AUCoreLocation
Id: hcpd-location
Title: "HCPD Location"
Description: "This profile defines a Health Connect Provider Directory entry for a healthcare location where services are provided."
* ^experimental = false
* ^status = #active
* ^purpose = "This profile addresses the business need to standardise location information in the Health Connect Provider Directory, enabling consistent representation of physical, mobile, and virtual healthcare service delivery sites for directory search and service location purposes."
* . ^short = "Australian Location Directory Entry"

* obeys inv-01-address-requirement and inv-02-type-mobl-requires-modifier and inv-03-type-vi-should-not-have-modifier and inv-04-type-or-physicaltype-present and inv-05-status-values

* meta ^short = "Metadata on Location"

* extension contains Suppressed named suppressed 0..1 MS
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated (exactly)
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding 1..1 MS
* extension[suppressed] ^short = "Indicates if Location service is suppressed"
* extension[suppressed] ^definition = "Indicates if Location service is suppressed."
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


* status 1..1 MS
* status ^short = "Used to show if this location is in operation. Only locations with status ‘Active’ are exposed externally and discoverable/visible in the directory."
* status ^definition = "To ensure that only locations with status ‘Active’ are displayed & discoverable externally."
* status ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* status ^extension[=].extension[+].url = "code"
* status ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* status ^extension[=].extension[+].url = "actor"
* status ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* status ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* status ^extension[=].extension[+].url = "code"
* status ^extension[=].extension[=].valueCode = #SHOULD:handle
* status ^extension[=].extension[+].url = "actor"
* status ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* status ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* status ^extension[=].extension[+].url = "code"
* status ^extension[=].extension[=].valueCode = #SHOULD:handle
* status ^extension[=].extension[+].url = "actor"
* status ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system: must include at least one HCPD Location Identifier known to this profile"
* identifier ^slicing.ordered = false
* identifier 2..* MS
* identifier contains HCPD_Source_Identifier 1..1 MS and HCPD_Local_Identifier 1..1 MS

* identifier[HCPD_Source_Identifier] only HCPD_Source_Identifier
* identifier[HCPD_Source_Identifier] ^short = "Identifier attributed from source system. Source for Location: PCA"
* identifier[HCPD_Source_Identifier] ^definition = "Unique identifier for the healthcare location attributed from source system. Not exposed externally but can be used for system reference or internal business logic."
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

* identifier[HCPD_Local_Identifier] only HCPD_Local_Identifier
* identifier[HCPD_Local_Identifier] ^short = "Local Identifier for the location attributed by HC"
* identifier[HCPD_Local_Identifier] ^definition = "Local Identifier for the Location attributed by Health Connect. Used for system reference and internal business logic."
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

* name 1..1 MS
* name ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* name ^extension[=].extension[+].url = "code"
* name ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* name ^extension[=].extension[+].url = "actor"
* name ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* name ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* name ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* name ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* name ^extension[=].extension[+].url = "code"
* name ^extension[=].extension[=].valueCode = #SHOULD:handle
* name ^extension[=].extension[+].url = "actor"
* name ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* name ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* name ^extension[=].extension[+].url = "code"
* name ^extension[=].extension[=].valueCode = #SHOULD:handle
* name ^extension[=].extension[+].url = "actor"
* name ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* name ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* name ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"

* alias 0..* MS
* alias ^short = "Alternative names for the location"
* alias ^definition = "Other names or aliases by which this location is known, such as abbreviations, former names, or local names."
* alias ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* alias ^extension[=].extension[+].url = "code"
* alias ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* alias ^extension[=].extension[+].url = "actor"
* alias ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* alias ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* alias ^extension[=].extension[+].url = "code"
* alias ^extension[=].extension[=].valueCode = #SHOULD:handle
* alias ^extension[=].extension[+].url = "actor"
* alias ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* alias ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* alias ^extension[=].extension[+].url = "code"
* alias ^extension[=].extension[=].valueCode = #SHOULD:handle
* alias ^extension[=].extension[+].url = "actor"
* alias ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* type 0..* MS
* type from https://healthterminologies.gov.au/fhir/ValueSet/service-delivery-location-role-type-1 (extensible)
* type ^short = "Indicates whether the location is a virtual location or mobile service."
* type ^definition = "Indicates whether the location is a fixed physical place, virtual location or a mobile service. Used to identify the type of location that meets their patient's needs."
* type ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type ^extension[=].extension[+].url = "code"
* type ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* type ^extension[=].extension[+].url = "actor"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* type ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* type ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type ^extension[=].extension[+].url = "code"
* type ^extension[=].extension[=].valueCode = #SHOULD:handle
* type ^extension[=].extension[+].url = "actor"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* type ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* type ^extension[=].extension[+].url = "code"
* type ^extension[=].extension[=].valueCode = #SHOULD:handle
* type ^extension[=].extension[+].url = "actor"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* type ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* type ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"

* telecom 0..* MS
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom ^slicing.description = "Slice based on telecom system: phone, email. Must have at least one of each."
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

* telecom contains phone 0..* MS and email 0..* MS
* telecom[phone] 0..* MS
* telecom[phone].system = #phone
* telecom[phone] ^short = "Phone number for the location."
* telecom[phone] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom[phone] ^extension[=].extension[+].url = "code"
* telecom[phone] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* telecom[phone] ^extension[=].extension[+].url = "actor"
* telecom[phone] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* telecom[phone] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom[phone] ^extension[=].extension[+].url = "code"
* telecom[phone] ^extension[=].extension[=].valueCode = #SHOULD:handle
* telecom[phone] ^extension[=].extension[+].url = "actor"
* telecom[phone] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* telecom[phone] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom[phone] ^extension[=].extension[+].url = "code"
* telecom[phone] ^extension[=].extension[=].valueCode = #SHOULD:handle
* telecom[phone] ^extension[=].extension[+].url = "actor"
* telecom[phone] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* telecom[email] 0..* MS
* telecom[email].system = #email
* telecom[email] ^short = "Email address for the location."
* telecom[email] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom[email] ^extension[=].extension[+].url = "code"
* telecom[email] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* telecom[email] ^extension[=].extension[+].url = "actor"
* telecom[email] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* telecom[email] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom[email] ^extension[=].extension[+].url = "code"
* telecom[email] ^extension[=].extension[=].valueCode = #SHOULD:handle
* telecom[email] ^extension[=].extension[+].url = "actor"
* telecom[email] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* telecom[email] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* telecom[email] ^extension[=].extension[+].url = "code"
* telecom[email] ^extension[=].extension[=].valueCode = #SHOULD:handle
* telecom[email] ^extension[=].extension[+].url = "actor"
* telecom[email] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* address 0..1 MS
* address ^short = "Address where the service or practitioner role is located. Virtual and mobile locations may not have a fixed address."
* address ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address ^extension[=].extension[+].url = "code"
* address ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* address ^extension[=].extension[+].url = "actor"
* address ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* address ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* address ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* address ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address ^extension[=].extension[+].url = "code"
* address ^extension[=].extension[=].valueCode = #SHOULD:handle
* address ^extension[=].extension[+].url = "actor"
* address ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* address ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address ^extension[=].extension[+].url = "code"
* address ^extension[=].extension[=].valueCode = #SHOULD:handle
* address ^extension[=].extension[+].url = "actor"
* address ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* address ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* address ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"

* position 0..1 MS
* position ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* position ^extension[=].extension[+].url = "code"
* position ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* position ^extension[=].extension[+].url = "actor"
* position ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* position ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* position ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* position ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* position ^extension[=].extension[+].url = "code"
* position ^extension[=].extension[=].valueCode = #SHOULD:handle
* position ^extension[=].extension[+].url = "actor"
* position ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* position ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* position ^extension[=].extension[+].url = "code"
* position ^extension[=].extension[=].valueCode = #SHOULD:handle
* position ^extension[=].extension[+].url = "actor"
* position ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* position ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* position ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"

* managingOrganization 1..1 MS
* managingOrganization only Reference(HCPD_Organization)
* managingOrganization ^short = "Reference to managing organisation with HPI-O."
* managingOrganization ^definition = "A reference to the organisation that holds a HPI-O and manages or is responsible for this location entry in the Provider Directory."
* managingOrganization ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* managingOrganization ^extension[=].extension[+].url = "code"
* managingOrganization ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* managingOrganization ^extension[=].extension[+].url = "actor"
* managingOrganization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* managingOrganization ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* managingOrganization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* managingOrganization ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* managingOrganization ^extension[=].extension[+].url = "code"
* managingOrganization ^extension[=].extension[=].valueCode = #SHOULD:handle
* managingOrganization ^extension[=].extension[+].url = "actor"
* managingOrganization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* managingOrganization ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* managingOrganization ^extension[=].extension[+].url = "code"
* managingOrganization ^extension[=].extension[=].valueCode = #SHOULD:handle
* managingOrganization ^extension[=].extension[+].url = "actor"
* managingOrganization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* managingOrganization ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* managingOrganization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"

* partOf MS
* partOf only Reference(HCPD_Location)
* partOf ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* partOf ^extension[=].extension[+].url = "code"
* partOf ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* partOf ^extension[=].extension[+].url = "actor"
* partOf ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* partOf ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* partOf ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* partOf ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* partOf ^extension[=].extension[+].url = "code"
* partOf ^extension[=].extension[=].valueCode = #SHOULD:handle
* partOf ^extension[=].extension[+].url = "actor"
* partOf ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* partOf ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* partOf ^extension[=].extension[+].url = "code"
* partOf ^extension[=].extension[=].valueCode = #SHOULD:handle
* partOf ^extension[=].extension[+].url = "actor"
* partOf ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* partOf ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* partOf ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"


* endpoint 0..* MS
* endpoint only Reference(HCPD_Endpoint)
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

* extension contains http://digitalhealth.gov.au/fhir/cc/StructureDefinition/amenity named amenity 0..* MS
* extension[amenity] ^short = "Amenities or facilities available at or near the location."
* extension[amenity] ^definition = "Facilities or amenities available within, or in close proximity of, a location. Uses the NCTS Facility Amenity ValueSet (https://healthterminologies.gov.au/fhir/ValueSet/facility-amenity-1)."
* extension[amenity] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[amenity] ^extension[=].extension[+].url = "code"
* extension[amenity] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[amenity] ^extension[=].extension[+].url = "actor"
* extension[amenity] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[amenity] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[amenity] ^extension[=].extension[+].url = "code"
* extension[amenity] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[amenity] ^extension[=].extension[+].url = "actor"
* extension[amenity] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension[amenity] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[amenity] ^extension[=].extension[+].url = "code"
* extension[amenity] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[amenity] ^extension[=].extension[+].url = "actor"
* extension[amenity] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* extension contains http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-alternate-postal-address named hcpd-alternate-postal-address 0..* MS
* extension[hcpd-alternate-postal-address] ^short = "Alternate postal address"
* extension[hcpd-alternate-postal-address] ^definition = "Alternate postal/mailing address for correspondence (PO Box or mailing address) that is distinct from the registered physical address."
* extension[hcpd-alternate-postal-address] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[+].url = "code"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[hcpd-alternate-postal-address] ^extension[=].extension[+].url = "actor"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[hcpd-alternate-postal-address] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[+].url = "code"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[hcpd-alternate-postal-address] ^extension[=].extension[+].url = "actor"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension[hcpd-alternate-postal-address] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[+].url = "code"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[hcpd-alternate-postal-address] ^extension[=].extension[+].url = "actor"
* extension[hcpd-alternate-postal-address] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* extension contains Deactivated named deactivated 0..1 MS
* extension[deactivated].extension[deactivatedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated (exactly)
* extension[deactivated].extension[deactivatedBy].valueCodeableConcept.coding 1..1 MS
* extension[deactivated] ^short = "Indicates if Location service is deactivated"
* extension[deactivated] ^definition = "When present, this extension marks the Location as deactivated, and deactivation automatically cascades to all child resources."
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

Invariant: inv-01-address-requirement
Description: "Physical locations (not virtual or mobile) must have an address present."
* severity = #warning
* expression = "physicalType.exists() implies address.exists()"

Invariant: inv-02-type-mobl-requires-modifier
Description: "If a location is marked as mobile (code 'MOBL') it is recommended that a modifier coding is provided to describe the mobile type"
* severity = #warning
* expression = "type.coding.where(code = 'MOBL').exists() implies type.coding.where(code = 'COMM' or code = 'AMB' or code = 'PTRES' or code = 'SCHOOL' or code = 'WORK').exists()"

Invariant: inv-03-type-vi-should-not-have-modifier
Description: "If a location is marked as virtual (code 'VI') no additional modifier codings are needed"
* severity = #warning
* expression = "type.coding.where(code = 'VI').exists() implies type.coding.count() = 1"

Invariant: inv-04-type-or-physicaltype-present
Description: "A Location MUST have either a `type` or a `physicalType` value present"
* severity = #error
* expression = "type.exists() or physicalType.exists()"

Invariant: inv-05-status-values
Description: "Location.status must be 'active' or 'inactive'. The 'suspended' status is not used in HCPD."
* severity = #error
* expression = "status = 'active' or status = 'inactive'"