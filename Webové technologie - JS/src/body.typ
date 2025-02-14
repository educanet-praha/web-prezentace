#import "./globals.typ": *

#let small = (content) => {
  text(size: 8pt, content)
}

= JS Ekosystém

#focus-slide[
  Co to je JS
]

== Co to je JS

- #strong([J])ava#strong([S])cript #footnote[Navzdory jménu nemá nic společného s jazykem Java!]

- Skriptovací jazyk
  - Procedurální interpretovaný #footnote[Programátor nemusí kód kompilovat, může ho _hot-realodovat_]
  - Dynamicky typovaný #footnote[Jedná se o nejbenevolentnější typ dynamického typování vůbec, do jedné proměné můžeme ukládat různé typy]
  - O běh a vyhodnocování se stará prohlížeč#footnote[nebo spíše obecně nějaký _runtime_]
  - Umí ovlivňovat chování základních funkcí stránky
    - Zrušit akci tlačítek, obnovit stránku, stáhnout soubor, ...

- Spirituální následník PHP

== JS Runtime
JavaScript je interpretovaný jazyk, to znamená:
- Procesor jej neumí přímo vykonávat

- Potřebbujeme program, který umí překládat JavaScript od strojových instrukcí

Máme několik implementací:
- *NodeJS* (V8)

- Deno (V8)

- Bun (JSCore)

- ...

== Kde čerpat
- #text(fill: blue, link("https://developer.mozilla.org/en-US/docs/Web/JavaScript"))

- #text(fill: blue, link("https://javascript.info/"))

- #text(fill: blue, link("https://www.javascripttutorial.net/"))

- GeeksForGeeks, W3Schools, TutorialPoint, ITNetwork, ...

= Základy jazyka

== Výpis do konzole
Obdobně jako v ostatních jazycích máme zpřístupněný zápis do konzole. V JS nám to umožňuje globální statický objekt ```js console```, který poskytuje metody:
```js 
console.log("");
console.debug("");
console.error("");
console.info("");
```

a pár dalších metod

=== Čtení z konzole

Čtení z konzole obecně v JavaScriptu možné *není*.

== Striktní režim
Stejně jako v HTML můžeme zakázat `weird režim`, můžeme JS donutit odmítnout každý kód, který není _hezký_

```js
"use strict";
```

== Proměnné
Proměnné v JS vytváříme pomocí:
#pause
- ```js let```
  - Omezuje proměnnou na rozsah bloku
#pause
- ```js const```
  - Vytváří konstatní hodnotu v bloku
#pause
- ```js var```
  - _Deprecated_, pro staré prohlížeče a špatné programátory

```js
let a = 0;
const a = 2;
var a = 2;
```
  
== Proměnné
Datové typy
#align(horizon)[
- String

- Number

- BigInt

- Boolean

- object

- undefined

- null
]

== Number
- Čísla v JavaScriptu se nedělí na menší, větší, desetinné, ...

- Všechna čísla jsou jeden datový typ

- Binární operace $+, -, *, \/, \*\*, >, <$

- Unární operace $++, --$

```js
let a = 3;
let b = 5;
console.log(a**b);    // 3^5 = 243
console.log(a/b);     // 0.6
console.log(++a);     // 4
```

== String
- Datový typ znázorňující *TEXT*

- Definice hodnoty přes \"\_\" _nebo_ \'\_\' 

  - ```js let myText = "Content of my string";```

  - ```js let myText = 'Content of my string';```

- Speciální hodnota přes \`\_\`
  
  - Umožnuje vkládat proměnné do textu

  - ```js let myText = `My text with value: ${variable}` ```

- Má jeden atribut: `length`

== Základní operace na Stringu
- ```js String.charAt(index)```

- ```js String.endsWith(pattern)```

- ```js String.includes(pattern)```

- ```js String.indexOf(pattern)```

- ```js String.replace(pattern, withPattern)```

- ```js String.split(pattern)```

- ```js String.toLowerCase()```

- ```js String.trim()```

== BigInt

- Dodatečný čeločíselný datový typ pro velká čísla.

- Maximální _*bezpečná*_ hodnota pro ```js number``` je $9'007'199'254'740'991 = 2^53 - 1$

- Vytváříme pomocí: ```js BigInt(0)``` nebo ```js 0n```

- Můžeme používat běžné operace, ale pouze mezi stejným datovým typem

- Prakticky to nikdy asi nevyužijete

== Array

- Diskrétní bloky paměti pro uložení více hodnost (stejného) datového typu

- *Dynamická* velikost a *0*-indexované

- přístup pomocí speciálního operátoru `[index]`

- Podporují `sparse-filling`

- Můžeme vytvořit pomocí:
```js
let empty_array = [];
let populated_array = [2, 1, 5, 2, 5, 8];

// Případně pomocí konstruktoru `Array` třídy
let empty = Array(100);
```

== Operace na polích
- ```js Array.length```

- ```js Array.at(index)``` (ekvivalentní jako `[index]`)

- ```js Array.flat()```

- ```js Array.includes(element)```

- ```js Array.indexOf(element)```

- ```js Array.push(element)```

- ```js Array.pop()```

- ```js Array.sort()```

== Konstantní pole?
Konstrukt ```js const a = [1, 5, 14, 6];``` nutně nedělá to, co byste si mohli myslet. Konstantní je symbol `a` jako takový, nicméně obsah toho symbolu modifikátorem ```js const``` už vázaný není. #pause To znamená:

```js
const a = [1, 5, 14, 6];

// TOHLE HODÍ ERROR
a = [4, 2, 6];

// tohle normálně proběhne
a[2] = 1;       // a = [1, 5, 1, 6]
a.push(14);     // a = [1, 5, 1, 6, 14]
```

== Boolean
- Hodnota logického výroku: ```js true | false```

- *Každá* hodnota v JS je buď ```js true``` (truthy) nebo ```js false``` (falsy)
  - Všechno je truthy, pokuď to není falsy
  - Falsy jsou#footnote[navíc ještě: ```js -0, 0n, document.all```, které jsou trochu neobvyklé, nebo bychom nečekali, že budou mít false hodnotu]: ```js false, 0, "", null, undefined, NaN```

- Každá proměnná použítá v Boolean kontextu se převede na ```js true``` nebo ```js false```

- Máme klasické operace: ```js | (or), & (and), ! (not)```
  - ```js &&``` a ```js ||``` pro _short-circuit_ verze

== _Atypické_ chování výroků

#align(left+horizon)[
  #grid(columns: (50%, 50%), align: top, [
    ```js [] && "foo"``` -> ```js "foo"``` #linebreak()
    ```js true && "foo"``` -> ```js "foo"``` #linebreak()
  ], [
    ```js 0 && "foo"``` -> ```js 0``` #linebreak()
    ```js false && "foo"``` -> ```js false``` #linebreak()
  ])

  #linebreak()

  #pause

  #grid(columns: (50%, 50%), align: top, [
    ```js NaN``` -> ```js false``` #linebreak()
    ```js NaN == false``` -> ```js false``` #linebreak()
  ], [
    ```js []``` -> ```js true``` #linebreak()
    ```js [] == false``` -> ```js true``` #linebreak()
  ])

  #linebreak()
  #pause

  #grid(columns: (50%, 50%), align: top, [
    ```js [] == false``` -> ```js true``` #linebreak()
    ```js "0" == false``` -> ```js true``` #linebreak()
    ```js "" == false``` -> ```js true``` #linebreak()
  ], [
    ```js [] == "0"``` -> ```js false``` #linebreak()
    ```js "0" == ""``` -> ```js false``` #linebreak()
    ```js "" == []``` -> ```js false``` #linebreak()
  ])
]

== Proč se ```js ==``` chová tak divně? 

JavaScript se automaticky snaží vyhovět tomu, co ho nutíme dělat, takže pokud chceme porovnat dva různé datové typy, automaticky je oba překonvertuje.

Stejný "problém" máme například i u sčítání a odčítání.

#v(90pt)

```js "1" + 1``` -> ```js "11"```

#pause

```js "1" - 1``` #pause -> ```js 0```

== Striktní rovnost

Abychom vyřešili vzniklé problémy s porovnáváním datových typů a hodnot, můžeme v JS použít operátor striktní rovnosti: ```js ===```

- Stejně jako ```js ==``` vrací `Boolean`

- *Pro dva různé typy vždy vrací ```js false```*

- Pro dva objekty vrací ```js true``` pouze pokud odkazují na stejný objekt

- ```js null``` se rovná pouze jinému ```js null```, stejně tak pro ```js undefined```

- Pro ```js NaN``` vrací ```js false```

- Jinak porovnává stejně jako ```js ==```


== Tabulka rovností
#align(center,image("../media/eqtable.png"))

== undefined & null
- Značí absenci hodnoty

- ```js undefined``` je hodnota *neinicializovaných* proměnných

- ```js null``` je *explicitní* absence hodnoty

- "```js void```" funkce vrací ```js undefined```

- V současné době je tendence ```js null``` a ```js undefined``` nahradit

== Zvláštní undefined & null operátory

=== Optional chaining
*`?.`* pro volání metod na objektech, které mohou být ```js null``` nebo ```js undefined```. Metoda/atribut se zavolá pouze pokud objekt má hodnotu, jinak se hnedka vrátí undefined

```js
let car = undefined;
let speed = car?.speed;   // tohle by jinak byl error
```

#pause
=== Nullish coalescing
*`??`* pokud je levá strana ```js null``` nebo ```js undefined``` vrátí pravou stranu, jinak vrací levou
```js
let car = undefined;
function_that_requires_a_value(car ?? dummy_car);
```

== Objekt

- Anonymní objekty
 - Nemá jasně definované atributy, můžeme volně měnit

- Třídy
  - Předem známá definice atributů a metod


== Anonymní objekty

```js 
let person = { 
  name: "Leonhard Euler",
  age: 318
};

person.name;   // "Leonhard Euler"
person.age;    // 318
person.job;    // undefined

person.job = "Mathematician";

person.job;    // "Mathematician"
```


== Třídy v JS
```js
class Rectangle {
  constructor(widht, height) {
    this.width = width;
    this.height = height;
  }
  calculate_area() {
    return this.height * this.width;
  }
  get area() {
    return this..calculate_area();
  }
}
```

== JSON
JSON (JavaScript Object Notation) je _snad_ nejpoužívanější formát pro webovou komunikaci.
- Syntakticky se jedná o anonymní objekt

- Kompromis počítačové a lidské čitelnosti

- Nepodporuje komentáře

== JSON příklad

```json
{
  name: "Leonhard Euler",
  age: 25,
  friends: [
    "Jacob Bernoulli",
    "Christian Goldbach"
  ],
  address: {
    city: "Königsberg",
    state: "Prussia"
  },
  job: "Mathematician"
}
```

= Control flow

== Podmínky
- Klasické ```js if () { } else if () { } else { }```

- `{ }` vytváří vlastní scope

- Podmínka v ```js if``` je Booleanovský výrok
  - Můžeme používat `truthy` a `falsy` hodnoty
  - Hodnota vrácená výrokem se vyhodnotí na `truthy `a `falsy`

- Ve větveném ```js if else if else``` se vykoná vždy pouze jedna větev

== Ternární operátor
- Trojvstupový operátor

- Syntaxe: ```js x ? a : b```
  - ```js boolean ? true : false```

```js
let x = 4;
let a = x > 5 ? "x je větší jak 5" : "x je menší jak 5";
// a = "x je menší jak 5"
```

== Cykly
#pause
-  ```js while``` 
  - nedeterministický počet iterací
  
  - ```js while (x < 15) { ... }```

  - Máme i ```js do { ... } while();```

#pause
- ```js for```
  - Známý počet iterací

  - ```js for (let i = 0; i < 9; i++) { ... }```

  - ```js for (const number of myArray) { ... }```

  #pause
- ```js break``` pro předčasné ukončení běhu
- ```js continue``` pro přeskočení této iterace

== Funkce

- Definují proceduru

- Mají vstupy ($>= 0$) a výstup ($<= 1$)

- Formát: ```js function jméno_funkce(param1, param2) { tělo funkce }```

  - Nedefinujeme návratový typ ani typ parametrů

```js
function power(base, exponent) {
  let a = base;
  for (let i = 1; i < exponent; i++)
    a * base;
  return base;
}
```

== Anonymní funkce
Pokud funkci potřebujeme posílat do jiných funkcí, nebo ji použijeme pouze na nějakém místě. Takovým funkcím se často říká `lambda` funkce.

```js
let power = (base, exponent) => { 
  let a = base;
  for (let i = 1; i < exponent; i++)
    a * base;
  return base;
};
```

= Interfacování s HTML

== ```js document``` globální instance

- Poskytuje metody pro práci s HTML dokumentem

- HTML se interně ukládá jako DOM#footnote[Document Object Model, později si povíme více]

- Posktuje metody pro:
 - Vybírání konkrétního elementu

 - Čtení/zapisování hodnot

 - Dynamické změny struktury dokumentu

 - Čtení metainformací o dokumentu, prohlížeči, hostovém systému

== Klíčové metody a atributy ```js document```

- ```js Document.body```

- ```js Document.getElementsBy```
 - ```js Id()```
 
 - ```js ClassName()```
 
 - ```js TagName()```

- ```js Document.title```

- ```js Document.createElement()```

- ```js Document.append()```

== Jak pracovat s ```js Node``` a ```js Element``` typy

Node znázorňuje obecný prvek na stránce, který je součástí `DOM`. Poskytuje metody jako:

- ```js Node.appendChild()```

Element je konkrétnější značka nebo blok na stránce

- ```js Element.id```
- ```js Element.className```
- ```js Element.innerHTML```
- ```js Element.innerText```
- ```js Element.outerHTML```

- ```js Element.remove()```

== Příklady

Smazání všech divů ( a jejich potomků )
```js
let allDivs = document.getElementsByTagName("div");

for (const el of allDivs) {
  el.remove();
}
```

== Milovaná šachovnice

```js
let root = document.getElementById("chessboard_container")
for (let i = 0; i < 8; i++) {
  let row = document.createElement("div");
  for (let j = 0; j < 8; j++) {
    row.appendChild(document.createElement("div"));
  }
  root.appendChild(row);
}
```

== ```js window.onload```
Kód, který manipuluje se stránkou chceme spouštět až tehdy, kdy se obsah stránky načte, k tomu slouží _callback_ ```js window.onload```, dokterého pošleme šipkovou funkci, která se vykoná po načtení celého obsahu.

```js
window.onload = () => {
  // tělo funkce
};
```


== Eventy
Event (událost) je spuštěná nějakou akcí uživatel nebo prohlížeče. Prohlížeč pak automaticky zavolá všechny registrované handlery (obsluhy).

HTML akce jsou například: 
- Focus

- Drag & Drop
- Input
- Mouse
- Touch
- Time

== Jak zaregistrovat obsluhu události

Obsluhu můžeme zaregistrovat na objektech, která mají rozhraní `EventTarget`. To jsou nejběžněji ```js Element```, ```js Window``` a ```js Document```.

```js
document.addEventListener("click", (event) => {
  console.info("User clicked somewhere");
});

my_div.addEventListener("dblclick", (event) => {
  console.info("User double clicked my_div");
});
```

== Local Storage
Pro ukládání obecných dat, které přetrvávají přes více relací, mužeme využít lokální uložiště stránky. Přístup k objektu, který takové rozhraní poskytuje, máme přes `window.localStorage`

- Do uložiště si můžeme ukládat hodnoty ve formátu: klíč - hodnota

- Uživatel je může kdykoliv smazat

- Data jsou přístupná pouze z naší stránky

- Maximálně $5$MiB

== Ukládání do local storage

```js
let storage = window.localStorage;

storage.getItem("user_id");             // null

storage.setItem("user_id", "0123_4567_89ab_cdef");
storage.getItem("user_id");             // "0123_4567_89ab_cdef"

storage.removeItem("user_id");
storage.clear();
```

= HTML ```html <input>``` & ```html <button>```

== ```html <input>```
Vrátíme se na chvíli do HTML, kde si ukážeme jednu z posledních značek: ```html <input>```.

- Vstup od uživatel
  - Text

  - Číslo
  
  - Datum
  
  - Checkbox
  
  - obrázky

== Atributy značky:
```html type```: button, *checkbox*, color, date, email, file, image, *number*, *password*, range, search, *submit*, tel, *text*, time, url, ...

- ```html disabled, readonly```

```html
<input type="text" readonly disabled />
```

- ```html min, max, minlength, maxlength```
```html
<input type="number" min="0" max="20" />
```

- ```html value ```
```html
<input type="text" value="Some default value" />
```

== Čtení ze vstupu
```html
<input id="username" placeholder="John Doe" maxlength="32" />
```

```js
const input_element = document.getElementById("username");
const username = input_element.value;
```

== Formuláře
Pokud máme více vstupů, které patří k sobě, mužeme je (a zpravidla chceme) zabalit do značky ```html <form>```. Co dělá:

- Umožňuje přidávat komplexní validace

- Odesílat formulář
  - Všechny vstupy dohromady

- Vyplňovací nástroje _apod_. s tím umí lépe pracovat #footnote[#link("https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#autofill")]


```html
<form name="login" action="" method="post" autocomplete="on">
  <input type="text" autocomplete="username" required />
  <input type="password" autocomplete="current-password" required />
</form>
```

== Validace formulářů
- Nejedná se o absolutní validaci všech dat!

- Všechno probíhá na klientu (v prohlížeči)
 - > schopný uživatel to může obejít

- Co máme k disposici:
  - `required`
  - `min, max, step, minlength, maxlength`
  - `type`
  
  - _*`pattern`*_

== Zkusme si to
Chceme aby uživatel zadal slovo `banán` nebo `hruška` a k tomu celé číslo mezi 1 a 25:

#pause

```html
<form>
  <input type="text" name="fruit" pattern="banán|hruška" required />
  <input type="number" name="count" min="1" max="25" step="1" required />
</form>
```

```css
input:invalid {
  border: 1px solid #f00;
}

input:valid {
  border: 1px solid #0f0;
}
```

== Co je pattern (RegEx)

- alfanumerické znaky: *a-z A-Z 0-9*

- výběr: 
  - jeden ze skupiny: *[abcd]*

  - logické nebo *ab|cd*

- počty
  - nula a více: *\**
  
  - jeden a více: *+*
  - nula nebo jeden: *?*
  - konkrétní rozsah: *{1, 3}*

Interaktivní příklady: #link("https://regexr.com/")

== Vlastní validační hlášky

```html
<form>
  <input required
    oninput="this.setCustomValidity('')"
    oninvalid="this.setCustomValidity('Invalid entry')">
</form>
```

Jak reagovat na konkrétní chybu?
> JavaScript

== Form action
Jak odeslat formulář?

1. Nechat prohlížeč odeslat dotaz na vzdálený server
  - Nastavíme `method` podle požadovaného dotazu
  
  - Prohlížeč automaticky pošle všechny vstupy z formuláře pod klíčy `name`
  
2. Zpracovat vstupní data samostatně
  - #strong[Ne]nastavíme `method` ani `action`

  - V JS přiložíme `eventListener` na `submit` event na formulář

= NPM

== Inicializace projektu
```sh
$ mkdir muj_projekt
$ npm init
```

Zapne se _setup wizard_, který po vá#box(fill: maroon, width: 20pt, height: 20pt, baseline: 6pt)s bude chtít:
- package name: _název projektu/aplikace_ 
- version: _počáteční verze_
- description: _popis obsahu/cíle projektu_
- entry point: _vstupní `.js` soubor_
- test command: _příkaz pro spuštění testů_
- git repository: _název git repozitáře projektu_
- keywords: _klíčová identifikační slova_
- author: _jména a adresy autorů_
- license: _Licence, pod kterou je projekt publikovaný_
_Descrption, Keywords, Author_ a _License_ pro osobní projekty vyplňovat nemusíte

== Přídávání balíčků
```sh $ npm install package_name@version```

`@version` je dobrovolný argument, v případě, že není specifikován, se zvolí poslední stabilní verze balíčku

`--save-dev` pokud se jedná pouze o vývojářský dependency (typicky preprocessory a packagery)

== Základní kostra HTML/SCSS/JS

- Přidat balíčky: `webpack webpack-cli sass sass-loader css-loader mini-css-extract-plugin`

- Vytvořit adresář `src/` a `dist/`
  - v `src/` vytvořit soubory `index.scss` a `index.js`, který importuje `index.scss`
  - v `dist/` vytvořit soubor `index.html`, který nalinkuje soubor `main.js` a `styles.css` z adresáře `dist/`

- V `package.json` přidat script `build`: `webpack --mode='development'`

- V kořenovém adresáři vytvořit soubor `webpack.config.js` #small[viz další stránka]

#pagebreak()

```js
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
module.exports = {
  module: { rules: [{
    test: /\.s[ac]ss$/i,
    use: [
      MiniCssExtractPlugin.loader,
      "css-loader", "sass-loader"
    ]
  }]},
  plugins: [ new MiniCssExtractPlugin({
    filename: "styles.css"
  })]
};
```

= Pokročilé typy a kolekce

== Množiny (Set)
Matematická množina (seznam), která umožňuje každý prvek obsáhnout nanejvýše jednou.

- Garantuje zachování pořadí vložení
```js
const set = new Set([1, 2, 5, 2]); // [1, 2, 5]
set.add(3); // [1, 2, 5, 3]
set.add(1); // [1, 2, 5, 3]

set.remove(2); // [1, 5, 3]

set.has(5); // true
```

== Slovníky (Map)
Asociovaný seznam klíčů a hodnot, podobně jako obyčejné objekty.

- Každý klíč smí v mapě být pouze jednou
  - Duplicitní klíč přepíše původní hodnotu

- Narozdíl od map ve většině jazyků garantuje pořadí vložených klíčů

- Umožňuje mazání klíčů

```js
const map = new Map();
map.insert("Pepa", 10);
map.insert("Klara", 20);
map.insert("Karel", 30);
// [ "Pepa" -> 10, "Klara" -> 20, "Karel" -> 30 ]
map.get("Klara"); // 20
map.delete("Karel")
```

== Čas
Jak znázornit čas v počítači?

#pause

=== Unixový čas
Sekundy od Epochy (1970-01-01 00:00:00UT)

Milisekundy se nesynchronizují, každý počítač si řeší vlastní, obecně není potřeba je ukládat

#pause

=== Microsoft Windows$trademark$

1. Stovky nanosekund od 1601-01-01 
2. String formátu rok/měsíc/den/hodina/minuta/sekunda/milisekunda

== Problém s časem
- Y2k

- Y2k38

- Y292G

- Přestupný čas
  - Roky
  
  - Vteřiny

== Datové typy času v JS
JavaScript poskytuje, narozdíl od řady jiných jazyků, pouze jednu strukturu pro znázornění času: ```js Date```.

- Interně _Unixová epocha_.

- Vstup i výstup jsou formátované podle časové zóny prohlížeče


== Formáty času

```js
new Date()
new Date(date string)

new Date(year,month)
new Date(year,month,day)
new Date(year,month,day,hours)
new Date(year,month,day,hours,minutes)
new Date(year,month,day,hours,minutes,seconds)
new Date(year,month,day,hours,minutes,seconds,ms)

new Date(milliseconds)
```

= Výjimky

== Try {} catch {} finally {}
Stejně jako v celé řadě dalších jazyků máme `try` `catch` konstrukt pro odchytávání výjimek. Pokud nějaká část kódu v `try` bloku vyhodí výjimku, tak se ihned zavolá blok catch s odpovídajícím error jako parametrem. Na konci vykonávání kódu (ať už s výjimkou nebo bez) se zavolá block `finally`

```js
try {
  open_file();
  write_to_file();
} catch (e) {
  handle_expection(e);
} finally {
  close_file();
}
```

== Vlastní výjimky
Vlastní výjimky můžeme vyhazovat pomocí klíčového slova ```js throw```.
- Hodnotou:
```js
throw 500;
throw "muj vlastni error";
```

- Třídou ```js Error```
  - Error
  - RangeError
  - ReferenceError
  - SyntaxError
  - TypeError
  - URIError
```js
new Error("Some descriptive message");
```
