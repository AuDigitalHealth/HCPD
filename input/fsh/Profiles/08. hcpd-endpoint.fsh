Profile: HCPD_Endpoint
Parent: Endpoint
Id: hcpd-endpoint
Title: "HCPD Endpoint"
Description: "This profile defines a Health Connect Provider Directory entry for a technical endpoint."
* ^experimental = false
* ^status = #active
* obeys inv-01-status-values
 
* . ^short = "Health Connect Endpoint"
* . ^definition = "Endpoint defined for use in Health Connect."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $au-receivingfacility named receiving-facility 0..1 and
    $au-receivingapplication named receiving-application 0..1 and
    $encryption-certificate-pem-x509 named encryption-certificate-pem-x509 0..*
* extension[receiving-facility] MS
* extension[receiving-facility] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[receiving-facility] ^extension[=].extension[+].url = "code"
* extension[receiving-facility] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[receiving-facility] ^extension[=].extension[+].url = "actor"
* extension[receiving-facility] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[receiving-facility] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[receiving-facility] ^extension[=].extension[+].url = "code"
* extension[receiving-facility] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[receiving-facility] ^extension[=].extension[+].url = "actor"
* extension[receiving-facility] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension[receiving-facility] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[receiving-facility] ^extension[=].extension[+].url = "code"
* extension[receiving-facility] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[receiving-facility] ^extension[=].extension[+].url = "actor"
* extension[receiving-facility] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* extension[receiving-application] MS
* extension[receiving-application] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[receiving-application] ^extension[=].extension[+].url = "code"
* extension[receiving-application] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[receiving-application] ^extension[=].extension[+].url = "actor"
* extension[receiving-application] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[receiving-application] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[receiving-application] ^extension[=].extension[+].url = "code"
* extension[receiving-application] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[receiving-application] ^extension[=].extension[+].url = "actor"
* extension[receiving-application] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension[receiving-application] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[receiving-application] ^extension[=].extension[+].url = "code"
* extension[receiving-application] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[receiving-application] ^extension[=].extension[+].url = "actor"
* extension[receiving-application] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* extension[encryption-certificate-pem-x509] MS
* extension[encryption-certificate-pem-x509] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[+].url = "code"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[encryption-certificate-pem-x509] ^extension[=].extension[+].url = "actor"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[encryption-certificate-pem-x509] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[+].url = "code"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[encryption-certificate-pem-x509] ^extension[=].extension[+].url = "actor"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* extension[encryption-certificate-pem-x509] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[+].url = "code"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[encryption-certificate-pem-x509] ^extension[=].extension[+].url = "actor"
* extension[encryption-certificate-pem-x509] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* extension contains Suppressed named suppressed 0..1 MS and Deactivated named deactivated 0..1 MS
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated (exactly)
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding 1..1 MS
* extension[suppressed] ^short = "indicates whether the Endpoint should be hidden."
* extension[suppressed] ^definition = "A coded value, when present, indicates whether the Endpoint should be hidden from display in the Provider Directory."
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
* extension[deactivated] ^short = "Indicates if Endpoint service is deactivated"
* extension[deactivated] ^definition = "When present, this extension marks the Endpoint as deactivated, and deactivation automatically cascades to all child resources."
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

* status 1..1 MS
* status ^short = "Only endpoints with status ‘Active’ are exposed externally."
* status ^definition = "To ensure that only the endpoint with status ‘Active’ are discoverable and displayed on the directory, when searched. Others are retained for auditing and reporting purpose only"
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

* identifier 2..* MS
* identifier ^short = "Unique identifier of the endpoint record"
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
* identifier ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier ^extension[=].extension[+].url = "code"
* identifier ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier ^extension[=].extension[+].url = "actor"
* identifier ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"
* identifier ^slicing.discriminator[0].type = #pattern
* identifier ^slicing.discriminator[0].path = "type"
* identifier ^slicing.discriminator[1].type = #value
* identifier ^slicing.discriminator[1].path = "system"
* identifier ^slicing.rules = #open

* identifier contains HCPD_SMD_Target_Identifier 0..1 MS and HCPD_Source_Identifier 1..1 MS and HCPD_Local_Identifier 1..1 MS

* identifier[HCPD_Source_Identifier] only HCPD_Source_Identifier
* identifier[HCPD_Source_Identifier] MS
* identifier[HCPD_Source_Identifier] ^short = "HC Endpoint Identifier attributed from source system. Source for Endpoint: NHSD."
* identifier[HCPD_Source_Identifier] ^definition = "Unique identifier for the healthcare endpoint attributed from source system. Not exposed externally but can be used for system reference or internal business logic."
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

* identifier[HCPD_SMD_Target_Identifier] only HCPD_SMD_Target_Identifier
* identifier[HCPD_SMD_Target_Identifier] MS
* identifier[HCPD_SMD_Target_Identifier] ^short = "SMD Target Identifier"
* identifier[HCPD_SMD_Target_Identifier] ^definition = "Secure Messaging Delivery target identifier for this endpoint"
* identifier[HCPD_SMD_Target_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* identifier[HCPD_SMD_Target_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* identifier[HCPD_SMD_Target_Identifier] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[+].url = "code"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[=].valueCode = #SHOULD:handle
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[+].url = "actor"
* identifier[HCPD_SMD_Target_Identifier] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* identifier[HCPD_Local_Identifier] only HCPD_Local_Identifier
* identifier[HCPD_Local_Identifier] MS
* identifier[HCPD_Local_Identifier] ^short = "Identifier attributed by the HCPD system for the Endpoint"
* identifier[HCPD_Local_Identifier] ^definition = "Unique identifier for the healthcare endpoint attributed from source system. Not a displayable field but can be used for system reference or internal business logic."
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

* connectionType 1..1 MS
* connectionType ^short = "Service interface type"
* connectionType ^definition = "Protocol/Profile/Standard the endpoint supports."
* connectionType from http://hl7.org.au/fhir/pd/ValueSet/service-interfaces (extensible)
* connectionType ^short = "To specify the service interface types"
* connectionType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* connectionType ^extension[=].extension[+].url = "code"
* connectionType ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* connectionType ^extension[=].extension[+].url = "actor"
* connectionType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* connectionType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* connectionType ^extension[=].extension[+].url = "code"
* connectionType ^extension[=].extension[=].valueCode = #SHOULD:handle
* connectionType ^extension[=].extension[+].url = "actor"
* connectionType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* connectionType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* connectionType ^extension[=].extension[+].url = "code"
* connectionType ^extension[=].extension[=].valueCode = #SHOULD:handle
* connectionType ^extension[=].extension[+].url = "actor"
* connectionType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* name 0..1 MS
* name ^short = "To enable consistent and correct identification of the endpoint"
* name ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* name ^extension[=].extension[+].url = "code"
* name ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* name ^extension[=].extension[+].url = "actor"
* name ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
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

* payloadType 1..* MS
* payloadType ^short = "Endpoint payload type"
* payloadType ^definition = "REndpoint payload types that need to be transmitted over secure messaging, e.g. Discharge Summary, e-Referral, referral response message, acknowledgment etc."
* payloadType from http://hl7.org.au/fhir/pd/ValueSet/endpoint-payload-type (extensible)
* payloadType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* payloadType ^extension[=].extension[+].url = "code"
* payloadType ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* payloadType ^extension[=].extension[+].url = "actor"
* payloadType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* payloadType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* payloadType ^extension[=].extension[+].url = "code"
* payloadType ^extension[=].extension[=].valueCode = #SHOULD:handle
* payloadType ^extension[=].extension[+].url = "actor"
* payloadType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* payloadType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* payloadType ^extension[=].extension[+].url = "code"
* payloadType ^extension[=].extension[=].valueCode = #SHOULD:handle
* payloadType ^extension[=].extension[+].url = "actor"
* payloadType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* payloadMimeType 0..* MS
* payloadMimeType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* payloadMimeType ^extension[=].extension[+].url = "code"
* payloadMimeType ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* payloadMimeType ^extension[=].extension[+].url = "actor"
* payloadMimeType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* payloadMimeType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* payloadMimeType ^extension[=].extension[+].url = "code"
* payloadMimeType ^extension[=].extension[=].valueCode = #SHOULD:handle
* payloadMimeType ^extension[=].extension[+].url = "actor"
* payloadMimeType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"
* payloadMimeType ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* payloadMimeType ^extension[=].extension[+].url = "code"
* payloadMimeType ^extension[=].extension[=].valueCode = #SHOULD:handle
* payloadMimeType ^extension[=].extension[+].url = "actor"
* payloadMimeType ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/bulk-export-requester-actor-health-connect"

* address 1..1 MS
* address ^short = "URL address of the endpoint"
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

Invariant: inv-01-status-values
Description: "Endpoint.status must be 'active', 'suspended', or 'off'. The 'error' and 'test' statuses are not used in HCPD."
* severity = #error
* expression = "status = 'active' or status = 'suspended' or status = 'off'"