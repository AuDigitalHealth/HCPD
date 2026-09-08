Profile: HCPD_Export_Request_Parameters
Parent: Parameters
Id: hcpd-export-request-parameters
Title: "HCPD Export Request Parameters"
Description: "Defines a profile of a Parameters resource used to make bulk data export requests. It contains the standard FHIR bulk export parameters including _type, _typeFilter, _outputFormat, and _since for controlling the export scope and format."
* ^status = #active
* ^experimental = false
* ^purpose = "This profile addresses the business requirement for structured bulk data export requests to the Health Connect Provider Directory, ensuring consistent parameter usage across different export scenarios."
* . ^short = "HCPD Bulk Export Request Parameters"
* . ^definition = "Defines how a Parameters resource is represented for bulk data export requests within the HCPD system."
* . obeys hcpd-exp-1 

* parameter 1..* MS
* parameter ^short = "Export parameters to control bulk data extraction"
* parameter ^definition = "Parameters that control the scope, format, and filtering of the bulk data export operation."
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter ^slicing.description = "Slice based on parameter name for different export control parameters"

* parameter contains
    outputFormat 1..1 MS and
    type 1..* MS and
    typeFilter 1..* MS and
    since 0..1 MS

* parameter[outputFormat].name 1..1 MS
* parameter[outputFormat].name = #_outputFormat (exactly)
* parameter[outputFormat].valueString 1..1 MS
* parameter[outputFormat].valueString = "application/fhir+ndjson" (exactly)
* parameter[outputFormat] ^short = "Output format (fixed to application/fhir+ndjson)"
* parameter[outputFormat] ^definition = "Specifies the format of exported data files. Fixed to NDJSON format."

* parameter[type].name 1..1 MS
* parameter[type].name = #_type (exactly)
* parameter[type].valueString 1..1 MS
* parameter[type] ^short = "Resource types to include in export"
* parameter[type] ^definition = "Comma-separated list of resource types to include, or individual _type parameters for each resource type."

* parameter[typeFilter].name 1..1 MS
* parameter[typeFilter].name = #_typeFilter (exactly)
* parameter[typeFilter].valueString 1..1 MS
* parameter[typeFilter] ^short = "Export criteria for specific resource types"
* parameter[typeFilter] ^definition = "Apply export criteria to specific resource types using FHIR search parameters. SHALL provide at least one _typeFilter for each resource type specified in _type parameters."

* parameter[since].name 1..1 MS
* parameter[since].name = #_since (exactly)
* parameter[since].valueInstant 1..1 MS
* parameter[since] ^short = "Only resources updated since specified timestamp"
* parameter[since] ^definition = "Only resources updated since the specified timestamp (ISO 8601 format) will be included in the export."

Invariant: hcpd-exp-1
Description: "Number of _typeFilter parameters must equal the total number of resource types specified across all _type parameters"
Expression: "parameter.where(name='_typeFilter').count() = parameter.where(name='_type').valueString.select(split(',')).select($this.trim()).count()"
Severity: #error