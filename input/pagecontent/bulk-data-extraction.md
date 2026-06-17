### Overview

Bulk data extraction provides an efficient mechanism for Health Connect Provider Directory consumers to retrieve large datasets outside of real-time query patterns. This specification defines how client systems can request complete copies or incremental updates of provider directory data using the [FHIR Bulk Data Access specification](http://hl7.org/fhir/uv/bulkdata/).

The Health Connect Provider Directory supports bulk data extraction for enterprise integration scenarios.

#### Background

FHIR Bulk Data extraction consists of several key components:

- **Data scope selection** - Defining which resources and data subsets to extract
- **Asynchronous processing** - Managing long-running export operations with status tracking
- **NDJSON format** - Standardised new-line delimited JSON output format
- **Secure file retrieval** - Downloading completed extracts with appropriate authorisation

**Note:** Bulk export requests require a FHIR Parameters resource in the request body to specify the export parameters. This allows for complex parameter combinations and ensures proper encoding of multiple `_typeFilter` values.

#### Process workflow

The following diagram illustrates the 3 broad steps involved in performing an asynchronous bulk export. Navigating to each of the hyperlinks yields further detail about how each is performed.

<div style="padding: 1em; border-top: 1px solid #ddd;">
  <figure>`
    {% include AsyncBatchExportActivityDiagram.svg %}
  </figure>
</div>

### Health Connect Provider Directory bulk data specifics

#### The scope of the data selection

When performing a bulk data extraction, the Parameters resource must include a `_type` parameter listing the resource types to export, as well as a `_typeFilter` parameter for every resource type specified. The `_typeFilter` defines filtering conditions that apply only to resources of its corresponding type, and only resources matching these conditions will be included in the export.





#### Supported resource types

The Health Connect Provider Directory supports bulk export for all resource types defined in this implementation guide.

### Functions provided

This service supports the standard FHIR asynchronous request pattern allowing clients to submit large queries that require significant server-side processing, with results being made available for retrieval at a later time. 

This function is provided by the `$export` operation that implements the FHIR Bulk Data Access specification ([https://hl7.org/fhir/uv/bulkdata/](https://hl7.org/fhir/uv/bulkdata/)) bulk export pattern.

#### Extract types and scheduling

The Health Connect Provider Directory supports two primary extract variations:

1. **Snapshot Extracts** - Large snapshots based on the supplied criteria
2. **Delta Updates** - Incremental changes since a particular time

Both extract types are ad-hoc and can be initiated at any time.

**The following four key sub-functions are supported:**

* Initiate a batch export - refer to the [Batch Export Request Submission](BatchRequestSubmission.html) page
* Polling requests to retrieve the status of the batch export - refer to the [Batch Export Request Status](BatchRequestStatus.html) page
* Retrieval requests to retrieve the results of the batch export - refer to the [Batch Export Retrieve Results](BatchRequestResults.html) page
* Cancellation requests to cancel a batch export request - refer to the [Batch Export Request Delete](BatchRequestDelete.html) page

### Primary extraction approaches

The Health Connect Provider Directory supports extraction approaches using standard FHIR bulk data parameters:

#### 1. Snapshot and delta extracts
- **Primary Filter**: Resource type selection using `_type` and filtering using `_typeFilter`
- **Use Cases**: Data synchronization and replication for local systems
- **Key Parameters**: `_type`, `_typeFilter`, `_since`

#### 2. Geographical centric extraction
- **Primary Filter**: Location-based filtering using `_typeFilter`
- **Use Cases**: Regional health planning, local referral networks, proximity-based service discovery
- **Key Parameters**: `_typeFilter=Location?address-state=[STATE]`, `_typeFilter=Location?near=[LAT]|[LNG]|[DISTANCE]`

#### 3. Organization centric extraction
- **Primary Filter**: Organization identifier or name filtering
- **Use Cases**: Organizational data synchronization, corporate structure analysis
- **Key Parameters**: `_typeFilter=Organization?identifier=[SYSTEM]|[VALUE]`, `_typeFilter=Organization?name=[NAME]`

#### 4. Service-Type centric extraction
- **Primary Filter**: Healthcare service type filtering
- **Use Cases**: Service-specific planning, specialist network analysis
- **Key Parameters**: `_typeFilter=HealthcareService?service-type=[SYSTEM]|[CODE]`

*Note: Multiple `_typeFilter` parameters can be combined for complex filtering scenarios*

