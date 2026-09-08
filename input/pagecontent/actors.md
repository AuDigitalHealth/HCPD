The following ActorDefinitions define the systems that plays a role in data exchange, and that have obligations associated with the role the actor plays, in Health Connect.

- [Health Connect Provider Directory Requester Actor](ActorDefinition-requester-actor-health-connect.html)

The Health Connect Provider Directory Requester is a system that creates and initiates a data access request to retrieve core digital health and administrative information. The set of capabilities (behaviours) for this actor is defined in [Health Connect Provider Directory Requester CapabilityStatement](CapabilityStatement-health-connect-provider-directory-requester.html).

- [Health Connect Provider Directory Responder Actor](ActorDefinition-responder-actor-health-connect.html)

The Health Connect Provider Directory Responder is a system that retrieves core digital health and administrative information. The set of capabilities (behaviours) for this actor is defined in [Health Connect Provider Directory Responder CapabilityStatement](CapabilityStatement-health-connect-provider-directory-responder.html).

- [Health Connect Provider Directory Bulk Export Requester Actor](ActorDefinition-bulk-export-requester-actor-health-connect.html)

The Health Connect Provider Directory Bulk Export Requester is a system that initiates bulk data export requests from the Health Connect Provider Directory system. This actor is specifically designed for bulk export operations and is responsible for submitting properly formatted export parameters and processing returned bulk data files. Implementers **SHALL** respect the `suppressed` and `deactivated-by` extensions on returned resources, filtering these resources before displaying them to end consumers of the HCPD. The set of capabilities (behaviours) for this actor is defined in [Health Connect Provider Directory Bulk Export Requester CapabilityStatement](CapabilityStatement-health-connect-bulk-export-requester.html).
