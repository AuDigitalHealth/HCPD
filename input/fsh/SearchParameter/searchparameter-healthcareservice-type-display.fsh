Instance: healthcareservice-type-display
InstanceOf: SearchParameter
Usage: #definition
Title: "Healthcare Service Type Display Search Parameter"
Description: "Search HealthcareServices by the display name of the healthcare service type."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/healthcareservice-type-display"
* name = "SearchParameterHealthcareServiceTypeDisplay"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #type-display
* base[0] = #HealthcareService
* type = #string
* expression = "HealthcareService.type.coding.display"
