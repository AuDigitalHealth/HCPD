Extension: Deactivated
Id: deactivated
Title: "Deactivated"
Context: Organization, Practitioner, PractitionerRole, HealthcareService, Location, Endpoint
Description: "Identifies the party responsible for setting the parent resource to an inactive or suspended state. This extension is expected to be present whenever the resource's active or status element indicates it is no longer active, and provides audit metadata about the actor who initiated the change."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/deactivated"
* ^status = #active
* ^experimental = false
* ^purpose = "Captures who initiated a status or active-flag change on a Health Connect Provider Directory resource, enabling audit traceability and supporting cascade deactivation management across the provider directory hierarchy."
* . ^short = "Who initiated deactivation"
* . ^definition = "When present on a resource, identifies the party responsible for setting the resource to inactive or suspended state. Uses the same coded values as the Suppressed extension to indicate whether a practitioner or an organisation administrator initiated the change."
* . 0..1
* extension contains
    deactivatedBy 1..1 MS
* extension[deactivatedBy] ^short = "Who initiated the deactivation"
* extension[deactivatedBy] ^definition = "Identifies the actor who initiated the deactivation request (e.g., practitioner, organisation)."
* extension[deactivatedBy].value[x] only CodeableConcept
* extension[deactivatedBy].valueCodeableConcept 1..1 MS
* extension[deactivatedBy].valueCodeableConcept.coding 1..2
* extension[deactivatedBy].valueCodeableConcept.coding from $HCPD_ResponsiblePartyType_VS (required)
