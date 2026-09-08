CodeSystem: ResponsiblePartyType_CS
Id: responsible-party-type
Title: "Responsible Party Type"
Description: "CodeSystem containing codes that indicate the resource type of the party that is responsible for the current value of a data element."
* ^url = "http://digitalhealth.gov.au/fhir/cc/CodeSystem/responsible-party-type"
* ^status = #active
* ^experimental = false
* ^date = "2026-09-10"
* ^purpose = "Indicates the resource type of the party responsible for the current value of a data element. This is used by Health Connect Provider Directory to identify who set the value of certain data elements."
* ^caseSensitive = true
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete
* ^version = "1.0.0"
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4"

* #practitioner-initiated "Practitioner initiated" "Suppression action initiated by the practitioner."
* #organisation-initiated "Organisation initiated" "Suppression action initiated by the organisation or its administrator."
