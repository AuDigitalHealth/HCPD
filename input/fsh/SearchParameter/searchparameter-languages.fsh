// Shared Languages SearchParameter for both HealthcareService and PractitionerRole
// This parameter works on communication elements across both resource types

Instance: languages
InstanceOf: SearchParameter
Usage: #definition
Title: "Languages Search Parameter"
Description: "Search HealthcareServices or PractitionerRoles by supported languages/communication methods. Shared across HealthcareService and PractitionerRole. Supports token based searching, i.e. `system|code` or just `code`"
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/languages"
* name = "SearchParameterLanguages"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* contact.telecom.system = #email
* contact.telecom.value = "help@digitalhealth.gov.au"
* code = #languages
* base[0] = #HealthcareService
* base[1] = #PractitionerRole
* type = #token
* expression = "HealthcareService.communication.coding | PractitionerRole.extension.where(url='http://digitalhealth.gov.au/fhir/cc/StructureDefinition/practitioner-role-communication').value.ofType(CodeableConcept).coding"
* target = #HealthcareService
* target = #PractitionerRole