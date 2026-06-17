#### HCD Local Identifier
 
Beyond the identifiers already defined in AU Core, the following HCPD resource profiles: Location, PractitionerRole, HealthcareService & Endpoint explicitly support a unique Health Connect Provider Directory attributed slice. The value of this identifier is uniquely assigned at creation, therefore this prevents duplications of values regardless of resource type. 

Publishing guidance:
- The HCPD Local Identifier (HCPD-LI) is the canonical identifier for resources internally within the Health Connect Provider Directory system and **SHALL** be supplied when known. Publishing systems **SHALL NOT** manipulate the HCPD-LI value themselves — the HCPD service **SHALL** generate and manage this identifier.