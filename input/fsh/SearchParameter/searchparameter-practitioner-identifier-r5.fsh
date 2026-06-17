Instance: practitioner-identifier-r5
InstanceOf: SearchParameter
Usage: #definition
Title: "Practitioner identifier (R5 mimic)"
Description: "Enables R5-style identifier searching across both Practitioner.identifier and Practitioner.qualification.identifier paths. This allows searching for practitioners by any identifier type including HPI-I, Ahpra and other peak body registration numbers. Works with `system|value` OR `system` OR `value`."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-identifier-r5"
* name = "SearchParameterPractitionerIdentifierR5"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #identifier-r5
* base = #Practitioner
* type = #token
* expression = "Practitioner.identifier | Practitioner.qualification.identifier"
* target = #Practitioner
* modifier[0] = #contains
* modifier[1] = #exact