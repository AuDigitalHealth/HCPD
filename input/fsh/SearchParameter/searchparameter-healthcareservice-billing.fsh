Instance: healthcareservice-billing
InstanceOf: SearchParameter
Usage: #definition
Title: "HealthcareService Billing Search Parameter"
Description: "Search for HealthcareService resources by billing information."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/healthcareservice-billing"
* name = "SearchParameterHealthcareServiceBilling"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #hsbilling
* base = #HealthcareService
* type = #token
* expression = "HealthcareService.serviceProvisionCode"
* target = #HealthcareService