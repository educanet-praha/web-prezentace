#import "./globals.typ": *

= Co to je HTML

== HTML
- #strong[H]yper #strong[T]ext #strong[M]arkup #strong[L]anguage
  - Hypertextový značkovací jazyk

- Definice _struktury_ a základní _funkcionality_ webové stránky

- Univerzální formát čtený webovým prohlížečem
  - Každý prohlížeč se chová trochu jinak a stránky se mohou zobrazovat různě

  - Máme podmnožinu jazyka `baseline`, která je ve stejné míře podporovaná na _všech_#footnote[Tím  se myslí velké komerční prohlížeče (_Chromium a deriváty, Safari, Firefox_)] prohlížečích


== Obligatorní historické okénko
- Fyzik z CERNu (_Tim Berners-Lee_)

- Pro účely sdílení dokumentů po síti

#pause
- #strong[I]nternet #strong[E]ngineering #strong[T]ask #strong[F]orce
  - Správce standardu

  - Neziskovka

  - Další organizace podílející se na vývoji: _W3C_, _ISO_, _EIC_

#pause

- ENQUIRE (_1980_) - HTML2 (_1995_) - HTML5 (_2008_)

== Jak si to vyzkoušet
Každý krok této prezentace si můžete sami vyzkoušet. Stačí vytvořit soubor, který bude mít příponu `.html`, například `index.html` a ten otevřít, případně jeho cestu v _OS_ zadat do prohlížeče.

= HTML značky

== Značka
Základním stavebním blokem HTML dokumentů jsou značky _(angl. *tag*)_. Značka je jeden z povolených symbolů, které se zapisují ve tvaru ```html <název-značky>```. O definovaných symbolech pojednávají další stránky.

== Kategorizace značek
Značky můžeme (spíše pro naší orientaci) dělit do skupin:

#pause
1. Podle párovosti
  - Párová _značka se skládá z otevírací a uzavírací podznačky, obsah patří mezi ně_
    - ```html <div> Obsah </div>```
  
  - Nepárové _značka je tvořena pouze jedním symbolem_#footnote[Povšimněte si lomítka / na konci značky, které zastává význam uzavírací podznačky], _nemá obsah_
    - ```html <img/>```

    #pause
2. Podle významu
  - Stylistické _nemají hlubší význam, slouží pouze k vizuálním změnám_

  - Sémantické _mají hlubší význam na stránce_

== Komentáře
HTML dokumenty mohou být velké a celkem _výslovné_, což přispívá k nečitelnosti. Řešením je psaní komentářů (taková dokumentace v kódu), které by měly popisovat jednotlivé pasáže dokumentu.

#pause

```html
<!-- Můj komentáře k následující části dokumentu:
      formulář pro načtení základních informací o uživateli -->
```

#pause

#warning[Komentáře se na stránce sice nevykreslují, ale uživatel se k nim může dostat]

== Nadpisové značky
Nadpisy na stránce by měly být označené párovou sémantickou značkou ```html <h>```, která kromě základních stylů prvek označí. To může sloužit pro různé automatizované systémy nebo výpis obsahu stránky.

#pause

- Šest úrovní
#pause

- Úrovně by měly následovat jasnou hierarchii
#pause

- Úroveň ```html <h1>``` by _měla_ být v dokumentu *pouze jedna*
#pause

```html
<h1> Karlův blog </h1>
  <h2> Novinky </h2>
  <h2> Příspěvky </h2>
    <h3> Dovolená - Maďarsko </h3>
    <h3> Dovolená - Bulharsko </h3>
  <h2> Sociální sítě </h2>
```


== Textové značky
Značky pro obyčejný nebo významově zabarvený text. Pokud chceme pouze vložit text do dokumentu, můžeme jej psát přímo mimo jakékoliv značky. HTML automaticky ignoruje většinu nadbytečných bílých znaků v textu.

#pause
- Odstavce ```html <p> </p>```
  - Ucelený text na jedno téma, odsazené od obsahu

#pause
- Předformátovaný text ```html <pre> </pre>```
  - HTML zobrazuje vložený text 1:1 včetně všech bílých znaků

== Textové značky

#align(center, table(align:center+horizon, columns: (auto, auto, auto), inset: 16pt,
  [Vizuální efekt], [#strong[Ne]sémantická značka], [Sémantická značka],
  [_Kurzíva_], [```html <i> </i>```], [```html <em> </em>```],
  [*Zvýraznění*], [```html <b> </b>```], [```html <strong> </strong>```],
  [#strike[Přeškrtnutí]], [```html <s> </s>```], [```html <del> </del>```],
  [#underline[Podtržení]], [```html <u> </u>```], [```html <ins> </ins>```]
))

- Označení textu můžeme docílit také pomocí značky ```html <mark>```, většina prohlížečů takový text zvýrazní. 

== Výčty a seznamy
Výčet položek můžeme do dokumentu přidat značkou ```html <ol>``` _(ordered list, uspořádané)_ nebo ```html <ul>``` _(unordered list, neuspořádané)_. Jednotlivé položky pak chceme vkládat do značek ```html <li>``` _(list item, položka seznamu)_.

#pause
#columns(2)[

  ```html
  Nákupní seznam:
  <ul>
    <li> Brambory (5kg) </li>
    <li> Vazelína </li>
    <li> Gulášové koření </li>
  <ul>
  ```
  #pause
  #align(center, image("../media/ulist.png", height: 50%))
]

== Obalové značky
Obalové značky (_container_) slouží pro základní strukturování obsahu stránky. Obalové značky samy o sobě _nic_ nedělají, ale v kombinaci s _CSS (stylovací jazyk)_ umožňují stránku výrazně lépe formátovat.

#pause

- ```html <div> </div>```
  - blokový styl, _tzn. rezervuje *celý* řádek stránky_

- ```html <span> </span>```
  - řádkový styl, _tzn. rezervuje pouze potřebné místo na stránce_

#pause

Převážně se používá ```html <div>``` pro strukturu stránky a ```html <span>``` pro jednotlivé malé komponenty. 

== Odkazy
Odkazy (_hyperlink_) umožňují přidat text, který při kliknutí směruje na jinou část dokumentu nebo zcela jiný dokument.

#pause
Obecný tvar: ```html <a href="URL adresa na kterou odkazujeme"> text na stránce </a> ```

#pause
#grid(columns: (auto, auto), [

  ```html
  <a href="#top"> Nahoru </a>
  <a href="https://root.cz"> Root.cz </a>
  <a href="https://seznam.cz"> Seznam </a>
  ``` 
], [
   #align(center, image("../media/alinks.png", height: 50%))
])

== Speciální odkazy
Můžeme odkazovat i jinam než na stránky. Například:

- Emailové adresy ```html <a href="mailto:nekdo@domena.cz">```

- Telefonní čísla ```html <a href="tel:+420713123421">```

- JavaScriptový kód ```html <a href="javascript:alert('hello')">```

takový odkaz je zpracovaný registrovanou aplikací operačního systému. Případně můžeme zaregistrovat vlastní správce pro protokol (více v _JavaScript_ dokumentu).


= HTML atributy

== Co jsou to atributy
Atributy jsme nevědomky potkali už při _odkazech_. Jedná se dodatečné vlastnosti, které nějakým způsobem mění nebo rozšiřují funkce značek.

#pause
- Píšou se do `<>` (u párových značek do první podznačky) za jméno značky
  #pause
  - ```html <a href="..."> </a>```, v tomto případě je atribut _href_

  #pause
  - ```html <img src="image.png" alt="popis" />```, v tomto případě je atribut _src_ i _alt_

== Globální atributy
Podstatné globální atributy (je jich více) jsou:

#pause
- `class`, _řadí značku do třídy, můžeme potom použít pro provedení akce na celé třídě_

#pause
- `dir`, _určuje směr/orientaci toku textu vně značky_

#pause
- `id`, _přidá značce unikátní identifikátor_

#pause
- `hidden`, _značka se v dokumentu nebude vykreslovat_

#pause
- `lang`, _určuje jazyk textu ve značce_
  
= Struktura dokumentu
== Základní kostra dokumentu
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title> Název stránky </title>
  </head>

  <body>
    Obsah
  </body>
</html>
```

Většina chytrých editorů a IDE umí generovat (buď automaticky při vytvoření HTML souboru nebo nějakou kombinací ! a \\tab)

== !doctype
Upřesňuje o jaký formát souboru se jedná. Většinou se zde setkáme s hodnotou _html_, což je zkrácený zápis pro HTML verze 5 podle standardu _W3C_. Můžeme poněkud komplikovaným zápis zvolit i starší verze HTML (třeba kdybychom chtěli psát proč _hodně_ staré prohlížeče).

#pause
#info[
  Nejedná se o HTML značku (všimněte si, že není párová a uzavřená) ale o meta-informaci pro prohlížeč.
]
== HTML
Značkou ```html <html>``` chceme obalit celý obsah naší stránky společně s meta informacemi, skripty, styly, atd.. Obecně by html dokument měl být znázornitelný nějakým grafem (ideálně byz cyklů) a proto je vhodné, když máme pouze jeden kořenový prvek. Tím je právě ```html <html>```.

== Head
*Záhlaví* stránky definuje meta-informace dokumentu, které se zpravidla nijak přímo neprojevují na obsahu nebo vzhledu stránky#footnote[Nicméně nepřímo je ovlivnit je _de facto_ hlavním cílem]. Jmenovitě zde chceme:

- Nastavit název stránky - _zobrazuje se v prohlížeči na liště, v záložkách, ..._

#pause
- nastavit znakovou sadu stránky

#pause
- nastavit informace o _viewportu_ stránky

#pause
- připnout skriptové soubory

#pause
- připnout stylovací soubory

== Body
Další obalovací prvek, který obsahuje celý viditelný obsah stránky. Sem chceme psát většinu toho, co bychom na stránce chtěli zobrazit. 

== Záhlaví stránky
*Záhlaví* stránky většinou sestává ze jména a loga aplikace, navigačních odkazů po stránce anebo tlačítek pro přihlášení nebo registrování. Takovou část stránky oddělujeme značkou ```html <header>```. Samotné navigační odkazy pak můžeme dále separovat pomocí ```html <nav>```. 

== Hlavní obsah stránky
*Hlavní obsah*, _téma_, stránky vkládáme do značky ```html <main>```. Obecně vše, co není _záhlaví_, _zápatí_ nebo _postranní lišty_, by mělo být vložené v této značce.

== Sekce
Hlavní obsah dále můžeme dělit na sekce, tématicky podobné části dokumentu, značkou ```html <section>```. Sekce jsou zpravidla další úrovní organizace stránky, většinou se jedná o:

- 

- 

== Články
*Články* _(article)_ vymezené značkou ```html <article>``` nejsou čistě vyhrazené, jak by mohlo jméno napovídat, pro články, ale obecně pro libovolný text, který je vztažený k jedné logické myšlence. Jednotlivé články by měly být nezávisle čitelné od zbytku stránky.

== Vedlejší obsah stránky
.

== Zápatí stránky
*Zápatí* stránky je většinou rezervované pro odkazy na sociální média, krátké obchodní sdělení nebo slogan, _copyright_ nebo license.
Od zbytku stránky je oddělené značkou ```html <footer>```

= Multimédia

== 
HTML nativně podporuje vkládání multimediálního obsahu do dokumentů. V současné době můžeme vkládat:

- Obrázky

- Videa

- Audia

- Jiné stránky

== Obrázky
*Obrázky* vkládáme značkou ```html <img>```. Vše ostatní specifikujeme pomocí atributů. Jmenovitě chceme vždy nastavit:

#pause
- `src` - _zdroj obrázku (cesta k obrázku, odkaz na obrázek, ...)_

#pause
- `alt` - _text pro screen readery nebo v případě, že se obrázek nenačte_

#pause
- `width` nebo `height` - _nastaví šířku (výšku) obrázku v pixelech, pokud zadáme pouze jednu, druhá se automaticky naškáluje tak, aby se zachoval poměr stran_

#pause
V současné době HTML podporuje tyto formáty#footnote[#text(blue, link("https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types"))]:
- *WebP*, *AVIF*

- APNG, PNG, GIF, SVG, JPEG

== Videa
*Videa* vkládáme značkou ```html <video>```. Jedná se pouze o obalovou značku, do které musíme vložit zdroj videa značkou ```html <source>```. Vše ostatní specifikujeme pomocí atributů. Jmenovitě chceme vždy nastavit:

#pause
- `width` nebo `height` - _nastaví šírku (výšku) přehrávače v pixelech, pokud zadáme pouze jednu, druhá se automaticky naškáluje tak, aby se zachoval poměr stran_

#pause
- `controls` - _atribut bez hodnoty, jeho přítomnost v přehrávači zobrazí ovládání_

#pause
V současné době HTML podporuje tyto formáty#footnote[#text(blue, link("https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Containers"))]:

- *WebM*

- Ogg, MP4

== Videa s více zdroji
Pokud chceme pojistit úspěšné načtení videa, můžeme prohlížeči poskytnout více zdrojů, které postupně v případě neúspěchu vyzkouší.

```html
<video width="200" height="300" controls>
  <source src="movie.mpč" type="video/mp4"/>
  <source src="movie.ogg" type="video/ogg"/>
  Váš prohlížeč nepodporuje žádný náš formát!
</video>
```

#pause
Obvykle děláme kvůli podpoře různých formátů na různých prohlížečích.

== Audio
*Audia* vkládáme obdobně jako obrázky do značky ```html <audio>``` s atributy `src`, `autoplay`, `loop` nebo `controls`

#pause
V současné době HTML podporuje tyto formáty#footnote[#text(blue, link("https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Containers"))]:

- *MP3*

- Ogg, WAV

== IFrame
*IFrame* vytvoříme značkou ```html <iframe>```. Umožňuje nám do naší stránky vložit jinou stránku. Odkaz na cizí dokument vložíme do atributu `src` a velikost nastavíme pomocí atributů `width` a/nebo `height`. 

#pause
Stránky mohou zakázat zobrazování v IFrame, takže některé stránky zobrazitelné nejsou. Obvykle chcete připojovat takové stránky, které vám IFrame vygenerují (vkládáte video z YouTube, článek z novin, atd...).

= Tabulky

== Proč tabulky
Tabulky slouží k prezentaci dat v organizované 2 rozměrné tabulce. Často se s nimi můžeme setkat u správcovských panelů nebo výčtů položek. 

== Struktura tabulek
```html
<table>
  <caption> ... </caption>

  <thead> ... </thead>

  <tbody> ... </tbody>

  <tfoot> ... </tfoot>
</table>
```
#pause
*Popisek* _(caption)_ slouží k poskytnutí názvu/popisu tabulky. Zpravidla se vykresluje pod tabulkou zarovnaný doprostřed řádku.

== Komponenty
#pause
=== Záhlaví
*Záhlaví* _(head)_ tabulky udává jména/popisky jednotlivých sloupečků.

#pause
=== Obsah
*Obsah* _(body)_ obsahuje data, které tabulka presentuje.

#pause
=== Zápatí
*Zápatí* _(footer)_ zpravidla obsahuje shrnutí tabulky (_průměry, součty, počty, ..._) nebo znovu jména sloupečků.

== Datové buňky

#pause
=== Řádek
*Řádek* _(row)_ se v tabulce vytváří značkou ```html <tr>``` (_table row_).

#pause
=== Nadpisová buňka
Nadpisové buňky se v tabulce od normálních buněk liší v použítém tagu: ```html <th>``` (_table header_).

#pause
=== Datová buňka
Hlavní buňky označujeme ```html <td>``` (_table data_). Datové buňky můžeme roztáhnout na více řádků/sloupců pomocí atributů `colspan` a `rowspan`.

#pause
V HTML se tabulky orientují prvně podle řádků, to znamená, že nejdřív stvoříme řádek, do kterého pak vkládáme buňky.

= Další značky

== Všechny HTML značky
HTML značek je celá řada a nové se stále přidávají a ubírají. Aktuální seznam můžete nalézt třeba na Mozilla dokumentaci #text(blue, link("https://developer.mozilla.org/en-US/docs/Web/HTML")). 

= Speciální znaky

== Jak vkládat speciální znaky
Často se nám stává, že do naší stránky chceme vložit rezervované symboly `<>\/`, které mohou být problematické z hlediska vykreslování stránky. Proto takové znaky musíme zadat jiným způsobem.

#pause
HTML plně podporuje, při nastavení znakové sady, všechny _Unicode_ symboly.

Máme dvě, potažmo tři, možnosti jak speciální znak vložit:

#pause
- Číslem symbolu
  - např.: `&#8704;` $-> forall$

#pause
- Názvem entity
  - např.: `&alpha;` $-> alpha$

#pause
- Nerezervované symboly můžeme přímo vložit (např. emotikony)
  - 😵‍💫

== Ty nejběžnější

#grid(align: center+horizon, columns: (auto, auto, auto, auto, auto, auto, auto, auto), gutter: 10pt, inset: 15pt,
$copyright$, `&copy;`, $trademark.registered$, `&reg;`,
$euro$, `&euro;`, $trademark$, `&trade;`,
$suit.spade$, `&spades;`, $suit.heart$, `&hearts;`,
$forall$, `&forall;`, $diff$, `&part;`,
$emptyset$, `&empty;`, $sum$, `&sum;`,
$arrow.r$, `&rarr;`, $arrow.t$, `&uarr`
)