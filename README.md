# Health Connect Provider Directory (HCPD)
Health Connect Australia is a national health information exchange program designed to enable the sharing of health information between healthcare participants quickly and securely. By integrating advanced digital infrastructure, standards, privacy protections and enabling real-time data sharing, Health Connect Australia will support multidisciplinary collaboration across care settings. As a key enabler of the National Digital Health Strategy 2023–2028 and the National Healthcare Interoperability Plan 2023-2028, it ensures secure, connected digital solutions that improve access, efficiency and care quality—paving the way for a smarter, more integrated future in digital health. The program is being delivered in phases, beginning with foundational capabilities and expanding to support secure communication, record discovery, and value-added services for both providers and consumers.

The Directory and Authorisation Service Project is the first initiative under the Foundations phase. It enables healthcare providers to discover accurate, up-to-date information about other providers and the services they offer, while establishing a trust framework to support consistent and secure access to health information. By connecting provider data from multiple primary sources through a single access point and ensuring near real-time updates, the project lays the groundwork for broader interoperability and trusted information exchange across the national health ecosystem.

One of the key objectives of the Directory and Authorisation Service Project is to enable interoperability through contemporary standards—such as FHIR APIs—to ensure seamless integration across clinical and administrative systems. To support this, the project is establishing a centralised directory hosted on a FHIR repository, where provider and organisation data will be structured using HL7 FHIR and SNOMED CT-AU standards. To guide consistent implementation and promote national alignment, the project is developing a FHIR Implementation Guide that defines how provider information should be represented and exchanged. This guide will build on existing standards, including the HL7 Australia Provider Directory FHIR IG, and provide a clear reference for integrators and system vendors to support secure, scalable, and standards-compliant access to directory data.

# HCPD FHIR Implementation Guide (IG)
 
## Overview
This repository hosts a FHIR Implementation Guide (IG) for community consultation and collaboration.

### link to published site on build.fhir.org
https://build.fhir.org/ig/AuDigitalHealth/HCPD/index.html

## How to Build

### Pre-requisites
[SUSHI](https://fshschool.org/docs/sushi/installation/) - Ensure you have Node JS installed, and then install SUSHI via `npm install -g fsh-sushi`

[Jekyll](https://jekyllrb.com/docs/installation/) - Jekyll is a Ruby Gem and instructions are available for various operating systems.

### Building
Run either the `_genonce.bat` or `_genonce.sh` script.

 
## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to contribute.
 
## License
This project is licensed under Creative Commons license 4.0 - see the [LICENSE](LICENSE) file for details.

