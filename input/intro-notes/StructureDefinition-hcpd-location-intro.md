No data is entered directly into Health Connect; all Directory content is sourced from authoritative systems including [PCA](https://developer.digitalhealth.gov.au/fhir/provider-connect-australia/current/index.html?src=/), HI-Service, and NHSD.

### Extensions
Extensions introduced in this profile:
* Location: [Amenity](StructureDefinition-amenity.html)
* Location: [HCPD Alternate Postal Address](StructureDefinition-hcpd-alternate-postal-address.html)
* Location: [Suppressed](StructureDefinition-suppressed.html)
* Location: [Deactivated](StructureDefinition-deactivated.html)

### Visibility and Suppression
The HCPD Location profile supports the [Suppressed](StructureDefinition-suppressed.html) extension, however its application is conceptually driven by organizational visibility decisions. When an [HCPD Organization](StructureDefinition-hcpd-organization.html) elects to hide their visibility from those searching the Health Connect Provider Directory system by applying the suppressed extension with an `organisation-initiated` code, all associated Location resources are automatically suppressed and excluded from Provider Directory listings. This cascading suppression ensures that when an organization chooses to hide their visibility, related locations "come for the ride" and are similarly hidden from display, maintaining consistency across the directory.

### Usage notes
Publishing guidance:

A HC Location resource may also have additional identifiers specific to other business partners, and their identifier systems may or may not match other identifier slices defined in [AU Core Location](https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-location.html).

#### Identifiers
Beyond the identifiers already defined in AU Core the HC Location profile explicitly supports the following identifier slice (as indicated by the must support flag):

* [HCPD Local Identifier (hcpd-LI)](StructureDefinition-hcpd-local-identifier.html) - Unique identifier attributed by the HCPD system. 

#### Type
The usage notes of the AU Base Location profile provide guidance for Locations that may form part of defining a mobile or remotely delivered service. The HCPD Location profile formalises this guidance as mandatory requirements (via invariants). The requirements are summarised below:

A HCPD Location for a mobile service **shall** have:
  * type=’MOBL’ plus at least one of the following codes: 'PTRES', 'SCHOOL', 'WORK', 'COMM' or 'AMB', to further qualify where the mobile service is offered. 

A HCPD Location for a virtually delivered service **shall** have:

  * type=’VI’

##### PhysicalType
When a Location is to be represented as a physical type, the `physicalType` element is used to carry an applicable code from the [Location Type (Physical) - AU Extended ValueSet](https://hl7.org.au/fhir/6.0.0-ballot/ValueSet-au-location-physical-type-extended.html). 

The `physicalType` element can be used to express more specific details about the physical nature of a Location (for example: ward, building, dwelling). 

#### Organization reference
The *managingOrganization* element must contain a relative reference to an existing [HC Organization](StructureDefinition-hcpd-organization.html).

#### Invariants

##### Invariant: hcpd-alternate-postal-address
Description: If the alternate postal address extension is present on an address then that address must be of type 'postal'.

Implementation note: The profile enforces this rule so that the `hcpd-alternate-postal-address` extension is only used to carry postal/mailing addresses (for example PO Boxes). Publishing systems SHOULD only set the extension on addresses whose `type` is `postal`.

##### Invariant: inv-01-address-requirement
Description: If a location's `type` is `VI` or `MOBL` then an address does not need to be present. For all other location types an `address` MUST be present.

Implementation note: This invariant ensures that physical locations provide a postal/physical address, while virtual or mobile services (for example telehealth, mobile clinics, ambulance services) may omit a fixed address.

##### Invariant: inv-02-type-mobl-requires-modifier
Description: If a location's `type` includes the `MOBL` code then it is recommended that an additional modifier coding is provided to describe the mobile service (either `PTRES`, `SCHOOL`, `WORK`, `COMM`, `AMB`) but not `VI`.

Implementation note: This rule is a *warning* - it does not block publishing but encourages publishers to provide additional context about where the mobile service operates. Implementers should supply a secondary `type.coding` entry when describing mobile services to improve discoverability.

##### Invariant: inv-03-type-vi-should-not-have-modifier
Description: If a location's `type` includes the `VI` code then no additional modifier codings should be present.

Implementation note: This rule is a *warning* - virtual locations should be clearly identified as virtual-only and not include additional modifiers that suggest physical or mobile subtypes. If a virtual service also has a physical component, model those as separate Location resources.

##### Invariant: inv-04-type-or-physicaltype-present
Description: A Location resource MUST include either a `type` or a `physicalType` element.

Implementation note: This rule is enforced as an error - every Location must be classified either by `type` (logical role such as `MOBL`, `VI`, etc.) or by `physicalType` (when the Location represents a specific physical characteristic). Implementers MUST populate at least one of these elements when creating Location resources.

##### Invariant: inv-05-status-values
Description: Location.`status` must be `active` or `inactive`. The `suspended` status is not used in HCPD.

Implementation note: This rule is enforced as an error - HCPD only recognises active and inactive states for a Location. Publishing systems MUST NOT set `status` to `suspended`. When a Location is no longer available it should be set to `inactive`.

