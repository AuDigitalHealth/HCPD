### Overview

The Export API provides asynchronous bulk data extraction for large-scale synchronisation use cases, based on the [FHIR Bulk Data Access specification](http://hl7.org/fhir/uv/bulkdata/).

This operation uses the FHIR asynchronous request pattern and is exposed through the `$export` operation.

The export lifecycle is:

1. Kickoff request.
2. Polling for completion.
3. Download of generated files.

A request may also be cancelled at any point. Step-by-step guidance for each stage is on the [Bulk Data Extraction](bulk-data-extraction.html) page and its sub-pages; this page states the service-level rules and constraints that apply across them.

All examples on this page are path-only and relative to the environment base URL. See [Endpoint path convention](api-overview.html#endpoint-path-convention).

### Standard and incremental export

The Export API supports two distinct modes, selected by the presence or absence of the `_since` parameter. They serve different purposes and return different data.

| | Standard export | Incremental export |
|---|---|---|
| Request | `$export` **without** `_since` | `$export` **with** `_since` |
| Purpose | Establish a local copy of the directory, or refresh one wholesale | Keep an existing local copy in step with the Directory |
| Returns | A point-in-time snapshot of records matching the query | Every record matching the query that has changed since the supplied instant |
| Record states included | Active and non-suppressed only | **All states** - active, inactive, suppressed and non-suppressed |
| Typical use | Initial load; periodic full rebuild | Scheduled synchronisation between full loads |

#### Standard export - establishing a local copy

A standard export is the initial-load mechanism. It returns the records that a client would see through the Search API for the same criteria, so the resulting local copy contains only records that are currently discoverable.

Use a standard export when first populating a local directory, or when rebuilding it from scratch.

#### Incremental export - keeping a local copy current

An incremental export answers the question *"what has changed since I last synchronised?"*. Supply `_since` with the instant of your previous successful export, and the response contains every matching record modified since then.

An incremental export includes records that have become **inactive** or **suppressed**, which a standard export cannot convey. The delta covers:

- Records newly created since the supplied instant.
- Records whose content has been updated.
- Records that have become inactive, carrying their current `active` or `status` value.
- Records that have become suppressed, carrying the `suppressed` extension.

#### What a client does with a delta

On receiving an incremental export, a client system reconciles each returned record against its local copy:

| Record arrives as | Client action |
|---|---|
| New, active, not suppressed | Insert |
| Existing, content changed | Update in place |
| Inactive | Mark the local record inactive, or remove it, according to local policy |
| Suppressed | Remove the record from the local dataset, or hide it from all end-user surfaces |

#### Setting `_since` for incremental synchronisation

Set `_since` to the date of the last request, so that content is not missed. The value to use is the `transactionTime` returned on the manifest of the previous successful export, which is the point the Directory records the delta as having been taken.

Setting `_since` slightly earlier than the previous `transactionTime` is also safe. Each record is keyed by its resource id, so re-applying a record is idempotent: an overlap costs a marginally larger delta, whereas a gap loses records without any error being raised.

Advance the stored value only once every output file has been downloaded **and** applied to the local dataset. A client that advances it on kickoff, or on receipt of the manifest, loses every record in that delta if the download or apply then fails, because the next request asks only for changes after that point.

If an export fails, establish why before re-running it. Failed jobs are not resumable, so a re-run starts from scratch with the same `_since` value.

Run one export at a time per dataset. Concurrent incremental exports over the same data produce interleaved manifests with no single safe point to advance to.

Download output files before they expire. Files remain retrievable for the period indicated by the `Expires` header where one is present, and a `_since` window that can no longer be retrieved can only be recovered by running a standard export.

Clients should also run a standard export periodically, alongside any incremental cadence, to re-baseline against drift accumulated through missed or partially applied deltas.

Do not use the Search API for bulk synchronisation. A search result set is trimmed to the first 150 matching records - see [Count and result set limits](search-api.html#count-and-result-set-limits) - so a client relying on `_lastUpdated` diverges without any error being raised.

#### Synchronisation cadence

Clients choose their own cadence, bounded by two things.

Directory records are derived from the HI Service and PCA rather than maintained in the Directory itself - see [Record status](api-overview.html#record-status). Synchronising more often than those sources propagate changes returns empty or near-empty deltas.

An incremental export is asynchronous: kickoff, then polling, then file download. Status polling is rate limited to one request per status endpoint every 120 seconds, so even a job that completes immediately cannot be observed as complete for up to two minutes. Sub-minute synchronisation is therefore not achievable through the Export API. Where a client needs near-real-time information about a specific provider, that is a Search API use case rather than an export one.

### Required headers for export kickoff

Kickoff requests require:

- `Authorization: Bearer <jwt>`
- `Content-Type: application/fhir+json`
- `Accept: application/fhir+json`
- `Prefer: respond-async`

`X-Request-ID: <uuid>` is optional but recommended, and behaves exactly as it does on the Search API. See [Required headers for search and read](search-api.html#required-headers-for-search-and-read).

### Export lifecycle

An export begins with `POST [base]/$export` using a FHIR `Parameters` resource that conforms to the [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) profile.

Every resource type listed in `_type` must be covered by at least one `_typeFilter`, and each `_typeFilter` must be supplied as a separate parameter entry. A single `_typeFilter` value cannot cover more than one resource type.

Nothing in the request requires those filters to be related to one another. An export naming `HealthcareService`, `Organization`, and `Practitioner` could just as easily return services of one type, organisations in New South Wales, and practitioners named Fred - three unrelated sets of records in the same output. To extract a meaningful export, link the filters together using chained and reverse-chained (`_has:`) parameters so that each type is constrained by the same criteria, as in the example below.

Kickoff example:

```http
POST /$export
Authorization: Bearer <jwt>
Prefer: respond-async
Content-Type: application/fhir+json
Accept: application/fhir+json
X-Request-ID: 6f0d0f2e-3e42-4a43-986a-a4ecba0ab7e4
```

```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "_outputFormat",
      "valueString": "application/fhir+ndjson"
    },
    {
      "name": "_type",
      "valueString": "HealthcareService,Organization,Practitioner"
    },
    {
      "name": "_typeFilter",
      "valueString": "HealthcareService?service-type=http://snomed.info/sct|789718008&location.address-city=Balmain"
    },
    {
      "name": "_typeFilter",
      "valueString": "Organization?_has:HealthcareService:organization:service-type=http://snomed.info/sct|789718008"
    },
    {
      "name": "_typeFilter",
      "valueString": "Practitioner?_has:PractitionerRole:practitioner:location.address-city=Balmain"
    },
    {
      "name": "_since",
      "valueInstant": "2026-01-01T00:00:00Z"
    }
  ]
}
```

Further worked examples - geographical, organisation-centric, service-type-centric, and delta extracts - are on the [Batch Export Request Submission](BatchRequestSubmission.html) page.

### Request and response constraints

#### Transport rules

- Kickoff method is `POST` only. `GET` kickoff is not supported.
- Query parameters are not supported on kickoff. All parameters must be supplied in the `Parameters` body.

#### Request body

The body **SHALL** be a FHIR `Parameters` resource conforming to the [HCPD Export Request Parameters](StructureDefinition-hcpd-export-request-parameters.html) profile.

A body that is missing, empty, unparseable as FHIR, or a FHIR resource of any type other than `Parameters` is rejected with `400 Bad Request` and an `OperationOutcome` of type `invalid`.

#### Parameter rules

| Parameter | Cardinality | Value type | Rule |
|---|---|---|---|
| `_outputFormat` | 1..1 | `valueString` | Mandatory, and must be `application/fhir+ndjson`, matched case-insensitively. Omitting it, or supplying any other value, is rejected. |
| `_type` | 1..* | `valueString` | Mandatory. Comma-separated list of resource types; may appear more than once. |
| `_typeFilter` | 1..* | `valueString` | Mandatory. Exactly one entry per resource type named in `_type`. |
| `_since` | 0..1 | `valueInstant` | Optional, and must be a valid FHIR instant with full date, time, and timezone - `2025-02-01T00:00:00Z`. A date alone such as `2025-02-01` is rejected. |

Only the resource types published in this IG may be exported: `HealthcareService`, `Organization`, `Location`, `PractitionerRole`, `Practitioner`, `Provenance`, and `Endpoint`. See [Supported resources](api-overview.html#supported-resources).

Every type named in `_type`, and every type targeted by a `_typeFilter`, **SHALL** be one of these. Any other resource type - or a value that is not a resource type at all - is rejected with `403 Forbidden` and an `OperationOutcome` of type `not-supported`. Note that this is the one export validation failure that is **not** a `400`.

#### `_type` and `_typeFilter` reconciliation

- Every resource type named in `_type` **SHALL** have an accompanying `_typeFilter` whose query targets that type - `_type` of `Organization` requires a `_typeFilter` of the form `Organization?...`.
- Every `_typeFilter` **SHALL** target a resource type that appears in `_type`.
- A resource type **MAY** be targeted by more than one `_typeFilter`. Each is applied independently and the results are combined, so `Organization?name=Acme` and `Organization?name=Beta` in the same request return both sets.

Each `_typeFilter` query is validated as though it were a search on that resource type, so the [substantive parameter rule](search-api.html#substantive-search-parameter-required), the [restricted search parameters](search-api.html#restricted-search-parameters) and the rule that `suppressed` may not be client-supplied all apply inside a `_typeFilter`. This validation happens **before** any `_since` state-stripping is applied, so supplying `_since` does not exempt a `_typeFilter` from needing a substantive parameter.

Failures in this group are rejected with `400 Bad Request` and an `OperationOutcome` of type `invalid`.

#### Relationship traversal is not available in an export

`_include`, `_include:iterate`, `_revinclude`, and `_revinclude:iterate` are **not supported inside a `_typeFilter`** and **SHALL NOT** be used in an export request. A `_typeFilter` selects instances of its own resource type only; it cannot pull in related resources.

This differs from the Search API, where `_include` and `_revinclude` are supported subject to CapabilityStatement validation.

To retrieve a related set of resources in one export, name **each** resource type in `_type` and give **each** its own `_typeFilter`, using chained and reverse-chained search parameters to express the relationship. Where the search API would use an include, an export uses a reverse chain on the related type.

For example, the following retrieves practitioner roles at locations in Balmain together with the practitioners who hold them:

```json
{
  "name": "_type",
  "valueString": "PractitionerRole,Practitioner"
}
```

```json
{
  "name": "_typeFilter",
  "valueString": "PractitionerRole?location.address-city=Balmain"
}
```

```json
{
  "name": "_typeFilter",
  "valueString": "Practitioner?_has:PractitionerRole:practitioner:location.address-city=Balmain"
}
```

Both types are then present in the output files, each in its own NDJSON file, and the client reassembles the graph locally using the references already carried on the resources.

### Polling and completion

On successful kickoff, the API returns `202 Accepted` with a `Content-Location` header carrying the absolute status URL, including the job ID assigned to the request.

```http
HTTP/1.1 202 Accepted
Content-Location: https://healthconnect.digitalhealth.gov.au/api/v1/fhir/$export-poll-status?_jobId=fa194ab1-ecda-4c38-a789-05a3739cbdbe
```

Poll that URL to get status updates.

#### Status responses

| Status | Meaning | Notes |
|---|---|---|
| `202 Accepted` | Job is still in progress. | Body absent. Carries `Retry-After` and `X-Progress` headers. |
| `200 OK` | Job is complete. | Body is the completion manifest. |
| `400 Bad Request` | Request rejected. | Body is an `OperationOutcome`. |
| `404 Not Found` | Job ID is unknown, or the request has been cancelled. | Polls following a successful `DELETE` return `404`. |

While the job is running the server includes:

- `Retry-After` (integer) - the number of seconds to wait before polling again. Polling is rate limited to one request per status endpoint every 120 seconds, so clients should honour this header rather than polling on a fixed interval.
- `X-Progress` (string) - a human-readable progress message, which clients may parse, display, or log.

```http
HTTP/1.1 202 Accepted
Retry-After: 120
X-Progress: Search in progress - found 954 of 1,000 resources
```

On completion you receive a JSON manifest containing links to the exported files.

```json
{
  "transactionTime": "2026-02-19T10:27:53.423+11:00",
  "request": "https://healthconnect.digitalhealth.gov.au/api/v1/fhir/$export",
  "requiresAccessToken": true,
  "output": [
    {
      "type": "Organization",
      "url": "https://healthconnect.digitalhealth.gov.au/api/v1/fhir/Binary/fnQjLPLp7x3VpEAsJd4mZ9Fz5mLbZWkY"
    }
  ],
  "error": []
}
```

Where a job completes but matches no data, the manifest returns empty `output` and `error` arrays together with a `message` describing the outcome.

For the full request, response, and follow-up detail see [Batch Export Request Status](BatchRequestStatus.html).

### Cancelling an export

A client may cancel an in-flight request by sending `DELETE` to the same status URL returned in `Content-Location`.

```http
DELETE /$export-poll-status?_jobId=a5a60ba8-5bdc-4d2d-a7ef-13f905205b01
Authorization: Bearer <jwt>
X-Request-ID: 1f0f0d7a-6d2c-4a71-9a55-2f4b8c1de930
```

The server responds `202 Accepted` with no body. Subsequent polls to that URL return `404 Not Found`. A rejected cancellation returns `400 Bad Request` with an `OperationOutcome`. See [Batch Export Request Delete](BatchRequestDelete.html).

### Retrieving export files

The final part of the export is the `/Binary/{id}` request. Each entry in the completion manifest `output` array is retrieved individually, using the URL supplied by the server.

The response format is controlled by the `Accept` header, which may be either `application/fhir+json` or `application/fhir+ndjson`:

| `Accept` header | Response |
|---|---|
| `application/fhir+ndjson` | The NDJSON content is returned directly. |
| `application/fhir+json` | A FHIR `Binary` resource is returned, with the NDJSON content Base64-encoded in `Binary.data`. |

Requesting NDJSON directly:

```http
GET /Binary/fnQjLPLp7x3VpEAsJd4mZ9Fz5mLbZWkY
Authorization: Bearer <jwt>
Accept: application/fhir+ndjson
X-Request-ID: c29ed8dc-404f-49f7-9c2e-b69f6d98954c
```

Requesting the content wrapped in a FHIR `Binary` resource:

```http
GET /Binary/fnQjLPLp7x3VpEAsJd4mZ9Fz5mLbZWkY
Authorization: Bearer <jwt>
Accept: application/fhir+json
X-Request-ID: c29ed8dc-404f-49f7-9c2e-b69f6d98954c
```

Output files are NDJSON, one FHIR resource per line, with one or more files per resource type. Files remain available for the period indicated by the `Expires` header where one is present. See [Batch Export Retrieve Results](BatchRequestResults.html).

### Visibility rules for export

What an export returns depends on whether `_since` is supplied. See [Standard and incremental export](#standard-and-incremental-export) for the purpose of each mode.

#### 1. Standard export

A standard `$export` operation returns **only active and non-suppressed records**.

- Inactive records are excluded.
- Suppressed records are excluded.

This matches what the same query would return through the Search API.

#### 2. Incremental export using `_since`

To support ongoing synchronisation and data refresh, an `$export` request that includes `_since` returns all records updated since the specified date, including records that have become inactive or suppressed.

State filtering is switched off entirely for an incremental export. Any client-supplied state constraint is discarded rather than honoured - a `_typeFilter` of `Practitioner?family=Smith&active=false` alongside a `_since` has its `active=false` removed. The `_since` parameter itself is preserved so the time window still applies.

| Export | Returned |
|---|---|
| Without `_since` | Active, non-suppressed only |
| With `_since` | Active, inactive, suppressed and non-suppressed alike |

#### 3. Why inactive and suppressed records are included in incremental exports

`_since` returns all records so that a client holds the full set and can remove records as applicable. Without this, a withdrawn record would simply stop appearing, which is indistinguishable from it never having matched.

Client Requester Actors synchronising a local directory **SHALL** apply suppression filtering to the results before presenting any data to end users.

#### 4. Identifying a suppressed record in the output

Suppression is expressed by the presence of an extension, not by a boolean value. There is no `true` / `false` flag to test:

| State | Representation |
|---|---|
| Not suppressed | The `suppressed` extension is absent from the resource. |
| Suppressed | The `suppressed` extension is present, carrying a `suppressedBy` code identifying whether the practitioner or the organisation initiated the request. |

`Organization` is the exception. An organisation's `suppressed` extension may carry an `includeSelf` sub-extension:

| `includeSelf` | Effect |
|---|---|
| `true` | The organisation itself is suppressed, and suppression cascades to its locations, services, practitioner roles and endpoints. |
| `false` (or absent) | The organisation itself remains visible; suppression applies only to its linked records. The extension is present as a propagation marker. |

Clients **SHALL NOT** infer from an organisation returning no related records that the organisation has no services.

### Unsupported operations

The following are not supported by the Export API:

- `GET` kickoff - see [Transport rules](#transport-rules).
- Kickoff query parameters - all parameters go in the `Parameters` body.
- `_include`, `_include:iterate`, `_revinclude`, and `_revinclude:iterate` inside a `_typeFilter` - see [Relationship traversal is not available in an export](#relationship-traversal-is-not-available-in-an-export).
