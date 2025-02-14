#import "./globals.typ": *

= Základy CSS

== Co to je CSS

- #strong[C]ascading #strong[S]tyle #strong[S]heet
  - _Káskádové_ stylovací archy

- Definuje styly (grafiku) HTML dokumentů

- Univerzální formát, který se používá i u jiných typů dokumentů

- Každý prohlížeč zpracovává CSS trochu jinak

  - Většina stylů má standardní chování

== Jak propojit CSS s HTML dokumentem

=== Vložit obsah CSS přímo do HTML dokumentu
```html
<head>
  <style>
    myButton { background: red; }
  </style>
</head>
```
=== Připojit CSS soubor k HTML dokumentu
```html
<head>
  <link rel="stylesheet" href="myCSSFile.css"> 
</head>
```

== Selektory

=== *id* atribut
- Vybere jeden konkrétní prvek s požadovaným _id_ atributem
- Speciální znak *`#`* _(hashtag)_ + hodnota atributu

=== *class* atribut
- Vybere všechny prvky, které mají požadovaný _class_ atribut
- Speciální znak *`.`* _(tečka)_ + hodnota atributu

=== značka HTML
- Vybere všechny prvky, které jsou požadovaná značka
- Název značky

=== _wildcard_
- Vybere všechny prvky
- Speciální znak *`*`*

== Příklady CSS selektorů
=== id
```css
#my_unique_div { ... }
```

=== class
```css
.all_my_user_pictures { ... }
```

=== značka
```css
div { ... }
```

=== wildcard
```css
* { ... }
```

= Jednotky

== Velikost
=== Absolutní jednotky
- cm, mm, in - _při 100% oddálení by měly odpovídat skutečné velikosti_

- px, pt, pc

=== Relativní jednotky
- em, ex, ch, rem - _vztažené k velikosti písmen ve fontu_

- vw, vh, vmin, vmax - _vztažené k velikosti viewportu_

- % - _vztažené k velikosti předka_

== Barva

=== Názvem
- HTML zná spoustu barev jménem
- maroon $->$ #box(fill: maroon, width: 20pt, height: 20pt, baseline: 6pt)
=== RGB
- Zápisem složek R (red) G (green) B (blue)
- $"rgb"(250, 120, 50) ->$ #box(fill: rgb(250, 120, 50), width: 20pt, height: 20pt, baseline: 6pt)
=== HSL
- Zápisem H (hue) S (saturation) L (lighntess)
- $"hsl"(120deg, 200, 230) ->$ #box(fill: color.hsl(120deg, 200, 230, 255), width: 20pt, height: 20pt, baseline: 6pt)

== Hexadecimálně
- Zápisem RGB ale v hexadecimální soustavě
- $#"ffaacc" ->$ #box(fill: rgb("#ffaacc"), width: 20pt, height: 20pt, baseline: 6pt)

Hexadecimální soustava potřebuje 16 znaků, využijeme 0-9a-f, 0 má hodnotu 0, f hodnotu 16.

Pro zápis každé složky využíváme 8bitů (hodnoty od 0 do 255), kde vyšší hodnoty přispívají danou složkou více.

#align(center, image("../media/rgb.png", height: 45%))

== Další jednotky
=== Úhly

=== 

== Základní styly
- Font
  - Velikost
  - Styl

- Barva
  - Pozadí
  - Textu
  - Rámečku

- Rámečky
  - Styl
  - Zaoblení

- Odsazení
  - Margin
  - Padding

  
== Font

=== Rodina

=== Velikost

=== Barva

=== Váha


== Rámečky

=== Barva

=== Styl

=== Zaoblení

=== Tloušťka


== Odsazení

=== Margin

=== Padding


= Meta selektory

== ```css @font-face```
.

= Animace

== ```css @keyframes```
.