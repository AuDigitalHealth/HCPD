### Overview

This page describes step 1 of the Asynchronous Bulk Data Export Process Workflow - the 'kick off request' pattern - for requesting Health Connect Provider Directory resources.

<div style="padding: 1em; border-top: 1px solid #ddd;">
  <figure>
    {% include AsyncBatchExportActivityDiagramSubmit.svg %}
  </figure>
</div>

Request submissions have four key components:

1. Preconditions
2. Request to server
3. Responses from server
4. Follow-up actions

### Preconditions

The client **SHALL** ensure that all individual export queries are structured correctly inside of a `Parameters` resource with a corresponding `_typeFilter` for each resource type. This requirement is enforced by invariant `hcpd-exp-1` in the [HCPD Export Request Parameters profile](StructureDefinition-hcpd-export-request-parameters.html). 

### Request to server

#### HTTP Method

The request **SHALL** include specific headers and a Parameters resource in the body.

#### Request headers

- Required: `Prefer: respond-async` - indicates that the server should process the request asynchronously
- Optional: `Accept: application/fhir+json` - specifies the format of the optional `OperationOutcome` response

#### Request body parameters

The batch export request uses a FHIR Parameters resource in the request body to specify export parameters. The Parameters resource **SHALL** conform to the [HCPD Export Request Parameters profile](StructureDefinition-hcpd-export-request-parameters.html). This profile ensures consistent parameter combinations and proper encoding of multiple `_typeFilter` values.

#### Geographical scope options

The Health Connect Provider Directory supports bulk data extraction with geographical filtering using standard FHIR `_typeFilter` parameters:

- **State-based extraction** - Filter by state using `_typeFilter=Location?address-state=[STATE]`
- **Postcode-based extraction** - Filter by postcode using `_typeFilter=Location?address-postalcode=[POSTCODE]`
- **National extraction** - Complete Australia-wide dataset (no geographical filters)
- **Proximity-based extraction** - Resources within specified distance using `_typeFilter=Location?near=[LAT]|[LNG]|[DISTANCE]`
- **City/suburb filtering** - Filter by locality using `_typeFilter=Location?address-city=[CITY]`

*Note: Geographical filtering is applied through Location resources, with related resources (Organizations, Practitioners, etc.) included through FHIR relationship traversal.*

#### Organisation centric extraction

Bulk extraction focused on retrieving organizational data using standard FHIR identifier searches:

- **Organisation identification** - Filter organizations using `_typeFilter=Organization?identifier=[SYSTEM]|[VALUE]`:
  - HPI-O: `identifier=http://ns.electronichealth.net.au/id/hi/hpio/1.0|[HPIO]`
  - ABN: `identifier=http://hl7.org.au/id/abn|[ABN]`
  - ACN: `identifier=http://hl7.org.au/id/acn|[ACN]`
- **Organisation name filtering** - Filter by name using `_typeFilter=Organization?name=[NAME]`
- **Complete relationship mapping** - Use FHIR `_include` and `_revinclude` parameters to retrieve:
  - Related Locations, HealthcareServices, PractitionerRoles
  - Associated Practitioners and Endpoints

*Note: For complete organizational ecosystems, combine organization filtering with appropriate `_include` parameters in subsequent queries.*

#### Healthcare service type-centric extraction

Bulk extraction focused on specific healthcare services using standard FHIR service type filtering:

- **SNOMED-CT-AU service type filtering** - Filter services using `_typeFilter=HealthcareService?service-type=[SYSTEM]|[CODE]`
- **Combined filtering approaches** - Use multiple `_typeFilter` parameters to combine service types with geographical constraints
- **Service ecosystem mapping** - Use FHIR `_include` and `_revinclude` parameters to retrieve:
  - Organizations providing the service type
  - Locations where services are delivered
  - PractitionerRoles and Practitioners facilitating the services
  - Endpoints associated with service delivery

##### Supported filtering approaches

**Geographical Filtering:**
- Use `_typeFilter=Location?address-state=[state]` for state-based filtering
- Use `_typeFilter=Location?address-postalcode=[postcode]` for postcode filtering  
- Use `_typeFilter=Location?near=[lat]|[lng]|[distance]` for proximity-based filtering

**Organization-Based Filtering:**
- Use `_typeFilter=Organization?identifier=[system]|[value]` for organization identifier filtering
- Use `_typeFilter=Organization?name=[name]` for organization name filtering

**Service Type Filtering:**
- Use `_typeFilter=HealthcareService?type=[code]` for service type filtering

For detailed descriptions of all parameters and their usage, see the [HCPD Export Request Parameters profile](StructureDefinition-hcpd-export-request-parameters.html).

#### Examples

The examples below illustrate how Provider Directory bulk export requests can be constructed using a POST request along with the `_type` and `_typeFilter` parameters. 

##### Example 1 - Export all cardiology services in Balmain

Export Provider Directory resources relevant to Cardiology Services in Balmain, including organisations, locations, services, roles and practitioners.

```
POST [base_url]/$export
Content-Type: application/fhir+json
Prefer: respond-async
Accept: application/fhir+json

{
    "resourceType": "Parameters",
    "meta": {
        "profile": ["http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-request-parameters"]
    },
    "parameter": [
        {
            "name": "_outputFormat",
            "valueString": "application/fhir+ndjson"
        },
        {
            "name": "_type",
            "valueString": "Location,HealthcareService,Organization,PractitionerRole,Practitioner"
        },
        {
            "name": "_typeFilter",
            "valueString": "Location?address-city=Balmain&address-postalcode=2041&near=-33.8607|151.1803|100"
        },
        {
            "name": "_typeFilter",
            "valueString": "HealthcareService?service-type=http://snomed.info/sct|789718008&location.address-city=Balmain&location.address-postalcode=2041"
        },
        {
            "name": "_typeFilter",
            "valueString": "Organization?_has:HealthcareService:organization:service-type=http://snomed.info/sct|789718008"
        },
        {
            "name": "_typeFilter",
            "valueString": "PractitionerRole?location.address-city=Balmain&location.address-postalcode=2041"
        },
        {
            "name": "_typeFilter",
            "valueString": "Practitioner?_has:PractitionerRole:practitioner:location.address-city=Balmain"
        }
    ]
}
```

##### Example 2 - delta export since last retrieval

Export changes since a prior export. The Bulk Data IG defines the `_since` parameter and uses the standard lastUpdated field on resources to find changes.

```
POST [base]/$export
Content-Type: application/fhir+json
Prefer: respond-async
Accept: application/fhir+json

{
    "resourceType": "Parameters",
    "meta": {
        "profile": ["http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-request-parameters"]
    },
    "parameter": [
        {
            "name": "_outputFormat",
            "valueString": "application/fhir+ndjson"
        },
        {
            "name": "_type",
            "valueString": "Organization,Location,HealthcareService,Practitioner,PractitionerRole,Endpoint,Provenance"
        },
        {
            "name": "_typeFilter",
            "valueString": "HealthcareService?service-type=http://snomed.info/sct|789718008&location.address-city=Balmain&location.address-postalcode=2041"
        },
        {
            "name": "_typeFilter",
            "valueString": "Location?address-city=Balmain&address-postalcode=2041&near=-33.8607|151.1803|100"
        },
        {
            "name": "_typeFilter",
            "valueString": "Organization?_has:HealthcareService:organization:service-type=http://snomed.info/sct|789718008"
        },
        {
            "name": "_typeFilter",
            "valueString": "PractitionerRole?location.address-city=Balmain&location.address-postalcode=2041"
        },
        {
            "name": "_typeFilter",
            "valueString": "Practitioner?_has:PractitionerRole:practitioner:location.address-city=Balmain"
        },
        {
            "name": "_since",
            "valueInstant": "2025-02-01T00:00:00Z"
        }
    ]
}
```

##### Example 3: proximity-based extract

Request for resources within 25km of Parramatta (-33.8136,150.9996):

```
POST [base]/$export
Content-Type: application/fhir+json
Prefer: respond-async
Accept: application/fhir+json

{
    "resourceType": "Parameters",
    "meta": {
        "profile": ["http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-request-parameters"]
    },
    "parameter": [
        {
            "name": "_outputFormat",
            "valueString": "application/fhir+ndjson"
        },
        {
            "name": "_type",
            "valueString": "Location"
        },
        {
            "name": "_typeFilter",
            "valueString": "Location?near=-33.8136|150.9996|25"
        }
    ]
}
```
##### Example 4: organization-centric extract by HPI-O

Request for organizations matching specific HPI-O identifier:

```
POST [base]/$export
Content-Type: application/fhir+json
Prefer: respond-async
Accept: application/fhir+json

{
    "resourceType": "Parameters",
    "meta": {
        "profile": ["http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-request-parameters"]
    },
    "parameter": [
        {
            "name": "_outputFormat",
            "valueString": "application/fhir+ndjson"
        },
        {
            "name": "_type",
            "valueString": "Organization"
        },
        {
            "name": "_typeFilter",
            "valueString": "Organization?identifier=8003626566707032"
        }
    ]
}
```

##### Example 5: organization-centric extract by ABN

Request for organizations matching ABN:

```
POST [base]/$export
Content-Type: application/fhir+json
Prefer: respond-async
Accept: application/fhir+json

{
    "resourceType": "Parameters",
    "meta": {
        "profile": ["http://digitalhealth.gov.au/fhir/hcpd/StructureDefinition/hcpd-export-request-parameters"]
    },
    "parameter": [
        {
            "name": "_outputFormat",
            "valueString": "application/fhir+ndjson"
        },
        {
            "name": "_type",
            "valueString": "Organization"
        },
        {
            "name": "_typeFilter",
            "valueString": "Organization?identifier=41824753556"
        }
    ]
}
```

### Responses from server

#### Success response

The server responds with a `202 Accepted` status code and a `Content-Location` header indicating the absolute URL to poll for status updates, using the unique job ID assigned to the batch request.

Response HTTP header example:

```
HTTP/1.1 202 Accepted
content-location: https://fhir-xrp.digitalhealth.gov.au/fhir/$export-poll-status?_jobId=c9b1cfe7-ce25-4269-a07c-76cc6e745fb5
```

Response HTTP body: absent

### Follow-up actions

Once submitted successfully, there are two possible follow-up actions:

#### Polling for status

Clients can poll the status of the request using the returned `_jobId=[value]`.

For full details, refer to the [Batch Request Status](BatchRequestStatus.html) page.

#### Deleting a request

Clients can delete a batch request by sending a `DELETE` request to the URL provided in the `Content-Location` header.

For full details, refer to the [Batch Request Delete](BatchRequestDelete.html) page.
