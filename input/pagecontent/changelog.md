**This change log documents the significant updates and resolutions implemented from version 0.1.0 of this IG to present.**

Interested in contributing to this IG? See the [Contributing guide](contributing.html) for how to raise issues and propose changes.

### Release 26.0.0
- Publication date: 2026-09-10
- Publication status: release
- Based on FHIR version: 4.0.1

#### Changes in this version
- Makes PractitionerRole.code.coding.display mandatory and a dedicated searchparameter to search by display name.
- Creates a dedicated search parameter for HealthcareService.type.coding.display to search by display name.
- Adds HCPD API page defining operational behaviour for real-time search and read interactions in the Health Connect Provider Directory API.
- Removes PractitionerRole invariants regarding AHPRA/PRN (both invariants removed); PractitionerRole registrations SHOULD match the Practitioner's qualification identifiers for those cases where there isn't a AHPRA or PRN.
- Makes `Organization.active` mandatory (minimum cardinality set to 1) in the HCPD Organization profile.
- Adds `hpio-status` extension to `HCPD_HPIO_Identifier` profile.
- Adds `hcpd-hspo-status` extension to `HCPD_HSPO_Identifier`profile.
- Adds `bulk-export-requester-actor-health-connect` actor obligation (`#SHOULD:handle`) to every profiled element across all seven resource profiles (Practitioner, PractitionerRole, HealthcareService, Organization, Location, Endpoint, ServiceCoverageArea), aligning bulk-export clients with the same element-level obligations as requester systems.
- Adds `HI_Services_Identifier_Status` extension, CodeSystem (`hi-services-identifier-status-cs`), and ValueSet (`hi-services-identifier-status-vs`) to represent the HI Service status of an HPI-I identifier (Active, Deactivated, Retired). Applied to the `HCPD_HPII_Identifier` profile via the `hcpd-hpii-status` named slice.
- Adds the `deactivated` extension to all applicable resource profiles (Practitioner, PractitionerRole, HealthcareService, Organization, Location, Endpoint, ServiceCoverageArea) with profile-constrained `deactivatedBy` responsible party codes.
- Adds the `deactivated` extension to all applicable example instances to demonstrate its use alongside the `suppressed` extension.
- Adds a comprehensive HealthcareService example (`example-healthconnect-healthcareservice-2`) demonstrating all defined profile elements including all extensions, multiple service types, availability windows, not-available periods, eligibility criteria, and telecoms.
- Corrects example instances for HealthcareService, Endpoint, and PractitionerRole to include the required `HCPD_Source_Identifier` slice and mandatory `active` element.
- Adds `$hcpd-hi-status-cs` alias for the HI Services Identifier Status CodeSystem canonical URL.
- Adds guidance on unsupported Practitioner data attributes (Gender Identity, Gender, Birth Date, Photo, Address, PBSPrescriberNumber) that HCPD is not authorised to collect, store, use, or expose as search parameters. Publishers are directed to use `Recorded Sex or Gender (RSG)` for sex or gender searches instead of `gender` or `genderIdentity`.
- Removes the HCPD Export Response List profile and example instance. 
- Removes Trial from the releaseLabel. 
- Adds guidance on how to contribute to the IG and references the GitHub. 
- Removes constraining language from extensions that are scoped greater than just the HCPD IG: `Active Period`, `IAR Levels Of Care`,`New Patient Availability` 
- Removes redundant elements from the `Alternate Name` extension. 
- Removes useContext and changes to jurisdiction to remove publisher validator errors.
- Changed the HCPD-PBPRN identifier profile. Removed references to HCPD, made system mandatory, changed the system uri to `cc` as opposed to `hcpd`. 
- Updates the licence and Legal statements [49](https://github.com/AuDigitalHealth/HCPD/issues/49)
- Adds code of `BB` Bulk Billing Only to Service Provision Conditions CodeSystem. 
- Updates the definition of code `NFE` from Service Provision Conditions CodeSystem and hosts locally.  
- Clarifies that the `data-absent-reason` extension is used on `Organization.name` (e.g. `masked`).
- Updates intro-notes for all HCPD resource profiles to document the `deactivated-by` extension, including element context and allowed responsible party codes for each resource.
- Adds `inv-05-status-values` invariant to the HCPD Location profile constraining `Location.status` to `active` or `inactive` only; the `suspended` status is not used in HCPD.
- Adds `suppressed` extension for Organization, Practitioner, PractitionerRole, HealthcareService, Location and Endpoint, including Organization support for suppression reason and `includeSelf`.
- Adds [`suppressed`](SearchParameter-suppressed.html) to enable searching by suppression status.

### Release 26.0.0 (initial release)
- Publication date: 2026-04-29
- Publication status: Trial
- Based on FHIR version: 4.0.1

#### Changes in this version
- Migrated New Patient Availability CodeSystem and ValueSet to NCTS hosted terminology (https://www.healthterminologies.gov.au/integration/R4/fhir/CodeSystem/new-patient-availability-1 and https://www.healthterminologies.gov.au/integration/R4/fhir/ValueSet/new-patient-availability-1) instead of local definitions.
- Incremented to initial release versioning 26.0.0 and active statuses for resources. 
- Removed `HC Endpoint Identifier` in favour of using `HCPD Local Identifier`
- Changed SearchParameter `hcepi` to work with the Local Identifier `XX` type. 
- Removed the constraint identifier.type equals to `NOI` from HCPD-HSPO identifier dataType profile.
- Updates last cases of HC to HCPD for better alignment with IG and Agency publishing framework. 
- Adds a known issue explanation for use of AU PD `current` IG versioning. 
- Declares FHIRPath v2.0.0 as a dependency. 
- Adds guidance on the appropriate use of endpoints [39](https://github.com/AuDigitalHealth/HealthConnect/issues/39)
- Changed the narrative guidance for HealthcareService.Location reference [46](https://github.com/AuDigitalHealth/HealthConnect/issues/46)
- Added HCPD Export Request Parameters profile for bulk data extraction.
- Enhanced bulk data extraction documentation with profile references and examples.
- Added system-level export operation to Responder capability statement for bulk data export functionality.
- Enhanced bulk export architecture with specialised `Health Connect Provider Directory Bulk Export Requester` actor that handles Parameters resource submission.
- Added Extensibility statement to scope.
- Removed the Suppression extension, associated CodeSystem, ValueSet, and all narrative references.
- Added guidance on data removal procedures via PCA in the Security and Privacy section.
- Remove the IAR CodeSystem and ValueSet from being defined internally and referenced in the NCTS.
- Adds further detail to the scope statement regarding intended audience for downstream users of the IG [47](https://github.com/AuDigitalHealth/HCPD/issues/47)
- Migrates the known issues to become a tab under Support in alignment with Agency publishing requirements.
- Removes the PCA-HSI extension as redundant due to the existence of the HCPD Source Identifier


### Release 0.3.0 (Snapshot 3)
- Publication date: 2026-03-02
- Publication status: Preview 
- Based on FHIR version: 4.0.1

#### Changes in this version
- Added guidance on Bulk Data Extraction IG v3.0.0
- Changed the url pattern from `http://ns.electronichealth.net.au/hc` to `http://digitalhealth.gov.au/fhir/hcpd` 
- Prepare extensions to be used in Agency common components FHIR IG.
- Added an Experimental Dependency section to Guidance.
- No longer internally defines the ValueSet or CodeSystem for PayloadType on Endpoint but rather points to AU PD's implementation. 
- No longer internally defines the ValueSet or CodeSystem for ServiceInterfaces on Endpoint but rather points to AU PD's implementation.
- Added dependency of AU Provider Directory IG v2.1.0
- Changed SearchParameters to become non-experimental. 
- Removed bundle batch search guidance. No longer recommended for synchronous 'standard' searching. 
- Reformat the Guidance section to place SearchParameter related material entirely under it's own section.
- Added Security and Privacy tab.
- Added more detailed definitions to the IAR CodeSystem. 
- Reprofile the new patient availability extension from Boolean to CodeableConcept to align with NHSD and PCA [42](https://github.com/AuDigitalHealth/HCPD/issues/42) 
- Define NCTS profile types on terminology artefacts. 
- Add the Contact Purpose extension on HealthcareService.telecom [43](https://github.com/AuDigitalHealth/HCPD/issues/43)
- Add the extension `hcpd-suppressed` describe the guidance and apply to profiles: Practitioner, PractitionerRole and Organization.
- Removed genderIdentity extension, value set, search parameter guidance, examples, and narrative. 
- Add identifier profile hcpd-LI for internal system use. 
- Change namespaces on extensions to allow later re-factor into a Common Components IG. 
- removed constraints for Organization.alias and Organization.address:postal

### Release 0.2.0 (Snapshot 2)
- Publication date: 2026-01-16
- Publication status: Preview 
- Based on FHIR version: 4.0.1

#### Changes in this version
- Fixed typos.
- Change diagram to be more consistent with UML practices. 
- Removed narrative irrelevant to Requester actor from provenance profile about connecting systems. 
- Include guidance on Endpoint.status being ignored.
- Include guidance on future vs current Endpoint type support. [#29](https://github.com/AuDigitalHealth/HCPD/issues/29)
- Change cardinalities on PractitionerRole.Endpoint, Location.Endpoint & HealthcareService.Endpoint from 0..1 -> 0..*. [#12](https://github.com/AuDigitalHealth/HCPD/issues/12)
- The fixed value for `HSP-O Identifier.type.coding.code` has been changed from `http://terminology.hl7.org/CodeSystem/v2-0203` code `XX` to `http://terminology.hl7.org.au/CodeSystem/v2-0203` code `NOI`, aligning with other AU Base national organisation identifiers such as HPI-I and PAI-O. [#8](https://github.com/AuDigitalHealth/HCPD/issues/8)
- The short description and definition of Practitioner.qualification changed to "Professional registration details of the practitioner".
- Removed case sensitive element from hcpd-iar-levels-of-care code system definition. [#15](https://github.com/AuDigitalHealth/HCPD/issues/15)
- Change cardinality on Endpoint.identifier from 2..* -> 1..*.
- Correct the numbering of navigation tabs. [#5](https://github.com/AuDigitalHealth/HCPD/issues/5)
- Created a new Health Connect Provider Directory Responder actor and capability statement that is responsible for providing responses to queries submitted by Health Connect Provider Directory Requester actors.
- Correct the constraint so that it works correctly warning that both HSPO and HPIO cannot be applied to an Organization.
- Remove `prn` search parameter and revert to standard identifier search on PractitionerRole with updated guidance. 
- Add R5-style `identifier search for Practitioner (identifier-r5) supporting both Practitioner.identifier and Practitioner.qualification.identifier.
- Update PractitionerRole and HealthcareService examples to include TimeZone. [#14](https://github.com/AuDigitalHealth/HCPD/issues/14)
- Add guidance about ignoring PractitionerRole.speciality. 
- Modification to license attribution. [#16](https://github.com/AuDigitalHealth/HCPD/issues/16)
- Renamed Health Connect Reader actor to Health Connect Provider Directory Requester actor [#17](https://github.com/AuDigitalHealth/HCPD/issues/17)
- Renamed Health Connect Reader capability statement to Health Connect Provider Directory Requester capability statement. [#17](https://github.com/AuDigitalHealth/HCPD/issues/17)
- Add Must Support Obligations on both client and server actors. [#20](https://github.com/AuDigitalHealth/HCPD/issues/20)
- Improve Must Support guidance. [#18](https://github.com/AuDigitalHealth/HCPD/issues/18)
- Restructure example title names. 
- Update the guidance for SearchParameters. [#22](https://github.com/AuDigitalHealth/HCPD/issues/22)
- Improve the conformance statement. 
- Add Location-physicalType SearchParameter.
- Remove Health Connect from references to IAR. 
- Update to correctly apply SHOULD or SHALL strength to Resource Conformance in Actor Capability Statements. 
- Add warning constraint to Professional Registration Number Identifier (PRN) so that either system or assigner should be present. 
- Improve the 2nd Practitioner example so that both Qualifications render properly in html output and use example systems for professional boards.
- Change the uri for ProfessionalRegistrationNumber to lowercase for consistency. 
- The following CodeSystems and ValueSets now are abstracted to the NCTS to minimize redundancy: Service Eligibility CS & VS, Facility Amenity CS & VS, Service Delivery Location Role Type VS. 
- Remove the custom name SearchParameters for Practitioner and revert to R4 name SearchParameter. [#24](https://github.com/AuDigitalHealth/HCPD/issues/24)
- Provide better guidance on the operation of the `rsg` SearchParameter. 
- Add Must Support and Obligations to data element Location.position. [#28](https://github.com/AuDigitalHealth/HCPD/issues/28)
- Describe use of `near` SearchParameter in Location notes. 
- Add guidance section on bulk syndication. 
- Add location example that uses physicalType to better delineate between: Mobile, Virtual and Physical Location instance use cases. 
- Tidy up to invariants on Location profile. 
- Fix type of postal to extension `Preferred Postal Address`.
- Add section to SearchParameters markdown describing recommended modifier usage. [#23](https://github.com/AuDigitalHealth/HCPD/issues/23)
- Add second Organization example with HSP-O identifier.
- Declare support for more modifiers in SearchParameters. [#23](https://github.com/AuDigitalHealth/HCPD/issues/23)
- Change name of `postaladdress` SearchParameter to `locmailaddress` for clarity. 
- Update `hcepi` and `prn` search parameters from string to token type for built-in exact matching without requiring modifiers.
- Add proximity search sorting guidance with `_sort=near` parameter for closest-first ordering of Location results.
- Updated `starttime` and `endtime` SearchParameters to support numeric prefix operators (ge, gt, le, lt, ne) for time-based searches. Changed to #number type for both. Time values are internally converted to HHMM integers to allow for prefix use. Limitations described. 
- Update guidance for best use of `prn` search parameter.
- Rename slice professionalregistrationnumber to peakbodyregistrationnumber to add clarity about use case. 
- Give clearer guidance on client Requester actor having no requirements to implement any particular SearchParameters. [#36](https://github.com/AuDigitalHealth/HCPD/issues/36)
- Add `agent.role` and `agent.type` data elements to existing Provenance examples.
- Add further description about what Provenance SearchParameters are supported. 
- Add guidance on the use of `:iterate` as a modifier on `_include` and `_revinclude`. 
- Changed the Data Model Overview Diagram Endpoint Cardinality from 0..1 to 0..*. [#37](https://github.com/AuDigitalHealth/HCPD/issues/37)
- Removed the `roletype` SearchParameter in favour of using R4 defined `role`.
- Changed the `languages` SearchParameter to operate as token, i.e. system|code usage.

### Release 0.1.0 (Snapshot 1)
- Publication date: 2025-11-19
- Publication status: Preview 
- Based on FHIR version: 4.0.1

#### Changes in this version
- Initial foundation for Community Consultation. 