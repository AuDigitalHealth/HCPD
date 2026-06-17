Profile: HCPD_Provenance
Parent: Provenance
Id: hcpd-provenance
Title: "HCPD Provenance"
Description: "This profile of Provenance is used to track activities related to provider directory data, recording when specific data elements of a HCPD Organization or HCPD Practitioner resource have been retrieved, updated or verified."
* ^experimental = false
* ^status = #active
* ^publisher = "Australian Digital Health Agency"
* ^contact.name = "Australian Digital Health Agency"
* ^contact.telecom[+].system = #url
* ^contact.telecom[=].value = "https://www.digitalhealth.gov.au"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "help@digitalhealth.gov.au"
* ^useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#jurisdiction
* ^useContext.valueCodeableConcept = urn:iso:std:iso:3166#AU "Australia"
* ^copyright = "Copyright © 2026 Australian Digital Health Agency - All rights reserved. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."
* . ^short = "Tracks activities related to provider directory data changes"
* . ^definition = "Tracks activities related to provider directory data, recording when specific data elements of a HCPD Organization or HCPD Practitioner resource have been retrieved, updated or verified."
* target ..1 MS
* target only Reference(HCPD_Organization or HCPD_Practitioner or HCPD_PractitionerRole or HCPD_Endpoint or HCPD_HealthcareService or HCPD_Location)

* target.extension ^slicing.discriminator.type = #value
* target.extension ^slicing.discriminator.path = "url"
* target.extension ^slicing.rules = #open
* target.extension contains http://hl7.org/fhir/StructureDefinition/targetPath named targetPath 0..* MS
* target.extension[targetPath] ^short = "FHIRPath of element(s) in the target resource affected by this provenance activity"
* target.extension[targetPath] ^definition = "Specifies one or more FHIRPath expressions pointing to the exact data element(s) within the referenced target resource that were sourced / updated / verified in this provenance event."
* target.extension[targetPath].value[x] only string
* target.extension[targetPath].valueString ^example.label = "Example"
* target.extension[targetPath].valueString ^example.valueString = "telecom.where(system='phone').value"

* activity MS
* activity from http://hl7.org/fhir/ValueSet/provenance-activity-type (extensible)
* activity ^short = "Type of provenance activity (e.g. create, update, verify)"
* activity ^definition = "Categorises the provenance event. Required and bound to the Provenance Activity Type value set."

* recorded MS

* agent.who only Reference(HCPD_Organization or HCPD_Practitioner or HCPD_PractitionerRole)
* agent.who MS

* entity MS
* entity.role MS
* entity.role = http://hl7.org/fhir/provenance-entity-role#source

