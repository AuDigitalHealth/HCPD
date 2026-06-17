Instance: endpoint-payloadmimetype
InstanceOf: SearchParameter
Usage: #definition
Title: "Endpoint Payload Mime Type Search Parameter"
Description: "Search for Endpoint resources by payloadMimeType."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endpoint-payloadmimetype"
* name = "SearchParameterEndpointPayloadMimeType"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #payloadmimetype
* base = #Endpoint
* type = #token
* expression = "Endpoint.payloadMimeType"
* target = #Endpoint