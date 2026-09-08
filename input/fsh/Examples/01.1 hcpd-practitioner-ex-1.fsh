Instance: example-healthconnect-practitioner-1
InstanceOf: HCPD_Practitioner
Usage: #example
Title: "HCPD Practitioner Example: Alex Smith"
Description: "An example Practitioner (Alex Smith) conforming to the HCPD Practitioner profile."

* meta.lastUpdated = "2025-08-25T14:30:00+10:00"

* extension[recordedSexOrGender].extension[value].valueCodeableConcept = $administrative-gender#female "Female"
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#practitioner-initiated

* identifier[hpii].value = "8003619900015717"
* identifier[hpii].extension[hcpd-hpii-status].valueCoding = $hcpd-hi-status-cs#A "Active"

* qualification.identifier[ahpraregistrationnumber].system = "http://hl7.org.au/id/ahpra-registration-number"
* qualification.identifier[ahpraregistrationnumber].value = "MED0000932945"
* qualification.code.text = "Medical Practitioner"
* qualification.issuer.display = "Ahpra"

* name[officialName].use = #official
* name[officialName].family = "Smith"
* name[officialName].given = "Alex"
* name[officialName].prefix = "Dr"
* name[alternate-name].use = #usual
* name[alternate-name].family = "Smith"
* name[alternate-name].given = "Alex"

* telecom[personalPhoneNumber].system = #phone
* telecom[personalPhoneNumber].use = #home
* telecom[personalPhoneNumber].value = "+61412345678"

* telecom[personalEmailAddress].system = #email
* telecom[personalEmailAddress].use = #home
* telecom[personalEmailAddress].value = "alex.smith@example.com"