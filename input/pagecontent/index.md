# Health Connect Provider Directory FHIR Implementation Guide

### Scope

This Implementation Guide (IG) defines how a Health Connect Provider Directory Requester Actor (client) interacts with a Health Connect Provider Directory Responder Actor (server), specifying the expected behaviors for each. The Requester Actor is a read-only FHIR client: it may perform search and read operations, but does not create, update, or delete resources in Health Connect. The capability statements in this IG set out the minimum operations and behaviors that conformant implementations must support. For the Responder Actor, requirements are expressed as SHALL statements, indicating mandatory support. For the Requester Actor, requirements are a mix of SHALL (mandatory) and SHOULD (recommended) statements, as detailed in the relevant [capability statements](capability-statements.html) and [conformance statement](conformance.html) sections of this guide. For further detail please appraise both the [capability statements](capability-statements.html) and [conformance statement](conformance.html).

The intended downstream use case for conformant implementations is provider to provider discovery, enabling healthcare provider systems to discover accurate, up to date information about other healthcare providers, organisations, services, locations, and technical endpoints in order to support clinical, administrative, and interoperability workflow. The Health Connect Provider Directory FHIR Implementation Guide is an open specification, allowing implementers to extend it for their own use cases as long as they meet its conformance requirements. Feedback from the Australian FHIR Community Process (AFCP) strongly supported keeping the specification open, enabling a wider range of provider directory implementations and simplifying connectivity between systems.

### Introduction

Health Connect Australia is a national health information exchange program designed to enable the sharing of health information between healthcare participants quickly and securely. By integrating advanced digital infrastructure, standards, privacy protections and enabling real-time data sharing, Health Connect Australia will support multidisciplinary collaboration across care settings. As a key enabler of the [National Digital Health Strategy 2023–2028](https://www.digitalhealth.gov.au/national-digital-health-strategy) and the [National Healthcare Interoperability Plan 2023-2028](https://www.digitalhealth.gov.au/about-us/strategies-and-plans/national-healthcare-interoperability-plan), it ensures secure, connected digital solutions that improve access, efficiency and care quality-paving the way for a smarter, more integrated future in digital health. The program is being delivered in phases, beginning with foundational capabilities and expanding to support secure communication, record discovery, and value-added services for both providers and consumers. 

The Directory and Authorisation Service Project is the first initiative under the Foundations phase. It enables healthcare providers to discover accurate, up-to-date information about other providers and the services they offer, while establishing a trust framework to support consistent and secure access to health information. By connecting provider data from multiple primary sources through a single access point and ensuring near real-time updates, the project lays the groundwork for broader interoperability and trusted information exchange across the national health ecosystem. 

One of the key objectives of the Directory and Authorisation Service Project is to enable interoperability through contemporary standards-such as FHIR APIs-to ensure seamless integration across clinical and administrative systems. To support this, the project is establishing a centralised directory hosted on a FHIR repository, where provider and organisation data will be structured using HL7® FHIR® and terminology standards. To guide consistent implementation and promote national alignment, the project is developing a FHIR Implementation Guide that defines how provider information should be represented and exchanged. This guide will build on existing standards, including the HL7 Australia FHIR AU Core, and provide a clear reference for integrators and system vendors to support secure, scalable, and standards-compliant access to directory data.

### How to read this guide

This guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home](index.html): This page provides the introduction and scope for the implementation guide.
- [Conformance](conformance.html): This page describes the set of rules to claim conformance to this guide including capability statements and actor definitions.
- [Guidance](guidance.html): This page provides implementation guidance and best practices for using the Health Connect Provider Directory FHIR IG.
  - [General Guidance](general-guidance.html): This page provides implementation conventions for must support elements, actor obligations, and experimental dependencies in the Health Connect Provider Directory FHIR IG.
  - [Bulk Data Extraction](bulk-data-extraction.html): This page provides asynchronous bulk export capabilities using FHIR Bulk Data Access specification for large-scale provider directory data extraction and synchronization.
- [Security and Privacy](security-and-privacy.html): This page provides Security requirements including TLS encryption standards, FHIR communications security, and privacy obligations for Health Connect Provider Directory implementations.
- [FHIR Artefacts](artifacts.html): These pages provide detailed descriptions and formal definitions for all the FHIR artefacts defined in this guide.
  - [Artifacts Summary](artifacts.html): This page provides a comprehensive summary of all FHIR artifacts defined in this implementation guide including profiles, extensions, terminology, and other conformance resources.
  - [Profiles and Extensions](profiles-and-extensions.html): This page lists the FHIR profiles and extensions that are defined in this guide.
  - [Terminology](terminology.html): This page lists the FHIR terminology that are defined in this guide.
  - [Capability Statements](capability-statements.html): This page defines the expected FHIR capabilities of Health Connect Provider Directory Requester and Health Connect Provider Directory Responder.
  - [Search Parameters](artifacts.html#behavior-search-parameters): This page lists the FHIR search parameters that are defined in this guide.
  - [Actor Definitions](actors.html): This page defines the Health Connect actors, Health Connect Provider Directory Requester and Health Connect Provider Directory Responder.
- [Examples](examples.html): This page lists the sample instances of FHIR resources conforming to the FHIR profiles.
- [Support](downloads.html): This section provides support resources for implementers.
  - [Known Issues](known-issues.html): This page lists known issues with this specification at the time of publishing along with their descriptions.
  - [Downloads](downloads.html): This page provides links to downloadable artefacts including the Agency FHIR NPM package.
- [Change Log](changelog.html): This page documents the version history and changes made to this implementation guide across different releases.
- [Licence and Legal](legal.html): This page lists the licensing, copyright, and disclaimers under which this guide is issued.

### Document purpose and scope

The primary aim of this implementation guide is to support implementers integrating with the Directory services using [FHIR, Release 4 (v{{ site.data.fhir.version }}) [HL7FHIR4]](#HL7FHIR4). It provides the technical specifications, FHIR profiles, and terminology definitions required for healthcare provider data exchange through Health Connect Provider Directory APIs.
 
This document describes specific system behaviours such as obligations, API HTTP response codes, and search parameters. Other system behavioural requirements such as the presentation of information and user experience are managed separately and must be met before systems can be assessed for conformance and granted access to Health Connect APIs.

Reference has been made to International and Australian Standards, and to Standards from HL7. The following standards are referred to in the text in such a way that some or all of its content constitutes requirements for the purposes of this specification:
* [FHIR, Release 4 (v{{ site.data.fhir.version }}) [HL7FHIR4]](#HL7FHIR4)
* [Australian Base Profiles Implementation Guide [HL7AUBIG]](#HL7AUBIG)
* [Australian Core Profiles Implementation Guide [HL7AUCIG]](#HL7AUCIG)
* [FHIRPath Specification v2.0.0 [HL7FHIRPATH]](#HL7FHIRPATH)

Wherever possible, material in this specification is based on existing standards. All efforts have been made to minimise divergence from the HL7 Australia standards ([AU Core [HL7AUCIG]](#HL7AUCIG) and [AU Base [HL7AUBIG]](#HL7AUBIG)) to provide for system interoperability and compatibility with other profiles. Issues of an editorial nature in the source material (such as spelling or punctuation errors) are intentionally reproduced. For a list of known issues (see below).

### Intended audience

This implementation guide is aimed at software development teams, architects, and designers that integrate with the Health Connect Provider Directory system.

This implementation guide and related artefacts are technical in nature and the audience is expected to be familiar with the language of health data specifications and to have some familiarity with health information standards and specifications, such as FHIR.

### Relationships with other work

This implementation guide builds on other specifications, helping ensure a consistent approach to data sharing that should ease adoption. The specific guides used, and the portions relevant from each of them are as follows:

{% include dependency-table-short.xhtml %}

### Cross version analysis

{% include cross-version-analysis.xhtml %}

### Global profiles

{% include globals-table.xhtml %}

### Data model overview

The Health Connect Provider Directory uses FHIR resources to represent healthcare providers, their roles, organisational affiliations, service locations, and the healthcare services they provide. The diagram below illustrates the key relationships between these FHIR resources:

<div style="text-align: center;">
  <img src="HC UML Class.svg" alt="Health Connect Entity Relationship Diagram" style="width:75%; display:block; margin:auto;" />
</div>
<br />

- Organization - Healthcare organisations and facilities that employ or affiliate with practitioners
- Location - Physical or virtual locations where healthcare services are delivered
- HealthcareService - Specific services offered by organisations at locations
- Endpoint - Technical endpoints for digital service integration and communication
- PractitionerRole - Roles and responsibilities of practitioners within organizations, including availability
- Practitioner - Individual healthcare providers with their professional qualifications and identifiers

This model supports complex healthcare delivery scenarios while maintaining FHIR R4 compliance and enabling efficient provider directory searches and integrations.


### References

|[<a name="HL7AUBIG">HL7AUBIG</a>]| HL7 Australia, FHIR R4 standard for AU Base Implementation Guide, v6.0.0|
||[https://hl7.org.au/fhir/6.0.0/index.html](https://hl7.org.au/fhir/6.0.0/index.html)|  

|[<a name="HL7FHIR4">HL7FHIR4</a>]|Health Level Seven, Inc., 30 October 2019, FHIR R4.|
||[http://hl7.org/fhir/R4/](http://hl7.org/fhir/R4/)|

|[<a name="HL7AUCIG">HL7AUCIG</a>]| HL7 Australia, FHIR R4 standard for AU Core Implementation Guide, v2.0.0|
||[https://hl7.org.au/fhir/core/2.0.0/index.html](https://hl7.org.au/fhir/core/2.0.0/index.html)|  

|[<a name="HL7FHIRPATH">HL7FHIRPATH</a>]| HL7 International, FHIRPath Specification, v2.0.0|
||[http://hl7.org/fhirpath](http://hl7.org/fhirpath)|
