Instance: practitioner-regprof
InstanceOf: SearchParameter
Usage: #definition
Title: "Practitioner's Registered Profession Search Parameter"
Description: "Search a Practitioner record by their registered profession using string values."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-regprof"
* name = "SearchParameterPractitionerRegProf"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* contact.telecom.system = #email
* contact.telecom.value = "help@digitalhealth.gov.au"
* code = #regprof
* base = #Practitioner
* type = #string
* modifier[0] = #contains
* modifier[1] = #exact
* expression = "Practitioner.qualification.code.text"
* target = #Practitioner