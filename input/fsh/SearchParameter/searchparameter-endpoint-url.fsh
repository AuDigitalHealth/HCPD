Instance: endpoint-url
InstanceOf: SearchParameter
Usage: #definition
Title: "Endpoint URL Search Parameter"
Description: "Search for Endpoint resources by address (URL)."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-url"
* name = "SearchParameterEndpointUrl"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #epurl
* base = #Endpoint
* type = #uri
* expression = "Endpoint.address"
* target = #Endpoint