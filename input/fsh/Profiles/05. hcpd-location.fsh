Profile: HCPD_Location
Parent: AUCoreLocation
Id: hcpd-location
Title: "HCPD Location"
Description: "This profile defines a Health Connect Provider Directory entry for a healthcare location where services are provided."
* ^experimental = false
* ^status = #active
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^purpose = "This profile addresses the business need to standardise location information in the Health Connect Provider Directory, enabling consistent representation of physical, mobile, and virtual healthcare service delivery sites for directory search and service location purposes."
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* obeys inv-01-address-requirement and inv-02-type-mobl-requires-modifier and inv-03-type-vi-should-not-have-modifier and inv-04-type-or-physicaltype-present
* . ^short = "Australian Location Directory Entry"
* meta ^short = "Metadata on Location"

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system: must include at least one HCPD Location Identifier known to this profile"
* identifier ^slicing.ordered = false
* identifier 1..* MS
* identifier contains HCPD_Local_Identifier 1..1 MS

* identifier[HCPD_Local_Identifier] only HCPD_Local_Identifier
* identifier[HCPD_Local_Identifier] ^short = "Local Identifier for the location attributed by HC"
* identifier[HCPD_Local_Identifier] ^definition = "Local Identifier for the Location attributed by Health Connect. Used for system reference and internal business logic."
* identifier[HCPD_Local_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"
* identifier[HCPD_Local_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* identifier[HCPD_Local_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"

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
* managingOrganization ^extension[=].extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/snapshot-source"
* managingOrganization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-location"

* partOf only Reference(HCPD_Location)

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
