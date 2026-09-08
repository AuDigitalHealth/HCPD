Extension: HI_Service_Organisation_Classification
Id: hi-org-classification
Title: "HI Service Organisation Classification"
Description: "Extension to record whether an organisation's HPIO is a 'seed' or 'network' type in the HI service."
Context: Organization.identifier
* ^status = #active
* ^purpose = "This extension addresses the business need to classify organizations in the Health Connect Provider Directory as either seed or network entities, supporting proper organizational hierarchy representation and directory management workflows."
* ^experimental = false
* . ^short = "Indicates whether an organisation is a seed or network"
* . ^definition = "This extension applies to Organization, and indicates whether an organisation is a seed or network in the HI service."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hi-org-classification"
* ^status = #active

* value[x] only CodeableConcept
* valueCodeableConcept from HI_Org_Classification_VS (required)
* valueCodeableConcept ^short = "Indicates whether an organisation is a seed or network"
* valueCodeableConcept ^definition = "This extension applies to Organization, and indicates whether an organisation is a seed or network in the HI service."