CodeSystem: HI_Org_Classification_CS
Id: hi-org-classification-cs
Title: "HI Service Organisation Classification CodeSystem"
Description: "Internal code system that describes whether an organisation is a 'seed' or 'network' type in the HI Service."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/hi-org-classification-cs"
* ^status = #active
* ^experimental = false
* ^date = "2026-09-10"
* ^purpose = "This CodeSystem supports the classification of organisations within provider directory systems, enabling the distinction between 'seed' organisations (primary entities in the HI Service) and 'network' organisations (subsidiary or related entities)."
* ^caseSensitive = true
* ^compositional = false
* ^versionNeeded = true
* ^content = #complete
* ^version = "1.0.0"
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4"
* #seed "Seed" "The organisation is a 'seed' in the HI Service"
* #network "Network" "The organisation is a 'network' in the HI Service"
