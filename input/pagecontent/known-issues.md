This table lists known issues with this specification at the time of publishing. We are working on solutions to these issues and encourage comments to help us develop these solutions.

<table border="1" cellpadding="1" valign="middle">
 <tbody>
   <col width="15%" />
   <col width="auto" />
   <tr bgcolor="#DCDCDC">
     <th>Reference</th>
     <th>Description</th>
   </tr>
   <tr>
     <td>Example system URI</td>
     <td>An inherited example system (e.g. <code>http://www.acme.com/identifiers/patient</code>) erroneously infers patient context. Implementers must use their own namespace URIs. The affected identifier profile is Endpoint (hcpd-EPI) - this profile includes the erroneous example `system` in their documentation.</td>
   </tr>
   <tr>
     <td>Dependency on current version of Australian Provider Directory IG (FHIR IG)</td>
     <td>The HCPD FHIR IG utilises <a href="https://hl7.org.au/fhir/pd/pd2/ValueSet-service-interfaces.html">Australian Service Interfaces</a> and <a href="https://hl7.org.au/fhir/pd/pd2/ValueSet-endpoint-payload-type.html">Australian Endpoint Payload Types</a> from the Australian Provider Directory FHIR IG. However, including a dependency on v2.0.1 of the HL7 AU PD FHIR IG results in a publisher error due to a FHIR version mismatch: the AU PD IG is built on FHIR version 4.0.0 while HCPD requires version 4.0.1.</td>
   </tr>
 </tbody>
</table>