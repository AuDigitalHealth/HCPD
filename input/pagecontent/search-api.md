### Overview

The Search API provides real-time access to directory data using standard FHIR search semantics.

Clients may:

- Search across supported resource types.
- Read individual resources by ID.
- Navigate paginated results using server-issued tokens.

All examples on this page are path-only and relative to the environment base URL. See [Endpoint path convention](api-overview.html#endpoint-path-convention).

### Required headers for search and read

Search and read interactions require:

- `Authorization: Bearer <jwt>`
- `Accept: application/fhir+json`

The API only returns JSON. `application/fhir+json` is the only accepted MIME type; XML is not supported.

`X-Request-ID: <uuid>` is optional but recommended. Where supplied it must be a valid UUID and unique per request; where it is not supplied the service generates one.

The same value is returned in the response header and, where an `OperationOutcome` is returned, as an issue with code `information`. See [Error handling](api-overview.html#error-handling).

### Query behaviour and validation

#### Substantive search parameter required

A search must include at least one **substantive** search parameter carrying a non-empty value. A substantive parameter is one that is neither a FHIR system / result-modifier parameter nor a state filter.

- `active` and `status` are **state filters**. They are accepted and drive visibility filtering, but they do not count as substantive, so a search containing only state parameters is rejected.
- `_id`, `_lastUpdated`, and reverse-chain (`_has:`) parameters **do** count as substantive.
- `suppressed` may **not** be supplied by a client at all. See [Search parameters that are not permitted](#search-parameters-that-are-not-permitted).

A search with no substantive parameter is rejected with `400 Bad Request` and an `OperationOutcome` of type `invalid`.

```http
GET /Practitioner?_count=10
```

```json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "code": "invalid",
      "diagnostics": "At least one non-state search parameter with a non-empty value must be provided"
    }
  ]
}
```

#### Underscore-prefixed parameters

Any underscore-prefixed parameter that is not a recognised FHIR system or result-modifier parameter, not a reverse-chain (`_has:`) parameter, and not one of the always-allowed standalone parameters (`_id`, `_lastUpdated`) is rejected with `400 Bad Request` and an `OperationOutcome` of type `invalid`.

#### Parameters the service defaults

Where a client supplies these parameters the supplied value is used. Where a client does not supply them, the service applies a default.

| Parameter | Supplied by the client | Not supplied |
|---|---|---|
| `_total` | `none` or `estimate` is respected | `_total=accurate` is applied, so `Bundle.total` is an accurate count rather than an estimate |
| `_sort` | The requested sort order is used | A default sort is applied, depending on the resource type. See [Sorting](#sorting) |

### Paging behaviour

Paging follows [standard FHIR paging](https://hl7.org/fhir/R4/search.html#pagesize). Clients follow `Bundle.link.next` and `Bundle.link.previous` rather than reconstructing paging URLs.

```http
GET /?_getpages=<value from Bundle.link>
Authorization: Bearer <jwt>
Accept: application/fhir+json
```

#### Count and result set limits

| Limit | Value |
|---|---|
| Maximum records per page (`_count`) | 30 |
| Maximum records returned in a result set | 150 |

- Where `_count` is omitted, or supplied as `0`, the maximum of 30 is applied.
- Values above 30 are reduced to 30. A request for `_count=50` behaves as `_count=30`.

`Bundle.total` is the **count of all matching records**, not the number returned. A search matching 678 records reports `"total": 678` while returning at most 150 of them.

Where a query matches more than 150 records, the result set is trimmed to the first 150. Which 150 are returned is determined by the sort order in effect. See [Sorting](#sorting).

Clients needing bulk datasets should use the [Export API](export-api.html).

A paging request that starts at or beyond the threshold (`_getpagesoffset` of `150` or more) is rejected with `400 Bad Request` and an `OperationOutcome` of type `too-costly`. A request that would extend a page past the threshold has its `_count` reduced so the page ends at the boundary. The number of pages therefore depends on `_count`, up to the 150-record limit.

### Read behaviour

Read follows [standard FHIR read semantics](https://hl7.org/fhir/R4/http.html#read). IDs must conform to FHIR formatting rules.

Visibility on read:

| Resource state | Result |
|---|---|
| Active | Returned |
| Inactive, not suppressed | Returned |
| Suppressed | `404 Not Found` |
| Does not exist | `404 Not Found` |

A suppressed resource is never directly retrievable. An inactive resource is excluded from default search results but is readable by id.

```http
GET /Organization/example-healthconnect-organization-1
Authorization: Bearer <jwt>
X-Request-ID: 39f2a244-9bd8-4517-a9f7-c651baf17b71
Accept: application/fhir+json
```

### Search behaviour

- String searches are case-insensitive.
- Partial matching is supported.
- Identifier-based searches (for HPI-I and HPI-O) require exact matching.
- Multiple parameters are combined using logical `AND`.

All responses, including error responses, carry `Cache-Control: no-store`. Directory data must not be cached by intermediaries or clients.

#### Sorting

Result ordering is controlled by `_sort`.

If a `_sort` parameter is supplied in the request, this will be used. If no `_sort` parameter is supplied, resources will be sorted according to the following:

| Resource type | Default `_sort` |
|---|---|
| `HealthcareService` | `name` |
| `Organization` | `name` |
| `Location` | `name` |
| `Practitioner` | `name` |
| `Endpoint` | `name` |
| `PractitionerRole` | `role` |
| `Provenance` | `recorded` |

All defaults are ascending. `role` is a codeable concept, so `PractitionerRole` results are ordered by code rather than by display text. `recorded` is the date the `Provenance` entry was recorded.

`_sort` follows [standard FHIR sort semantics](https://hl7.org/fhir/R4/search.html#sort), including the `-` prefix for descending order. `_sort=near` orders by proximity and requires a `near` parameter on the query. See the [proximity](#proximity-and-nearby) and [sorting](#sorting-1) examples below.

Sorting is applied before the result set is trimmed to 150 records, so the first page holds the first records in sort order.

#### Search parameters that are not permitted

The following search parameters may not be supplied by a client, and a search containing one is rejected with `400 Bad Request` and an `OperationOutcome` of type `invalid`:

- `_filter` - the service owns all `_filter` usage and injects it itself during visibility filtering. See [Data visibility rules for search](#data-visibility-rules-for-search).
- `suppressed` - the service owns this filter and injects `suppressed=false` itself. A client may not supply it at the root (`suppressed=true`, `suppressed=false`) or chained onto a reference (`organization.suppressed=false`). The same rule applies inside an export `_typeFilter`.
- Any underscore-prefixed parameter the service does not recognise. See [Underscore-prefixed parameters](#underscore-prefixed-parameters).

#### Restricted search parameters

Some search parameters are restricted for privacy reasons and may not be used to query the directory. On `Practitioner` these are:

- `gender`
- `gender-identity`
- `address` and any `address-*` parameter
- `identifier`, where the value targets the PBS prescriber number system `http://ns.electronichealth.net.au/id/medicare-prescriber-number`

A request using a restricted parameter is rejected with `400 Bad Request` and an `OperationOutcome` of type `not-supported`. A rejected `gender` search directs the client to the [Practitioner's Recorded Sex or Gender](SearchParameter-practitioner-rsg.html) (`rsg`) parameter instead.

The same restrictions are enforced on forward-chain and reverse-chain parameters, so a restricted parameter cannot be reached indirectly - `PractitionerRole?practitioner.gender=female` is rejected in the same way as `Practitioner?gender=female`. They are also applied to every `_typeFilter` query in a bulk export request.

### Data visibility rules for search

#### Default search behaviour

By default, the Directory returns **only records that are active and not suppressed**.

- Records that are inactive are excluded from search results.
- Records that are suppressed are excluded from search results.

#### Searching for inactive records

Inactive records can be included in search results by explicitly specifying the state in the query, for example `active=false`.

The state element differs by resource type, and the two `status`-based types do **not** share the same value set:

| Resource type | State element | Active value | Non-active values |
|---|---|---|---|
| `Practitioner`, `PractitionerRole`, `Organization`, `HealthcareService` | `active` (boolean) | `true` | `false` |
| `Location` | `status` | `active` | `inactive` |
| `Endpoint` | `status` | `active` | `off`, `suspended` |

`Endpoint` uses `off` and `suspended` rather than `inactive`.

Supplying both an active-side and an inactive-side value, for example `status=active,inactive`, returns both.

A `status` value outside the permitted set for the resource type is **rejected** with `400 Bad Request` and an `OperationOutcome` of type `invalid`. This applies to every value in a comma-separated list.

| Resource type | Permitted `status` values |
|---|---|
| `Location` | `active`, `inactive`. The FHIR `suspended` status is not used. |
| `Endpoint` | `active`, `suspended`, `off`. The FHIR `error`, `entered-in-error` and `test` statuses are not used. |

So `Endpoint?status=inactive` and `Location?status=suspended` are both rejected rather than simply returning nothing. Boolean-active resource types carry no `status` and are unaffected.

See [Record status](api-overview.html#record-status).

#### Suppressed and included records

An active search returns active records. A search for inactive records returns inactive records, though where an `_include` or `_revinclude` is supplied the included records may be active or inactive. Suppressed records are never returned, under any query or in any position.

A suppressed record's status updates are available through the Export API when `_since` is used, so that client systems can identify records to remove from their own datasets. See [Visibility rules for export](export-api.html#visibility-rules-for-export).

Where an included record is dropped, a returned match may reference a resource that is not present in the bundle. Clients must tolerate an unresolved reference; the match itself is never removed or rewritten.

Filtering is applied to every page of a paged result, not only the first. `Bundle.total` counts matching records only, so it is unaffected by include filtering. `Provenance` is stateless and is never filtered.

### No matching records

Where no matching record is found, the API returns `200 OK` with a `Bundle` containing `total: 0`, consistent with the standard FHIR response pattern. An empty result is **not** an error and does not return an `OperationOutcome`.

```json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 0,
  "entry": []
}
```

FHIR-conformant client applications can interpret this response to determine the appropriate message to display to end users.

#### Possible reasons for `total: 0`

- The search criteria are too restrictive.
- No record exists in the Directory matching the supplied criteria.
- The matching record or records are **inactive**.
- The matching record or records are **suppressed**.

The API does not distinguish between these cases in the response. A client cannot tell from `total: 0` alone whether a record is absent, inactive, or suppressed.

### Search examples

#### Simple lookups

Read one organisation by FHIR ID:

```http
GET /Organization/example-healthconnect-organization-1
```

Search for an organisation by its HPI-O:

```http
GET /Organization?identifier=8003626566707032
```

Search for organisations by name and state:

```http
GET /Organization?name=Aged%20Care&address-state=QLD
```

#### Healthcare service type

Find pathology services in a suburb, returning the location and the organisation that provides each service:

```http
GET /HealthcareService?service-type=http://snomed.info/sct|310074003&location.address-city=Balmain&_include=HealthcareService:location&_include=HealthcareService:organization
```

Find services of a given type that are open after 5:00pm and where Portuguese is spoken:

```http
GET /HealthcareService?service-type=http://snomed.info/sct|789718008&languages=pt&endtime=gt1700&_include=HealthcareService:organization
```

Find bulk-billing services of a given type at a wheelchair-accessible location:

```http
GET /HealthcareService?service-type=http://snomed.info/sct|310074003&location.address-postalcode=2150&hsbilling=BBO&location.locationamenities=wheelchairAccess&_include=HealthcareService:location
```

#### Practitioner role type

Find cardiologists in a suburb, returning the practitioner, location, organisation and service with each role:

```http
GET /PractitionerRole?role=http://snomed.info/sct|17561000&location.address-city=Balmain&_include=PractitionerRole:practitioner&_include=PractitionerRole:location&_include=PractitionerRole:organization&_include=PractitionerRole:service
```

Find a role type available at weekends:

```http
GET /PractitionerRole?role=http://snomed.info/sct|763292005&location.address-postalcode=2041&daysofweek=sat,sun&_include=PractitionerRole:practitioner&_include=PractitionerRole:service
```

Find a role type delivering a bulk-billing service:

```http
GET /PractitionerRole?role=http://snomed.info/sct|309369000&service.hsbilling=BBO&_include=PractitionerRole:practitioner&_include=PractitionerRole:organization&_include=PractitionerRole:service&_include=PractitionerRole:location&_include=PractitionerRole:endpoint
```

#### Proximity and nearby

Find locations within 25km of a coordinate:

```http
GET /Location?near=-33.8136|150.9996|25|km
```

Find services of a type near a coordinate, using a chained proximity filter:

```http
GET /HealthcareService?service-type=http://snomed.info/sct|394814009&location.address-postalcode=2000&location.near=-33.8688|151.2093|25|km&_include=HealthcareService:location&_include=HealthcareService:organization
```

#### Sorting

Locations near a coordinate, ordered by distance:

```http
GET /Location?address-city=Balmain&near=-33.8607|151.1803|100|km&_sort=near
```

Organisations by name, descending:

```http
GET /Organization?address-state=NSW&name=Health&_sort=-name
```

The same search with no `_sort` returns name ascending, which is the default sort for `Organization`:

```http
GET /Organization?address-state=NSW&name=Health
```

#### Multi-parameter and relationship queries

Find a role type in a suburb, speaking a given language, with a given recorded sex or gender, returning the full context:

```http
GET /PractitionerRole?role=http://snomed.info/sct|17561000&location.address-city=Balmain&languages=de&practitioner.rsg=female&_include=PractitionerRole:practitioner&_include=PractitionerRole:location&_include=PractitionerRole:organization&_include=PractitionerRole:service
```

Find services staffed by a practitioner with particular attributes, using reverse chains, and return the roles delivering them:

```http
GET /HealthcareService?service-type=http://snomed.info/sct|310074003&location.address-city=Balmain&daysofweek=sat&_has:PractitionerRole:service:languages=de&_has:PractitionerRole:service:practitioner.rsg=female&_include=HealthcareService:location&_include=HealthcareService:organization&_revinclude=PractitionerRole:service
```

Find a named practitioner at a named location, without making `PractitionerRole` the root of the query:

```http
GET /Location?name=Apollo%20Cardiac%20Care%20Centre&_has:PractitionerRole:location:practitioner.name=John&_has:PractitionerRole:location:practitioner.name=McGrath&_revinclude=PractitionerRole:location
```

Find practitioners who hold a role at a given organisation, using a reverse chain:

```http
GET /Practitioner?_has:PractitionerRole:practitioner:organization=Organization/example-healthconnect-organization-1
```

Retrieve everything that has changed since a point in time, for local synchronisation:

```http
GET /PractitionerRole?_lastUpdated=gt2026-01-01T00:00:00Z&_include=PractitionerRole:practitioner
```

For the full list of search parameters available on each resource type - including the custom search parameters defined by this Implementation Guide, their modifiers, and the prefix operators supported on time-based parameters - see the [Implementation Guide home page](index.html) and the [CapabilityStatement](capability-statements.html).

### Unsupported operations

Public Search API interactions are read-only. The following are not supported:

- `_search`
- `_history`
- `_filter`
- `$meta`
- `$diff`
- `$validate`
- Create, update, and delete interactions (`POST`, `PATCH`, `PUT`, `DELETE`)

Requests using an unsupported operation are rejected. `_filter` is used internally by the service to apply state filtering and is not accepted from a client.
