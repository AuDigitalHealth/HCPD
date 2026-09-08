Instance: external-hcpd-practitioner-record
InstanceOf: HCPD_Practitioner
Usage: #example
Title: "HCPD Practitioner Example: External Record (PRN)"
Description: "An external practitioner record example (PRN identifier) conforming to the HCPD Practitioner profile."

* extension[recordedSexOrGender].extension[value].valueCodeableConcept = $administrative-gender#male "Male"
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#practitioner-initiated

* identifier[hpii].value = "8003616566719020"
* identifier[hpii].extension[hcpd-hpii-status].valueCoding = $hcpd-hi-status-cs#A "Active"
* active = false
* name[officialName].use = #official
* name[officialName].family = "Fryer"
* name[officialName].given = "John"
* name[officialName].prefix = "Dr"
* name[alternate-name].use = #usual
* name[alternate-name].family = "Fryer"
* name[alternate-name].given = "John"

// Phone number that was updated in HC from this PCA record
* telecom[+].system = #phone
* telecom[=].value = "+61 2 8555 0199" // This is the phone number sourced from PCA
* telecom[=].use = #work

* telecom[personalPhoneNumber].system = #phone
* telecom[personalPhoneNumber].value = "+61 2 7777 0199" 
* telecom[personalPhoneNumber].use = #home

* qualification[+].identifier[peakbodyregistrationnumber].type = $v2-0203-int#PRN
* qualification[=].identifier[peakbodyregistrationnumber].system = "http://example.org/fhir/identifier/acha-prn"
* qualification[=].identifier[peakbodyregistrationnumber].value = "PRN-123456"
* qualification[=].identifier[peakbodyregistrationnumber].use = #official
* qualification[=].code.text = "Clinical Hypnotherapist"
* qualification[=].issuer.display = "Australian Clinical Hypnotherapy Association"

* qualification[+].identifier[peakbodyregistrationnumber].type = $v2-0203-int#PRN
* qualification[=].identifier[peakbodyregistrationnumber].system = "http://example.org/fhir/identifier/rcpa-prn"
* qualification[=].identifier[peakbodyregistrationnumber].value = "PRN-2468"
* qualification[=].identifier[peakbodyregistrationnumber].use = #official
* qualification[=].code.text = "Pathologist"
* qualification[=].issuer.display = "RCPA"

// Communication

// Communication
* communication = urn:ietf:bcp:47#it "Italian"