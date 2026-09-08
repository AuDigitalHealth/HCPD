Invariant: inv-01-address-postalcode-4-digits
Description: "If present, postalCode shall be 4 digits"
Expression: "address.postalCode.empty() or address.postalCode.matches('^[0-9]{4}$')"
Severity: #error

Profile: HCPD_Service_Coverage_Area
Parent: AUCoreLocation
Id: hcpd-service-coverage-area
Title: "HCPD Service Coverage Area"
Description: "This profile of Location represents an Australian geographic coverage area i.e. postcodes where this service is provided.
For a healthcare service, that is provided through a physical location but have eligibility restrictions applicable in terms of only residents for certain postcodes/suburbs can receive this service, then the details of coverage area and eligibility should be provided here."
* ^experimental = false
* ^status = #active
* . ^short = "Australian geographic area in which a service is available."

* obeys inv-01-address-postalcode-4-digits

* extension contains Suppressed named suppressed 0..1 MS and Deactivated named deactivated 0..1 MS
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

* extension[deactivated].extension[deactivatedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated (exactly)
* extension[deactivated].extension[deactivatedBy].valueCodeableConcept.coding 1..1 MS
* extension[deactivated] ^short = "Indicates if service coverage area is suppressed"
* extension[deactivated] ^definition = "Indicates if service coverage area is suppressed."
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

* address 1..1 MS
* address ^short = "The address that defines the coverage area where the service is available"
* address ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address ^extension[=].extension[+].url = "code"
* address ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* address ^extension[=].extension[+].url = "actor"
* address ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
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

* address.city MS
* address.city ^short = "Australian city, town or suburb"
* address.city ^definition = "An Australian city, town or suburb where the service is available."
* address.city ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.city ^extension[=].extension[+].url = "code"
* address.city ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* address.city ^extension[=].extension[+].url = "actor"
* address.city ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* address.city ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.city ^extension[=].extension[+].url = "code"
* address.city ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.city ^extension[=].extension[+].url = "actor"
* address.city ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* address.city ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.city ^extension[=].extension[+].url = "code"
* address.city ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.city ^extension[=].extension[+].url = "actor"
* address.city ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* address.state MS
* address.state ^short = "Australian state or territory"
* address.state ^definition = "An Australian state or territory where the service is available."
* address.state from $australian-states-territories-2 (required)
* address.state ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.state ^extension[=].extension[+].url = "code"
* address.state ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* address.state ^extension[=].extension[+].url = "actor"
* address.state ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* address.state ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.state ^extension[=].extension[+].url = "code"
* address.state ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.state ^extension[=].extension[+].url = "actor"
* address.state ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* address.state ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.state ^extension[=].extension[+].url = "code"
* address.state ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.state ^extension[=].extension[+].url = "actor"
* address.state ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* address.postalCode MS
* address.postalCode ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.postalCode ^extension[=].extension[+].url = "code"
* address.postalCode ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* address.postalCode ^extension[=].extension[+].url = "actor"
* address.postalCode ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* address.postalCode ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.postalCode ^extension[=].extension[+].url = "code"
* address.postalCode ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.postalCode ^extension[=].extension[+].url = "actor"
* address.postalCode ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* address.postalCode ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.postalCode ^extension[=].extension[+].url = "code"
* address.postalCode ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.postalCode ^extension[=].extension[+].url = "actor"
* address.postalCode ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* address.country 1..1 MS
* address.country = "AU"
* address.country ^short = "Australia as a 2 digit ISO 3166 code"
* address.country ^definition = "The 2 digit ISO 3166 code for Australia (AU)."
* address.country ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.country ^extension[=].extension[+].url = "code"
* address.country ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* address.country ^extension[=].extension[+].url = "actor"
* address.country ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* address.country ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.country ^extension[=].extension[+].url = "code"
* address.country ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.country ^extension[=].extension[+].url = "actor"
* address.country ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* address.country ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* address.country ^extension[=].extension[+].url = "code"
* address.country ^extension[=].extension[=].valueCode = #SHOULD:handle
* address.country ^extension[=].extension[+].url = "actor"
* address.country ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* managingOrganization MS
* managingOrganization only Reference(HCPD_Organization)
* managingOrganization ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* managingOrganization ^extension[=].extension[+].url = "code"
* managingOrganization ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* managingOrganization ^extension[=].extension[+].url = "actor"
* managingOrganization ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
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
