// Touying main package 
#import "@preview/touying:0.5.5": *;
#import themes.metropolis: *;

// Numbly for better numbering
#import "@preview/numbly:0.1.0": numbly;

// Codly for displaying code blocks with syntax highlighting
#import "@preview/codly:1.0.0": *;

// Pinit for pointing to a text/image on a slide
#import "@preview/pinit:0.2.0": *;

// Cetz for drawing complex graphs and images
#import "@preview/cetz:0.3.1";

// Ctheorems for theorems, definitions and dictionary
#import "@preview/ctheorems:1.1.3": *;

// Diagraph for drawing vertex graphs
#import "@preview/diagraph:0.3.0"

// Equate for better typst equations
#import "@preview/equate:0.2.1": equate

// Gentle clues for simple boxes
#import "@preview/gentle-clues:1.1.0": *

// Text utilities
#import "./utils/text.typ": *

// Icon function for display small icon from ./media/icons/.svg
#let icon = (ico) => {
  box(
    baseline: 2pt,
    image("../media/icons/" + ico + ".svg", width: 20pt)
  );
};

// Language name and icons configuration
#let codly-lang-config = (
    java:       (name: "Java",        icon: icon("java"), color: rgb("#CE412B")),
    python:     (name: "Pseudokód",   icon: icon("pseudo"), color: rgb("#fafaaa")),
    rust:       (name: "Rust",        icon: icon("rust"), color: rgb("#CE412B")),
    javascript: (name: "JavaScript",  icon: icon("js"), color: yellow ),
    go:         (name: "Go",          icon: icon("go"), color: teal  ),
    csharp:     (name: "C#",            ),
    html:       (name: "HTML",        icon: icon("html"), color: orange),
    css:        (name: "CSS",         icon: icon("css"), color: blue),
    sh:         (name: "Shell",       icon: icon("shell"), color: silver)
);

// Cetz canvas setup
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true));

// Theorems setup
#show: thmrules.with(qed-symbol: $square$);
#let theorem = thmbox("theorem", "Věta", fill: teal.transparentize(70%));
#let corollary = thmplain(
  "corollary",
  "Důsledek",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definice", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Příklad").with(numbering: none)
#let proof = thmproof("proof", "Důkaz")