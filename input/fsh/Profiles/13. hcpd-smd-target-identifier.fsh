Profile: HCPD_SMD_Target_Identifier
Parent: Identifier
Id: hcpd-smd-target-identifier
Title: "HCPD SMD Target Identifier (HCPD-SMDTI)"
Description: "This identifier profile defines a SMD target identifier allocated to a healthcare practitioner, in a Health Connect Provider Directory context."
* ^experimental = false
* ^status = #active
* . ^short = "SMD Target Identifier"
* . ^definition = "SMD Target Identifier that the practitioner has with Professional association / Peak body association (for non-Ahpra registered practitioners), as recorded against the HPI-I record."
* system 1..1
* system = "http://ns.electronichealth.net.au/smd/target" (exactly)
* system ^short = "Secure Messaging Delivery Target Identifier"
* system ^definition = "Target identifier suitable for Secure Message Delivery interface metadata content; also allows lookup for responses."
* value 1..1
* value ^short = "SMD Target Identifier Value"
* value ^definition = "Assigning SMD target identifier value."
* value ^example.label = "SMD Target ID"
* value ^example.valueString = "1234567890"
* assigner 0..1
* assigner ^short = "Organization that issued the smdTarget identifier (may be just text)"
* assigner ^definition = "Organization that issued the smdTarget identifier (may be just text)."
