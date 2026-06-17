### Overview

This page describes step 2 of the Asynchronous Bulk Data Export Process Workflow - polling for the request status.

<div style="padding: 1em; border-top: 1px solid #ddd;">
  <figure>
    {% include AsyncBatchExportActivityDiagramStatus.svg %}
  </figure>
</div>

Status requests have four key components:

1. Preconditions
2. Request to server
3. Responses from server
4. Follow-up actions

### Preconditions

The following preconditions, as documented in the [submission function](BatchRequestSubmission.html), **SHALL** be met before polling the status of the request:

1. The client must have received a `202 Accepted` response from the initial batch request submission
2. The `Content-Location` header in the `202 Accepted` response must be stored for use in polling requests with the specific job ID value.

### Request to server

Clients poll the URL from the `Content-Location` header using a standard HTTP `GET` to check the job's status.

#### Example request

Request HTTP Method

```
GET [base url]/$export-poll-status?_jobId=5abb806c-043e-41e5-903f-5f2995576452
Accept: application/json
```

### Responses from server

#### Response headers

The server **SHALL** include the following headers in its response to polling requests:

* `Retry-After` (integer): indicates the number of seconds the client should wait before making the next polling request. Clients should use this information to inform the timing of future polling requests.
* `X-Progress` (string): provides a human-readable status message about the job's current progress. Clients can try to parse this value, display it to the user, or log it.

#### Response - in progress

While the job is still running, the server responds with `202 Accepted`.

Response HTTP header

```
HTTP/1.1 202 Accepted
Retry-After: 60
X-Progress: Search in progress - found 954 of 1,000 resources
```

Response HTTP body: absent

#### Response - completed

Example of a successful response manifest JSON:
```
{ "transactionTime": "2026-02-19T10:27:53.423+11:00", "request": "http://localhost:8080/fhir/$export", "requiresAccessToken": true, "output": [ { "type": "Organization", "url": "http://localhost:8080/fhir/Binary/fnQjLPLp7x3VpEAsJd4mZ9Fz5mLbZWkY" } ], "error": [] }
```

Example of unsuccessful response manifest JSON:
```
{ "transactionTime": "2026-02-19T10:23:53.417+11:00", "request": "http://localhost:8080/fhir/$export", "requiresAccessToken": true, "output": [], "error": [], "message": "Export complete, but no data to generate report for job instance: 7a75faaa-ac94-4380-a10f-bfb733dba09e" }
```
### Follow-up actions

Following successful request status polling, there are two possible follow-up actions:

#### Retrieving results

Once processing is complete, the server provides links to the generated bulk data files. Clients can use these links to download the results.

For full details, refer to the [Batch Request Results](BatchRequestResults.html) page.

#### Deleting a request

Clients can delete a batch request by sending a `DELETE` request to the URL provided in the `Content-Location` header.

For full details, refer to the [Batch Request Delete](BatchRequestDelete.html) page.
