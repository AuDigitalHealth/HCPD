Instance: suppressed
InstanceOf: SearchParameter
Usage: #definition
Title: "Suppressed Search Parameter"
Description: "Search resources by suppression state using the Suppressed extension."
* url = "http://digitalhealth.gov.au/fhir/cc/SearchParameter/suppressed"
* name = "SearchParameterSuppressed"
* status = #active
* experimental = false
* code = #suppressed
* base[0] = #Practitioner
* base[1] = #PractitionerRole
* base[2] = #HealthcareService
* base[3] = #Location
* base[4] = #Endpoint
* base[5] = #Organization
* type = #token
* expression = "extension('http://digitalhealth.gov.au/fhir/cc/StructureDefinition/suppressed').extension.where(url='suppressedBy').value.ofType(CodeableConcept).coding.exists() and (($this is Organization).not() or extension('http://digitalhealth.gov.au/fhir/cc/StructureDefinition/suppressed').extension.where(url='includeSelf').value.ofType(boolean).where($this = false).exists().not())"
* target[0] = #Practitioner
* target[1] = #PractitionerRole
* target[2] = #HealthcareService
* target[3] = #Location
* target[4] = #Endpoint
* target[5] = #Organization