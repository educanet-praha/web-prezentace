#import "./globals.typ": *

= Doména
== Domény obecně
Doména je jednoznačné označení počítače nebo počítačové sítě připojené do internetu. Příkladem webové domény je `praha.educanet.cz` nebo `translate.google.com`.

Domény jsou zapamatovatelné substituce I.P. adres. Každá doména se při komunikaci přeloží na I.P. adresu.

Doména se skláda z `subdomain.sld.tld`

== TLD
TopLevelDomain je doména nejvyššího řádu, která se vyhodnocuje při komunikaci jako první, určuje menší část internetu, kde se dál má počítač hledat. TLD domény se dělí na tři druhy:

- Generické (gTLD)
  #pause
  - _.com, .net, .org, .biz, .info, .name, .pro_
#pause

- Sponsorované (sTLD)
  #pause
  - _.aero, .bank, .edu, .gov, .jobs, .coop, ..._
#pause

- Států (ccTLD) _country-code_
  #pause
  - dvojpísmenné označení podle _ISO_
  
  - _.cz, .io, .us, .eu, .fr, .it, ..._

== SDL
SecondLevelDomain jsou domény nižšího řádu, které registrují jednotliví správci _TLD_. Teoreticky jich je neomezený počet a nejsou omezené názvem _(TLD si může určit vlastní podmínky)_.

#pause
Například:
  - seznam _registrovaný u TLD .cz_
  
  - google _registrovaný u celé řady TLD_
  
  - educanet _registrovaný u TLD .cz_

  - linuxfoundation _registrovaný u TLD .org_

== Subdomény
Jedná se o bližší spcifikace domény druhého řádu, tu si už každý správce SDL spravuje sám. Většinou se používá pro sjednocení více služeb pod jednu společnou doménu. Každá subdoména může být fyzicky na jiném počítači.

= Správa internatu

== Domain Name System
- Skupina serverů, které si pamatují _I.P._ adresy k doménám

- Několik úrovní

- Různé geografické oblasti

- Komplikované cachování

== Kořenová zóna
- 13 autoritativníh jmen (serverů), které znají všechny _TLDNS_ 

- stovky _TLDNS_

- _"(a-m).root-server.net"_

== RIG
Regional Internet Registry je zmocněná autorita zodpovědná za rozdělování _I.P._ adres v oblasti/regionu

- *AFRINIC* _African Network Information Centre_

- *ARIN* _American Registry for Internet Numbers_
- *APNIC* _Asia Pacific Network Information Centre_
- *LACNIC* _Latin America and Caribbean Network Information Cenrte_
- *RIPE NCC* _Réseaux IP Européens Network Coordinaton Centre_

== ICANN
Interner Corporation for Assigned Names and Numbers je organizace zodpovědná za:

- Přidělování IP adres
  - Přiřazuje velké bloky čísel jedlotlivých regionálním správcům

- Správu kořenové zóny DNS

- Správu internetových protokolů

== IGF
Internet Governance Forum je sdružení společností, organizací a skupin zodpovědných za určování směru ICANN.

= Komunikace internetem

= Prohlížeč

== Prohlížeč
.

== HTML Jádro
.

== CSS Jádro
.

== JS Jádro
.