Instance: practitionerrole-code-display
InstanceOf: SearchParameter
Usage: #definition
Title: "Practitioner Role Type Display Search Parameter"
Description: "Search PractitionerRoles by the display name of the practitioner role code."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitionerrole-code-display"
* name = "SearchParameterPractitionerRoleCodeDisplay"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #code-display
* base[0] = #PractitionerRole
* type = #string
* expression = "PractitionerRole.code.coding.display"
