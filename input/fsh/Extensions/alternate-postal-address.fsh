Extension: HCPD_Alternate_Postal_Address
Id: hcpd-alternate-postal-address
Title: "HCPD Alternate Postal Address"
Description: "Carries an alternate postal/mailing address for correspondence (PO Box or mailing address) that is distinct from the registered physical address. This extension is used in the context of HCPD-Location profile. Allows organisations to nominate a secure mailing address for official correspondence."
* ^context.type = #element
* ^context.expression = "Location"
* ^url = "http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-alternate-postal-address"
* ^status = #active
* ^experimental = false
* ^description = "Alternate postal/mailing address for correspondence (PO Box or mailing address) that is distinct from the registered physical address."

* value[x] only Address
* valueAddress 1..1
* valueAddress.type = #postal (exactly)
* valueAddress ^short = "Alternate postal/mailing address"
* valueAddress ^definition = "A chosen or alternate postal or mailing address, used for correspondence and separate from the registered physical address."
