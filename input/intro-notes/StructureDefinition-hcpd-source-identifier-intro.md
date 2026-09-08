### HCPD Source Identifier (HCPD-SI)

The `HCPD-SI` is the primary external identifier assigned by a publisher to a `HCPD` instance for identification and integration with Health Connect. It is **mandatory** for all HealthcareService, Location, Endpoint & PractitionerRole `HCPD` resources published in the Health Connect directory. 

- `identifier.type`: fixed to `RI` (resource identifier).
- `identifier.value`: the value defined by the source organisation.
- `identifier.system`: populate with a stable URI to support authoritative reconciliation.

Guidance:
- The combination of system and value MUST be globally unique within Health Connect and **SHOULD** be stable over the lifecycle of the resource.
- Use `identifier.system` to record a canonical URI when organisations have a stable namespace for their identifiers.
- This identifier **SHALL** respect the value, type and system attributed by the source system from where the data was initially ingested.  