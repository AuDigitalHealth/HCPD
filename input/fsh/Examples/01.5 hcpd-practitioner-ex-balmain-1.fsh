Instance: example-balmain-practitioner-1
InstanceOf: HCPD_Practitioner
Usage: #example
Title: "HCPD Practitioner Example: Alice Anderson (Balmain)"
Description: "Practitioner serving Balmain examples."

* meta.lastUpdated = "2026-09-10T00:00:00Z"
* extension[recordedSexOrGender].extension[value].valueCodeableConcept = $administrative-gender#female "Female"
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#practitioner-initiated
* identifier[hpii].value = "8003619900015717"
* identifier[hpii].extension[hcpd-hpii-status].valueCoding = $hcpd-hi-status-cs#A "Active"
* qualification.identifier[ahpraregistrationnumber].system = "http://hl7.org.au/id/ahpra-registration-number"
* qualification.identifier[ahpraregistrationnumber].value = "MED0001111111"
* qualification.code.text = "Medical Practitioner"
* qualification.issuer.display = "Ahpra"

* name[officialName].use = #official
* name[officialName].family = "Anderson"
* name[officialName].given = "Alice"
* name[alternate-name].use = #usual
* name[alternate-name].family = "Anderson"
* name[alternate-name].given = "Alice"
