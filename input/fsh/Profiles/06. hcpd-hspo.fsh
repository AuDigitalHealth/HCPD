Invariant: inv-hspo-0
Description: "HSP-O shall be 16 digits"
Severity: #error
Expression: "value.matches('^([0-9]{16})$')"

Invariant: inv-hspo-1
Description: "HSP-O prefix shall be 800364"
Severity: #error
Expression: "value.startsWith('800364')"

Invariant: inv-hspo-2
Description: "HSP-O shall pass the Luhn algorithm check"
Severity: #error
Expression: "(((select(value.substring(0,1).toInteger()).select(iif($this<5, $this*2, (($this*2)-9))))+(value.substring(1,1).toInteger())+(select(value.substring(2,1).toInteger()).select(iif($this<5, 
$this*2, (($this*2)-9))))+(value.substring(3,1).toInteger())+(select(value.substring(4,1).toInteger()).select(iif($this<5, $this*2, (($this*2)-9))))+(value.substring(5,1).toInteger())+(select(value.substring(6,1).toInteger()).select(iif($this<5, $this*2, (($this*2)-9))))+(value.substring(7,1).toInteger())+(select(value.substring(8,1).toInteger()).select(iif($this<5, $this*2, (($this*2)-9))))+(value.substring(9,1).toInteger())+(select(value.substring(10,1).toInteger()).select(iif($this<5, $this*2, (($this*2)-9))))+(value.substring(11,1).toInteger())+(select(value.substring(12,1).toInteger()).select(iif($this<5, $this*2, (($this*2)-9))))+(value.substring(13,1).toInteger())+(select(value.substring(14,1).toInteger()).select(iif($this<5, $this*2, (($this*2)-9))))+(value.substring(15,1).toInteger()))mod 10=0)"

Profile: HCPD_HSPO_Identifier
Parent: Identifier
Id: hcpd-hspo
Title: "HCPD Healthcare Support Service Provider - Organisation (HCPD HSP-O)"
Description: "This identifier profile defines a Healthcare Support Service Provider Organisation in an Australian context. An HSP-O is assigned under the HI Service to a service (in-home care support and personal care services) where healthcare is provided. A HSP-O can only be of 'seed' type. An Organization cannot be assigned both an HPI-O and an HSP-O; only one identifier is assigned by the HI Service."
* ^experimental = false
* ^status = #active
* . ^short = "Healthcare Support Service Provider Organisation (HSP-O) Identifier"
* . ^definition = "Identifier assigned under the HI Service organisations that do not directly provide healthcare services but provide care and support services to older Australians or people with disability may register with the HI Service for a Healthcare Support Service Provider Organisation (HSP-O) identifier. This includes organisations that provide in-home care support and personal care services. Providers with a HSP-O will not have access to the My Health Record system."
* system 1..
* system = "http://ns.electronichealth.net.au/id/hi/hspo/1.0" (exactly)
* value 1..
* value ^short = "HSP-O"
* value ^maxLength = 16
* value obeys inv-hspo-0 and inv-hspo-1 and inv-hspo-2

* extension contains
    HI_Services_Identifier_Status named hcpd-hspo-status 1..1 MS and
    HI_Service_Organisation_Classification named hi-org-classification 1..1 MS
* extension[hcpd-hspo-status] ^short = "HI Services Identifier Organisation status"
* extension[hcpd-hspo-status] ^definition = "HI Services Identifier Organisation status for the HSP-O identifier under the HI Service."
* extension[hi-org-classification] ^short = "Organization classification - fixed to 'seed' for HSP-O"
* extension[hi-org-classification] ^definition = "Organization classification for HSP-O identifiers is always 'seed'."
* extension[hi-org-classification].valueCodeableConcept.coding = $hi-org-class-cs#seed "Seed" (exactly)

