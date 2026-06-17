Instance: practitioner-rsg
InstanceOf: SearchParameter
Usage: #definition
Title: "Practitioner's Recorded Sex or Gender Search Parameter"
Description: "Search a Practitioner record by their recorded sex or gender. This search parameter operates on the 'value' element of the individual-recordedSexOrGender extension (typically an administrative gender code). However, to fully understand the meaning and context of the recorded sex or gender, the complete extension structure returned in results should be examined, including metadata elements such as 'type' (category of what's recorded), 'source', 'sourceDocument', 'effectivePeriod', and other contextual information."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/practitioner-rsg"
* name = "SearchParameterPractitionerRSG"
* status = #active
* experimental = false
* publisher = "Australian Digital Health Agency"
* contact.telecom.system = #email
* contact.telecom.value = "help@digitalhealth.gov.au"
* code = #rsg
* base = #Practitioner
* type = #token
* expression = "Practitioner.extension.where(url = 'http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender').extension.where(url = 'value').value.ofType(CodeableConcept).coding"
* target = #Practitioner