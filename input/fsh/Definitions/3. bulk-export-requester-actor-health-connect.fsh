Instance: bulk-export-requester-actor-health-connect
InstanceOf: ActorDefinition
Title: "Health Connect Provider Directory Bulk Export Requester Actor"
Usage: #definition
Description: "The Health Connect Provider Directory Bulk Export Requester actor represents a system that initiates **bulk data export requests** from the Health Connect Provider Directory system. This actor is responsible for submitting properly formatted export parameters and processing the returned bulk data files."

* name = "HealthConnectProviderDirectoryBulkExportRequesterActorHealthConnect"
* status = #active
* experimental = false
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* documentation = """ 
- **SHALL** implement the [mandatory](conformance.html) requirements for the elements defined as such in this implementation guide.
- **SHALL** implement the required bulk export operations and parameter handling as defined in the Health Connect Provider Directory Bulk Export Requester Capability Statement.
- **SHALL** be able to retrieve Binary resources containing the exported bulk data files returned by the export operation.
- **SHALL** respect the `suppressed` and `deactivated-by` extensions on returned resources, filtering these resources before displaying them to end consumers of the HCPD.
"""

* capabilities = "http://digitalhealth.gov.au/fhir/hcpd/CapabilityStatement/health-connect-bulk-export-requester"