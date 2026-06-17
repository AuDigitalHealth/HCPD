Instance: location-physicaltype
InstanceOf: SearchParameter
Usage: #definition
Title: "Location Physical Type Search Parameter"
Description: "Search for Location resources by physicalType field."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/location-physicaltype"
* name = "SearchParameterLocationPhysicalType"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #locationphysicaltype
* base = #Location
* type = #token
* expression = "Location.physicalType"
* target = #Location