// Shared All Day SearchParameter for both HealthcareService and PractitionerRole
// This parameter works on the common availableTime backbone element structure

Instance: allday
InstanceOf: SearchParameter
Usage: #definition
Title: "All Day Search Parameter"
Description: "Search HealthcareServices or PractitionerRoles by whether they are available all day."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/allday"
* name = "SearchParameterAllDay"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #allday
* base[0] = #HealthcareService
* base[1] = #PractitionerRole
* type = #token
* expression = "HealthcareService.availableTime.allDay | PractitionerRole.availableTime.allDay"
* target = #HealthcareService
* target = #PractitionerRole
