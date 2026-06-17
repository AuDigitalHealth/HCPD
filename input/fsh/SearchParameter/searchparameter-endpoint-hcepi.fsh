Instance: endpoint-hcepi
InstanceOf: SearchParameter
Usage: #definition
Title: "HC Local Endpoint Identifier Search Parameter"
Description: "Search an Endpoint record by its HC Local Identifier."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-hcepi"
* name = "SearchParameterEndpointIdentifierHC"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* contact.telecom.system = #email
* contact.telecom.value = "help@digitalhealth.gov.au"
* code = #hcepi
* base = #Endpoint
* type = #token
* description = "Search an Endpoint record by its HC Local Identifier (Resource Identifier type). Uses token matching for exact value matching. Value-only search supported."
* expression = "Endpoint.identifier.where(type.coding.exists(code='XX')).value"
* target = #Endpoint