#import "./src/globals.typ": *  

#set text(lang: "cs", font: "Comic Neue Angular", hyphenate: true)

#show: codly-init.with()
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "rovnice")

#show: metropolis-theme.with(
  aspect-ratio: "16-9",

  config-info(
    title: [Úvod do HTML],
    subtitle: [],
    author: [Sedláček Pavel],
    date: datetime.today(),
    institution: [EDUCAnet],
    logo: image("media/educanet_logo.png", height: 32pt),
  ),
  config-common(
    handout: true,
    preamble: {
      codly(languages: codly-lang-config)
    }
  ),
  config-colors(
    primary: rgb("#4E4187"),
    primary-light: rgb("#2EBFA5"),
    secondary: rgb("#0C1821"),
    neutral-lightest: rgb("#FAFFFD"),
    neutral-dark: rgb("#342E37"),
    neutral-darkest: rgb("#011C27"),
  )
);


#title-slide()

== Obsah

#components.adaptive-columns(outline(title: none, indent: 1em, depth: 1, fill: ""))

#set heading(numbering: numbly("{1}", default: "1.1"))

#include "./src/body.typ"
