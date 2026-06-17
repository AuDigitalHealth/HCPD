Extension: Alternate_Name
Id: alternate-name
Title: "Alternate Name"
Description: "This extension applies to PractitionerRole, and represents a name by which a practitioner chooses to be known in the context of the delivery of a specific healthcare service."
Context: PractitionerRole
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/alternate-name"
* . ^short = "Alternate name for practitioner in role context"
* . ^definition = "A name by which a practitioner chooses to be known in the context of the delivery of a specific healthcare service. This may differ from their registered legal name."
* value[x] 1..1
* value[x] only HumanName
* valueHumanName ^short = "Alternate name"
* valueHumanName ^definition = "The alternate name by which the practitioner wishes to be known in this role context."
* valueHumanName.use MS
* valueHumanName.use ^short = "Alternate name use"
* valueHumanName.use ^definition = "The use of this alternate name (usual, temp, etc.)"
* valueHumanName.family MS
* valueHumanName.family ^short = "Alternate family name"
* valueHumanName.given MS
* valueHumanName.given ^short = "Alternate given name(s)"
* valueHumanName.prefix MS
* valueHumanName.prefix ^short = "Alternate name prefix (title)"