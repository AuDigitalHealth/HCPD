Profile: Peak_Body_Professional_Registration_Number
Parent: Identifier
Id: pbprn
Title: "Peak Body Professional Registration Number (PBPRN)"
Description: "This identifier profile defines a peak body (non-Ahpra) professional registration number allocated to a healthcare practitioner."
* ^experimental = false
* ^status = #active
* . ^short = "Peak Body Professional Registration Number"
* . ^definition = "Professional Registration Number that the practitioner has with Professional association / Peak body association (for non-Ahpra registered practitioners), as recorded against the HPI-I record."
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/pbprn"

* type 1.. MS
* type = $v2-0203-int#PRN (exactly)
* type ^short = "Coded identifier type for professional registration number"
* type.text = "Peak Body Professional Registration Number"
* system 1.. MS
* system ^short = "Professional registration number system."
* system ^definition = "Namespace for the professional registration number."
* value 1.. MS
* value ^short = "Professional registration number value."
* value ^definition = "Professional registration number value."
* assigner MS
* assigner.display 1.. MS
* assigner.display ^short = "Text alternative for the Organization"