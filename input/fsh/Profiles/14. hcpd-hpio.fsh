Profile: HCPD_HPIO_Identifier
Parent: $au-hpio
Id: hcpd-hpio
Title: "HCPD Healthcare Provider Identifier - Organisation (HCPD HPI-O)"
Description: "This identifier profile extends the AU HPI-O profile to include an organization classification extension to indicate whether the organization is a 'seed' or 'network' type."
* ^experimental = false
* ^status = #active

* extension contains
    HI_Services_Identifier_Status named hpio-status 1..1 MS and
    HI_Service_Organisation_Classification named hi-org-classification 1..1 MS
* extension[hpio-status] ^short = "HI Services Identifier Organisation status"
* extension[hpio-status] ^definition = "HI Services Identifier Organisation status for the identifiers under the HI Service such as an HPI-O and HSP-O"
* extension[hi-org-classification] ^short = "Organization classification"
* extension[hi-org-classification] ^definition = "Organization classification for HPI-O identifiers - can be 'seed' or 'network'."