Instance: requester-actor-health-connect
InstanceOf: ActorDefinition
Title: "Health Connect Provider Directory Requester Actor"
Usage: #definition
Description: "The Health Connect Provider Directory Requester actor represents a system that is requesting **Health Connect Provider Directory details** for a particular provider or resource from the
Health Connect Provider Directory system."

* name = "RequesterActorHealthConnect"
* status = #active
* experimental = false
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* documentation = """
- **SHALL** implement the [mandatory](conformance.html) requirements for the elements defined as such in this implementation guide.
- **SHALL** implement the required REST API interactions and search parameters as defined in the HealthConnect Requester Capability Statement.
"""

* capabilities = "http://digitalhealth.gov.au/fhir/hcpd/CapabilityStatement/health-connect-provider-directory-requester"