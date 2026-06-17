Instance: responder-actor-health-connect
InstanceOf: ActorDefinition
Title: "Health Connect Provider Directory Responder Actor"
Usage: #definition
Description: "The Health Connect Provider Directory Responder actor represents the system that provides **Health Connect Provider Directory details**. It accepts requests for Directory information about practitioners or services and returns the requested information, or an error message if the request cannot be fulfilled."

* name = "ResponderActorHealthConnect"
* status = #active
* experimental = false
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* documentation = """ 
- **SHALL** implement the [mandatory](conformance.html) requirements for the elements defined as such in this implementation guide.
- **SHALL** implement the required REST API interactions and search parameters as defined in the Health Connect Provider Directory Responder Capability Statement.
"""

* capabilities = "http://digitalhealth.gov.au/fhir/hcpd/CapabilityStatement/health-connect-provider-directory-responder"