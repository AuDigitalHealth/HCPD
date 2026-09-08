Extension: Alternate_Name
Id: alternate-name
Title: "Alternate Name"
Description: "This extension applies to PractitionerRole, and represents a name by which a practitioner chooses to be known in the context of the delivery of a specific healthcare service."
Context: PractitionerRole
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/alternate-name"
* . ^short = "Alternate name for practitioner in role context"
* . ^definition = "A name by which a practitioner chooses to be known in the context of the delivery of a specific healthcare service. This may differ from their registered legal name."

* value[x] 1..1
* value[x] only HumanName
* valueHumanName ^short = "Alternate name"
* valueHumanName ^definition = "The alternate name by which the practitioner wishes to be known in this role context."
* valueHumanName.use MS
* valueHumanName.family MS
* valueHumanName.given MS