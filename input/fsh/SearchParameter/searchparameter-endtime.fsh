// Shared End Time SearchParameter for both HealthcareService and PractitionerRole
// This parameter works on the common availableTime backbone element structure

Instance: endtime
InstanceOf: SearchParameter
Usage: #definition
Title: "End Time Search Parameter"
Description: "Search HealthcareServices or PractitionerRoles by end time. Query values must use a four-digit numeric 24 hr time format (HHMM, e.g., 0830 for 8:30am). The end time is converted to an integer to enable prefix-based time searches (e.g., gt, lt, ge, le)."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/endtime"
* name = "SearchParameterEndTime"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* code = #endtime
* base[0] = #HealthcareService
* base[1] = #PractitionerRole
* type = #number
* expression = "availableTime.select($this.availableEndTime.toString().replace(':','').substring(0,4).toInteger())"
