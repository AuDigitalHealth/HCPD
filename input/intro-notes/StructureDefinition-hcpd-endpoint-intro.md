No data is entered directly into Health Connect; all Directory content is sourced from authoritative systems including [PCA](https://developer.digitalhealth.gov.au/fhir/provider-connect-australia/current/index.html?src=/), HI-Service, and NHSD.


### Extensions
Extensions introduced in this profile:
* Endpoint: [AU Receiving Facility](http://hl7.org.au/fhir/StructureDefinition/au-receivingfacility)
* Endpoint: [AU Receiving Application](http://hl7.org.au/fhir/StructureDefinition/au-receivingapplication)
* Endpoint: [Encryption Certificate PEM X509](http://hl7.org.au/fhir/StructureDefinition/encryption-certificate-pem-x509)
* Endpoint: [Suppressed](StructureDefinition-suppressed.html)
* Endpoint: [Deactivated](StructureDefinition-deactivated.html)

### Visibility and Suppression
The HCPD Endpoint profile supports the [Suppressed](StructureDefinition-suppressed.html) extension, however its application is conceptually driven by organizational visibility decisions. When an [HCPD Organization](StructureDefinition-hcpd-organization.html) elects to hide their visibility from those searching the Health Connect Provider Directory system by applying the suppressed extension with an `organisation-initiated` code, all associated Endpoint resources (whether referenced from HealthcareService, Location, or PractitionerRole) are automatically suppressed and excluded from Provider Directory listings. This cascading suppression ensures that when an organization chooses to hide their visibility, related endpoints "come for the ride" and are similarly hidden from display, maintaining consistency across the directory.

### Usage notes
The following guidance expands on operational and implementation expectations for this Endpoint profile.

- Purpose: An `Endpoint` in Health Connect describes how to communicate with a service (address, protocol, payloads and contact details). Directory consumers use this information to establish connections, and operational tooling uses it to monitor and validate connectivity.

#### Guidance on the use of endpoints 
The HCPD IG offers flexibility with the use of endpoints. The IG supports referencing an endpoint from the HealthcareService, Location & PractitionerRole resources. 
The recommended hierarchy for when endpoints **SHOULD** be applied is as follows:

- When a HealthcareService, with it's associated referenced Location and PractitionerRoles exist within the same space then an endpoint at this level is suggested.  

- When a Location requires differentiation from the referenced HealthcareService due to operational or business requirements, then referencing an endpoint at this level may make sense for the particular use case. 

- If a high degree of granular communication is required then referencing an endpoint from the PractitionerRole resource could be applicable. 


#### Implementation requirements vs. processing

Implementers SHALL process all elements marked as Must Support (MS) in this profile to be conformant. However, certain elements that are mandatory do not need to be processed by Health Connect Provider Directory Requester Actors.

#### Initial endpoint scope and future expansion

Health Connect initially expects published `Endpoint` resources to describe Secure Messaging endpoints (SMD-capable targets and related secure messaging transports). Requesters and search clients should expect SMD-specific metadata and prioritise handling SMD attributes (SMD Target Identifier, encryption certificate, and routing identifiers). Over time, clients may be able to handle additional protocol metadata (for example, FHIR REST endpoint details) as publishers begin to expose FHIR and other transport types. 

#### Identifiers and stable handles

The Endpoint profile uses two stable identifier slices for Directory management and routing:

- [HCPD Local Identifier (HCPD-LI)](StructureDefinition-hcpd-local-identifier.html) - Unique identifier attributed by the HCPD system.
  
- [HCPD SMD Target Identifier](StructureDefinition-hcpd-smd-target-identifier.html) - a slice used only when the endpoint (or associated practitioner/service) supports Secure Messaging Delivery (SMD). When present the SMD identifier SHALL be globally unique and SHALL be treated as an immutable routing handle for secure point‑to‑point or hub‑mediated messaging. Publishers SHOULD only populate this slice for endpoints that actually support SMD.

### Reciprocal relationships

In FHIR, linkage to resources is owned by the referencing resources (`HealthcareService.endpoint`, `PractitionerRole.endpoint`, `Location.endpoint`). The Endpoint resource itself has no back‑reference slots to those resources. Consequently:

- Reciprocity cannot be enforced within the Endpoint profile (there is no standard element on Endpoint to list referencing HealthcareService / Location / PractitionerRole resources).
- Directory governance MUST ensure that when a referencing resource adds or removes an Endpoint, any operational expectations (availability, deprecation, auditing) are handled in process.

#### Invariants

##### Invariant: inv-ep-01-status-values
Description: Endpoint.`status` must be `active`, `suspended`, or `off`. The `error` and `test` statuses are not used in HCPD.

Implementation note: This rule is enforced as an error - HCPD only recognises active, suspended, and off states for an Endpoint. Publishing systems MUST NOT set `status` to `error` or `test`. When an Endpoint is no longer available it should be set to `off`; `suspended` may be used when the endpoint is temporarily unavailable.
