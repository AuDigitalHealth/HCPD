### Overview
The search parameters defined in this implementation guide specify the recommended approaches for client systems to query the Health Connect Provider Directory system and are the authoritative specification for discovering and retrieving healthcare Provider Directory data. Client systems integrating with Health Connect **SHOULD** use these search parameters to ensure consistent and reliable data retrieval across all client integrations. 

The Health Connect Provider Directory supports all search parameters defined in this implementation guide, plus inherited FHIR search capabilities from the derived profiles. All search parameters are marked as **SHOULD** support for the Health Connect Provider Directory Requester Actor, allowing implementers flexibility in choosing which parameters to support based on their specific use cases and integration requirements. Client systems can utilise any of the available search parameters, and should conform to the specifications and constraints defined herein where applicable to their use case.

#### Default response behaviour — active and non-suppressed resources only

By default, **real-time searches** against the Health Connect Provider Directory return **active, non-suppressed resources only**:

To retrieve inactive resources via real-time search, use the standard R4 `active` or `status` search parameters (e.g. `?active=false` or `?status=inactive`). Be aware that results for inactive resource queries **MAY** include suppressed resources; implementers **SHALL** check each returned resource for the presence of the Suppressed extension and filter them out before display.

**Bulk data extraction** behaves differently — exports return **all resources** regardless of active status or suppression. Implementers consuming bulk export data **SHALL** apply active and suppression filtering before presenting or using the data.

#### Useful standard search parameters for this IG

[**_lastUpdated**](https://hl7.org/fhir/R4/search.html#lastUpdated): Enables querying resources based on when they were last modified in the Health Connect Provider Directory. This parameter is particularly useful for synchronization scenarios where client systems need to identify resources that have changed since a specific point in time. The parameter supports comparison prefixes to enable flexible date range queries:

- `gt` (greater than): Returns resources updated after the specified date/time
- `lt` (less than): Returns resources updated before the specified date/time
- `ge` (greater than or equal): Returns resources updated on or after the specified date/time
- `le` (less than or equal): Returns resources updated on or before the specified date/time

The date/time value can be specified with varying precision (year, month, day, hour, minute, second). Time components are optional - if omitted, the system assumes the start or end of the period as appropriate for the comparison.

Example usage for type-specific search:
```
GET [base]/Practitioner?_lastUpdated=gt2025-01-01T00:00:00Z
```

This query retrieves only Practitioner resources updated since January 1, 2025.

[**_elements**:](https://build.fhir.org/search.html#elements) Controls which elements are returned in the response by accepting a comma-separated list of element names. When specified, the server returns only the requested elements. This reduces bandwidth usage and improves query performance by limiting response payload size.

Example usage:
```
GET [base]/Practitioner?_elements=identifier,active
```

This query retrieves Practitioner resources but returns only the `identifier` and `active` elements (plus mandatory FHIR elements).

##### Relationship traversal  

[**_include and _revinclude**](https://hl7.org/fhir/R4/search.html#include): Enables including related resources in a single response by traversing resource relationships. `_include` follows references from primary search results to related resources, while `_revinclude` finds resources that reference the primary search results. Multiple parameters can be combined to traverse complex relationships across profile boundaries.

**Examples:**
```
GET [base]/PractitionerRole?_include=PractitionerRole:practitioner&_include=PractitionerRole:organization
```
Retrieves PractitionerRole resources with their associated Practitioner and Organization resources.

```
GET [base]/HealthcareService?_revinclude=PractitionerRole:service&_include=PractitionerRole:practitioner
```
Retrieves HealthcareService resources, plus PractitionerRole resources that reference those services, plus the Practitioner resources referenced by those PractitionerRole instances.

```
GET [base]/PractitionerRole?_lastUpdated=gt2025-01-01&_include=PractitionerRole:practitioner&_include=PractitionerRole:organization
```
Combines relationship traversal with date filtering to retrieve updated PractitionerRole resources and their related resources.

The appropriate combination of parameters depends on the referencing hierarchy defined in the profiles. Client systems should consult the profile structure (illustrated by the diagram found on the index page) and profile narrative sections to determine the correct traversal path for their use case.


##### Pagination
The Health Connect Provider Directory supports paginated search results. The Provider Directory has a default page size of **10** resources. The [`_count`](https://hl7.org/fhir/R4/search.html#count) parameter is supported generically by the service; clients may include `_count` to express a preferred page size.

- **Follow the `next` link:** When a search response is paginated, the server returns a `Bundle` that may include a `link` entry with `relation="next"`. Clients SHOULD use the `next` link to retrieve subsequent pages rather than reconstructing paging URLs.

Example:
```
GET [base]/HealthcareService?_count=50
```

This request expresses a preference for up to 50 resources per page; the server may honour this preference or return a different page size. If there are more results, the returned `Bundle` may include a `link` element with `relation="next"` for fetching the next page.

#### Custom IG-defined Search Parameters

This section lists the custom SearchParameters that have been defined within this Implementation Guide.

<table class="grid">
	<thead>
		<tr>
			<th>Name</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="SearchParameter-allday.html">All Day</a></td>
			<td>Search HealthcareServices or PractitionerRoles by whether they are available all day.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-endtime.html">End Time</a></td>
			<td>Search HealthcareServices or PractitionerRoles by availability end time.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-starttime.html">Start Time</a></td>
			<td>Search HealthcareServices or PractitionerRoles by availability start time.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-daysofweek.html">Days of Week</a></td>
			<td>Search HealthcareServices or PractitionerRoles by days of week availability. Supports multiple days using OR logic.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-endpoint-payloadmimetype.html">Endpoint Payload Mime Type</a></td>
			<td>Search for Endpoint resources by payloadMimeType.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-endpoint-url.html">Endpoint URL</a></td>
			<td>Search for Endpoint resources by address (URL).</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-endpoint-hcepi.html">HC Endpoint Identifier</a></td>
			<td>Search an Endpoint record by its HC identifier.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-healthcareservice-billing.html">Healthcare Service Billing</a></td>
			<td>Search for HealthcareService resources by billing information.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-languages.html">Languages</a></td>
			<td>Search HealthcareServices or PractitionerRoles by supported languages/communication methods. Shared across HealthcareService and PractitionerRole.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-location-amenities.html">Location Amenities</a></td>
			<td>Search for Location resources by amenities.</td>
		</tr>
				<tr>
			<td><a href="SearchParameter-location-physicaltype.html">Location Physical Type</a></td>
			<td>Search for Location resources by physicalType field.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-location-locmailaddress.html">Location Postal Address</a></td>
			<td>Search for Location resources by postal address components.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-practitioner-regprof.html">Practitioner's Registered Profession</a></td>
			<td>Search a Practitioner record by their registered profession using string values.</td>
		</tr>
				<tr>
			<td><a href="SearchParameter-practitioner-rsg.html">Practitioner's Recorded Sex or Gender</a></td>
			<td>Search a Practitioner record by their recorded sex or gender.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-practitioner-identifier-r5.html">Practitioner Identifier (R5)</a></td>
			<td>Search a Practitioner record by any identifier, including HPI-I and Professional Registration Number (PRN), mimicks R5-style identifier searching. Supports both <code>Practitioner.identifier</code> and <code>Practitioner.qualification.identifier</code>.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-suppressed.html">Suppressed</a></td>
			<td>Search Practitioner, PractitionerRole, HealthcareService, Location, Organization and Endpoint resources by the presence of the Suppression extension and optionally a coded value for who initiated it.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-healthcareservice-type-display.html">HealthcareService Type Name</a></td>
			<td>Search HealthcareServices by the display name of the healthcare service type.</td>
		</tr>
		<tr>
			<td><a href="SearchParameter-practitionerrole-code-display.html">PractitionerRole Role Name</a></td>
			<td>Search PractitionerRoles by the display name of the practitioner role code.</td>
		</tr>
	</tbody>
</table>

##### Search Modifiers

The Health Connect Provider Directory supports specific search modifiers for string-type search parameters to tailor search functionality:

- **`:exact`** - Performs case-sensitive, exact matching without partial matching. Use this when you need precise lookups with string-type parameters.
- **`:contains`** - Searches for the value anywhere within the string, not just at the beginning. Use this for broader text searches.
- **`:iterate`** - As a modifier to `_include` and `_revinclude` enables recursive traversal of reference chains in search results. In this IG, the primary use case for this would be following the `Organization.partOf` hierarchy to also retrieve all referenced parent organizations in a single query.

**Note:** Token-type search parameters (such as `hcepi`) provide exact matching by default and do not require modifiers.

##### String-Type Parameters with Modifier Support

The following string-type search parameters can be used with the appropriate modifier:

<table class="grid">
	<thead>
		<tr>
			<th>Parameter</th>
			<th>Resource Types</th>
			<th>Type</th>
			<th>Use Case for <code>:exact</code></th>
			<th>Use Case for <code>:contains</code></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><code>name (R4)</code></td>
			<td>Practitioner</td>
			<td>string</td>
			<td>Exact name match (case-sensitive)</td>
			<td><strong>Recommended:</strong> Search for practitioners by partial name matches</td>
		</tr>
		<tr>
			<td><code>regprof</code></td>
			<td>Practitioner</td>
			<td>string</td>
			<td>Exact profession match (case-sensitive)</td>
			<td><strong>Recommended:</strong> Search for partial profession matches</td>
		</tr>
		<tr>
			<td><code>locmailaddress</code></td>
			<td>Location</td>
			<td>string</td>
			<td>Not supported</td>
			<td>Search postal address components</td>
		</tr>
			<tr>
			<td><code>name (R4)</code></td>
			<td>Location</td>
			<td>string</td>
			<td></td>
			<td><strong>Recommended:</strong> Partial name/alias search on Locations</td>
		</tr>
	</tbody>
</table>

##### Prefix Operators for Time Availability Searches

The <a href="SearchParameter-starttime.html">Start Time</a> and <a href="SearchParameter-endtime.html">End Time</a> search parameters support numeric prefix operators, allowing you to search for times before, after, or at a specific value. These parameters use a four-digit numeric format (<strong>HHMM</strong>, e.g., <code>0830</code> for 8:30am, <code>1700</code> for 5:00pm).

You can use the following prefixes to control the comparison:

<table class="grid">
	<thead>
		<tr>
			<th>Prefix</th>
			<th>Meaning</th>
			<th>Example</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><code>eq</code></td>
			<td>Equal</td>
			<td><code>eq0830</code></td>
			<td>Matches exactly 08:30am</td>
		</tr>
		<tr>
			<td><code>ne</code></td>
			<td>Not equal</td>
			<td><code>ne1700</code></td>
			<td>Matches any time except 5:00pm</td>
		</tr>
		<tr>
			<td><code>gt</code></td>
			<td>Greater than</td>
			<td><code>gt0900</code></td>
			<td>Matches times after 9:00am</td>
		</tr>
		<tr>
			<td><code>lt</code></td>
			<td>Less than</td>
			<td><code>lt1200</code></td>
			<td>Matches times before 12:00pm (noon)</td>
		</tr>
		<tr>
			<td><code>ge</code></td>
			<td>Greater than or equal</td>
			<td><code>ge0800</code></td>
			<td>Matches times at or after 8:00am</td>
		</tr>
		<tr>
			<td><code>le</code></td>
			<td>Less than or equal</td>
			<td><code>le1700</code></td>
			<td>Matches times at or before 5:00pm</td>
		</tr>
	</tbody>
</table>

For example, to find HealthcareServices available after 9:00am, search with <code>starttime=gt0900</code>.