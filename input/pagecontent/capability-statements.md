The following CapabilityStatements define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

- [Health Connect Provider Directory Requester](CapabilityStatement-health-connect-provider-directory-requester.html)

This CapabilityStatement describes the basic rules for the Health Connect Provider Directory Requester Actor that is responsible for making queries to retrieve information from the [Health Connect Provider Directory Responder Actor](ActorDefinition-responder-actor-health-connect.html).

- [Health Connect Provider Directory Bulk Export Requester](CapabilityStatement-health-connect-bulk-export-requester.html)

This CapabilityStatement describes the specific rules for the [Health Connect Provider Directory Bulk Export Requester Actor](ActorDefinition-bulk-export-requester-actor-health-connect.html) that is responsible for initiating bulk data export operations. This actor submits properly formatted export parameters to the Health Connect Provider Directory Responder and processes the returned bulk data files. Implementers **SHALL** respect the `suppressed` and `deactivated-by` extensions on returned resources, filtering these resources before displaying them to end consumers of the HCPD.

- [Health Connect Provider Directory Responder](CapabilityStatement-health-connect-provider-directory-responder.html)

This CapabilityStatement describes the basic rules for the [Health Connect Provider Directory Responder Actor](ActorDefinition-responder-actor-health-connect.html) that is responsible for providing responses to queries submitted by a Health Connect Provider Directory Requester Actor. The complete list of FHIR profiles, RESTful operations, and search parameters supported by Health Connect Provider Directory Responder are defined in this CapabilityStatement.