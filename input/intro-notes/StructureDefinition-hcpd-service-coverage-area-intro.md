No data is entered directly into Health Connect; all Directory content is sourced from authoritative systems including [PCA](https://developer.digitalhealth.gov.au/fhir/provider-connect-australia/current/index.html?src=/), HI-Service, and NHSD.

### Service coverage area in Health Connect

The address that defines the coverage area where the service is available is represented by this profile. The HCPD Service Coverage Area profile is applied to FHIR Location resources to describe an Australian geographic area (postcode, suburb, or region) in which a healthcare service is available.

This profile is referenced by the [HCPD HealthcareService](StructureDefinition-hcpd-healthcareservice.html) profile via the `coverageArea` element, allowing each healthcare service to specify one or more geographic areas where the service is offered. It may also be referenced by other profiles that need to describe service eligibility or restrictions based on geography.

### Usage notes

The coverage area that a service is intended for/available to can be represented as one or more instances of Location, where the address elements are populated depending on the type of coverage area to be defined. 

To define an Australia-wide coverage area, only the following element shall be populated:

* address.country

To define a coverage area for a particular state, the following elements should be populated in addition to address.country:

* address.state

To define a coverage area for a particular suburb, the following elements should be populated in addition to address.country:

* address.city
* address.postalCode
* address.state