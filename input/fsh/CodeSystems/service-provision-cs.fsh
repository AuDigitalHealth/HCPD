CodeSystem: ServiceProvision_CS
Id: service-provision-cs
Title: "Service Provision CodeSystem"
Description: "The Service Provision CodeSystem defines a concept (in addition to those defined in [Service Provision Conditions Australian Concepts](https://hl7.org.au/fhir/4.1.0/CodeSystem-service-provision-conditions.html) that may be used to identify the service provision condition of a healthcare service in HCPD."
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/CodeSystem/service-provision-cs"
* ^status = #active
* ^experimental = false
* ^date = "2026-09-10"
* ^purpose = "This CodeSystem makes available additional service provision codes beyond those available in the HL7 AU Base, specifically to support mixed billing scenarios within the Health Connect Provider Directory."
* ^caseSensitive = true
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete
* ^count = 4
* ^version = "1.0.0"
* ^meta.profile = "https://healthterminologies.gov.au/fhir/StructureDefinition/complete-code-system-4"

* #NFE "No Fee" "A free service where no payment or Medicare card is required."
* #FAP "Fees Apply" "Fees apply for this service."
* #MIX "Mixed Billing" "Bulk billing available with conditions, fees may apply."
* #BB "Bulk Billing" "No fee for eligible services with a Medicare card presented."