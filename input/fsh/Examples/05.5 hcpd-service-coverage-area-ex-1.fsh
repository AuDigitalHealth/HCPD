Instance: example-healthconnect-service-coverage-area-balmain-1
InstanceOf: HCPD_Service_Coverage_Area
Usage: #example
Title: "HCPD Service Coverage Area Example: Balmain (2041)"
Description: "A service coverage area representing the Balmain suburb postcode (2041), used to define the geographic eligibility boundary for a healthcare service."

* meta.lastUpdated = "2026-09-10T10:00:00+10:00"

* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated

* status = #active

* name = "Balmain Service Coverage Area"
* description = "Coverage area for healthcare services available to residents of Balmain and surrounding postcodes in the Inner West of Sydney."

* address.city = "Balmain"
* address.state = "NSW"
* address.postalCode = "2041"
* address.country = "AU"

* managingOrganization = Reference(Organization/example-healthconnect-organization-1)
