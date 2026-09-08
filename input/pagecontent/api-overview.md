### Overview

The Health Connect Australia Provider Directory (the Directory) API gives FHIR-based access to provider and organisation directory data. Clients can search it, read individual records, and export in bulk.

This API is the national implementation of the Health Connect Australia Provider Directory FHIR Implementation Guide.

This specification defines how clients interact with the APIs in practice, focusing on supported operations, validation rules, and operational requirements for integration. The Health Connect Australia Provider Directory FHIR IG remains the normative source of truth for resource structure and semantics.

Detailed behaviour for each capability is described on its own page:

- [Search API technical specification](search-api.html) - real-time search and read behaviour. Use the Search API for targeted, real-time queries and interactive lookups.
- [Export API technical specification](export-api.html) - asynchronous bulk data export behaviour. Use the Export API for large-scale extracts and local data synchronisation.

### API features and capabilities

The public API does two things: real-time search and read, and asynchronous bulk export.

Search locates practitioners, organisations, services and the resources linked to them, using standard FHIR search parameters with paging and filtering.

Export returns large datasets asynchronously through the FHIR Bulk Data Access `$export` pattern, for clients keeping a local copy of the directory.

### Supported resources

The public API provides access to the following FHIR resources:

- `Organization`
- `Practitioner`
- `PractitionerRole`
- `HealthcareService`
- `Location`
- `Endpoint`
- `Provenance`

All resources conform to Health Connect Australia Provider Directory FHIR profiles, including constraints on structure, cardinality, search parameters, and terminology. For the profiles, extensions, search parameters and terminology that apply to each resource type, see the [Implementation Guide home page](index.html).

#### Elements not supported by the service

The API will not store or return the following `Practitioner` elements. This differs from the FHIR IG, which permits them.

| Element | Cardinality in profile | Search behaviour |
|---|---|---|
| Gender identity | 0..* | Search parameter rejected |
| Gender | 0..1 | Search parameter rejected |
| Birth date | 0..1 | No search parameter |
| Photo | 0..* | No search parameter |
| Address | 0..* | Search parameter rejected |
| PBS prescriber number | 1..* | Search parameter rejected |

A create or update carrying one of these elements still succeeds; the element is stripped before the resource is persisted and is never present in a read or search response. A rejected search parameter is rejected in a forward or reverse chain too. See [Restricted search parameters](search-api.html#restricted-search-parameters).

Use `rsg` in place of gender and gender identity. See the [Practitioner's Recorded Sex or Gender](SearchParameter-practitioner-rsg.html) search parameter.

The PBS prescriber number is identified by the system `http://ns.electronichealth.net.au/id/medicare-prescriber-number`.

### Environments and base URLs

| Environment | Base URL | Usage |
|---|---|---|
| SVT | `https://svt.healthconnect.digitalhealth.gov.au/api/v1/fhir` | Production-like data and performance testing. |
| PROD | `https://healthconnect.digitalhealth.gov.au/api/v1/fhir` | Live environment (post-conformance). |

Environment access is arranged as part of client onboarding.

#### Endpoint path convention

All examples in these API pages are path-only and are relative to the environment base URL above.

Example:

- Full URL: `https://healthconnect.digitalhealth.gov.au/api/v1/fhir/Organization?name=clinic`
- Path-only form used in examples: `/Organization?name=clinic`

### Authentication and authorisation

All API requests must include a valid OAuth2 bearer token (JWT) issued by the Health Connect Authorisation Service (HCAS), presented as `Authorization: Bearer <jwt>`.

#### Required scopes by operation

Clients are not required to present all scopes on every request. The required scope is operation-specific:

| Operation | Required scope |
|---|---|
| Search operations | `search` |
| Read operations | `read` |
| Export kickoff, polling, and file download operations | `export` |

Presenting a token without the scope required for an operation results in `403 Forbidden`.

Authentication example:

```http
GET /Organization?identifier=8003626566707032
Authorization: Bearer <jwt>
X-Request-ID: 6f0d0f2e-3e42-4a43-986a-a4ecba0ab7e4
Accept: application/fhir+json
```

#### Client registration and token issuance

*To be updated.*

Registration, token issuance, token lifetime and renewal, and authorisation error conditions are covered in a separate HCAS document. This page will link to it once it is published.

### Record status

A record is either active or inactive. `Practitioner`, `PractitionerRole`, `Organization` and `HealthcareService` carry a boolean `active`; `Location` and `Endpoint` carry `status`.

Search returns active records by default. Inactive records are returned only when the state is asked for explicitly. See [Data visibility rules for search](search-api.html#data-visibility-rules-for-search) for the permitted values on each type and how to request them.

Records may be suppressed by the upstream systems. Suppressed records are never returned in any search. Their status updates are included in incremental exports so that client systems can remove them locally. See [Visibility rules for export](export-api.html#visibility-rules-for-export).

### Error handling

All errors are returned as a FHIR `OperationOutcome`. Every `OperationOutcome` also carries the request correlation identifier as an additional informational issue, so that a client-side failure can be correlated with server-side logs for traceability.

```json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "severity": "error",
      "code": "invalid",
      "diagnostics": "some error message here"
    },
    {
      "severity": "information",
      "code": "informational",
      "diagnostics": "X-Request-ID: 9c63ec77-8d78-4bf1-a170-9909b33a786b"
    }
  ]
}
```

#### HTTP status mapping

| HTTP | Meaning | Typical cause |
|---|---|---|
| 400 | Bad Request | Invalid FHIR query or parameters; restricted search parameter; paging beyond the result threshold |
| 401 | Unauthorized | Missing or invalid token |
| 403 | Forbidden | Missing required scope; policy restriction; unsupported resource type in an export request |
| 404 | Not Found | Resource not found or not visible |
| 409 | Conflict | Duplicate or inconsistent data |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Server Error | Internal system failure |
| 503 | Service Unavailable | Temporary system outage |

Note that an empty search result is **not** an error. A search that matches nothing returns `200 OK` with a `Bundle` of `total: 0`. See [No matching records](search-api.html#no-matching-records).

#### Rate limits

*To be updated.*

Request rate limits and per-client quotas returning `429 Too Many Requests`, and the backoff behaviour expected of a client. One limit is already defined: export status polling is limited to one request per status endpoint every 120 seconds - see [Polling and completion](export-api.html#polling-and-completion).

### Glossary

| Term | Definition |
|---|---|
| Active record | A record whose `active` element is `true` (or, for `Location` and `Endpoint`, whose `status` is `active`). Returned by default in search results and standard exports. |
| Inactive record | A record whose `active` element is `false` (or, for `Location`, `status = inactive`; for `Endpoint`, `status = off`). Excluded from default search results and standard exports, and retrievable by explicitly requesting the inactive state. |
| Suppressed record | A record excluded from outward visibility. Suppressed records cannot be searched or returned through the Search API. Their status updates are included in incremental exports so client systems can remove them locally. |
| HCAS | Health Connect Authorisation Service. |
| HI Service | Healthcare Identifiers Service. |
| HPI-I | Healthcare Provider Identifier - Individual. |
| HPI-O | Healthcare Provider Identifier - Organisation. |
| PCA | Provider Connect Australia. |
| RSG | Recorded Sex or Gender. |
