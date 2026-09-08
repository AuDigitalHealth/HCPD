This page records the conformance expectations for the Health Connect Provider Directory Implementation Guide. The IG defines two client actors:

- [Health Connect Provider Directory Requester Actor](CapabilityStatement-health-connect-provider-directory-requester.html)
- [Bulk Export Requester Actor](ActorDefinition-bulk-export-requester-actor-health-connect.html)

Client systems **SHALL** claim conformance to a **minimum of one actor**, but are **not required** to be conformant to both actors.

### FHIR conformance

As a healthcare provider-focused implementation guide, conformance requirements are centred on client systems' ability to parse, validate, and consume FHIR resources that conform to the HC profile specifications. Implementations SHALL demonstrate profile conformance by respecting the data structures defined in profiles and adhering to the structural definitions, cardinality constraints, invariants, and terminology bindings specified within the HC profiles when processing resources retrieved from the Health Connect Provider Directory.

#### Profiles and data structure conformance

Client systems claiming conformance as a **Health Connect Provider Directory Requester Actor** SHALL be able to correctly interpret and process resources conforming to the following target profiles, respecting their defined data structures:

- [HC Organization](StructureDefinition-hcpd-organization.html) — organisation-level data structure conformance for discovery and reads
- [HC Practitioner](StructureDefinition-hcpd-practitioner.html) — individual practitioner data structure conformance for discovery and reads

Client systems claiming conformance as a **Bulk Export Requester Actor** SHALL be able to correctly interpret and process bulk exported resources conforming to the following target profiles, respecting their defined data structures:

- [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) — parameters data structure conformance for initiating bulk export operations

For the profiles above, Health Connect Provider Directory Requester Actors SHOULD support discovery and retrieval operations (for example `search` and `read`) while ensuring they can correctly parse and utilize the structured data according to profile specifications. See the FHIR HTTP operations documentation ([FHIR HTTP operations](https://hl7.org/fhir/R4/http.html)) and the AU Core general requirements ([AU Core general requirements](https://hl7.org.au/fhir/core/2.0.0-ballot/general-requirements.html)) for full details. Health Connect Provider Directory Requester Actors SHOULD consult the target Server's `CapabilityStatement` to determine the exact set of supported interactions.

#### Search parameters and terminology

Where a SearchParameter is of type token, the Health Connect Provider Directory Requester Actor SHOULD supply `system|code` or `system|value` using the code systems and value sets referenced by the IG. If a system is not available, then a value alone may be supplied. However, implementers must have in place mechanisms that clearly identify or mark matching values belonging to different systems. The published IG and the target server's `CapabilityStatement` should be consulted for the authoritative list of recommended SearchParameters and the expected token ValueSets. Although some value sets may be `preferred` rather than `required`, Requesters are strongly recommended to adopt those value sets where appropriate to maximise interoperability and minimise integration effort. The exception here, being the [ValueSet: hl7VS-degreeLicenseCertificate](https://hl7.org.au/fhir/6.0.0-ballot/ValueSet-au-v2-0360-extended.html) which is applied to `Practitioner.qualification.code`. This value set is not optimal for the intended use case but is used in lieu of an established alternative. 

Within the scope of this IG, the Requester actor is not required to support any SearchParameters, all are marked as SHOULD support. Implementers may leverage SearchParameters defined within this IG (including those inherited) as they see fit in accordance with their own use cases to interact with the Health Connect Provider Directory system. 

#### Error handling

Health Connect Provider Directory Requesters SHALL correctly handle OperationOutcome responses and non-2xx HTTP responses returned by servers.

#### Conformance testing

Conformance tests SHOULD verify that Requester implementations can:

- Perform `search` and `read` interactions against Organization and Practitioner profiles
- Handle multiple-result searches and pagination
- Respect server-declared search parameters and handle unsupported parameters gracefully
- Properly process OperationOutcome responses and error conditions

This document is intentionally narrow in scope for the Requester actor.

#### Missing data

It is an expectation that [Health Connect Provider Directory Requester Actor](CapabilityStatement-health-connect-provider-directory-requester.html) implementers SHALL be able to handle cases where missing data exists. Where mandatory elements are missing, this will be indicated by the established convention in FHIR, i.e. supplying the extension [`DataAbsentReason`](https://hl7.org/fhir/R4/extension-data-absent-reason.html).


### Software conformance profile

A risk-based Provider Directory conformance profile will be developed for connecting systems to mitigate the identified risks and describe desired software behaviours. The software developer must ensure their system behaves in accordance with the desired behaviours outlined in the conformance profile and associated artefacts.

#### Software conformance assessment

The conformance assessment approach and the associated test specification will be developed for connecting systems. The software developer must demonstrate conformance to the relevant Conformance Profile in addition to meeting the FHIR conformance requirements in section above.




