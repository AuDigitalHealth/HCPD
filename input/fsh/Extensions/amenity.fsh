Extension: Amenity
Id: amenity
Title: "Amenity"
Description: "Physical features or amenities available within, or in close proximity of, a location. Uses the NCTS Facility Amenity ValueSet."
* ^context.type = #element
* ^context.expression = "Location"
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/amenity"
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
* value[x] only CodeableConcept
* valueCodeableConcept from https://healthterminologies.gov.au/fhir/ValueSet/facility-amenity-1 (required)
* valueCodeableConcept ^short = "Amenities or facilities available at or near the location."
* valueCodeableConcept ^definition = "Physical features or amenities available within, or in close proximity of, a location."