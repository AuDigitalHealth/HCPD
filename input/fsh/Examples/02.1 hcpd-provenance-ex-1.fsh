Instance: provenance-practitioner-name-update
InstanceOf: HCPD_Provenance
Usage: #example
Title: "HCPD Provenance Example: Practitioner Name Amendment"
Description: "Demonstrates provenance tracking for a practitioner's name amendment, conforming to the HCPD Provenance profile."

* target = Reference(example-healthconnect-practitioner-1)
* target.extension[targetPath].valueString = "name[0].family"
* recorded = "2025-09-15T14:30:15.123+10:00"
* agent.who = Reference(example-healthconnect-organization-1)
* agent.role = http://terminology.hl7.org/CodeSystem/contractsignertypecodes#AMENDER
* agent.type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
* activity = http://terminology.hl7.org/CodeSystem/v3-DataOperation#UPDATE

// Track specific data element
* entity[+].role = #source
* entity[=].what = Reference(external-hcpd-practitioner-record)

