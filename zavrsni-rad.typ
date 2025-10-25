// У овом фајлу је потребно да укључите поглавља. Видети TODO доле.
// Такође, видите metadata.typ

#import "metadata.typ": *
#set page(paper: format_strane, margin: (y: 2.5cm, inside: 2cm, outside: 1.5cm))
#include "naslovna.typ"
#pagebreak()
#pagebreak()
#include "zadatak.typ"
#pagebreak()
#pagebreak()
#include "kljucna.typ"
#pagebreak()
#include "sukob-interesa.typ"

#set text(lang: "sr")
#show link: set text(blue)
#show cite: set text(blue)
#show ref: set text(blue)

// Dijakritika sa srpskim kurzivom
#set document(title: "Наслов рада", author: "Аутор")
#set text(font: "Dijakritika", size: 11pt, features: ("locl", "cv02", "cv04"))

// Uvlacenje prvog reda za svaki pasus
#set par(justify: true, first-line-indent: (amount: 1cm, all: true), spacing: 0.65em)

// Liste i nabrajanja
#set list(
  indent: 1.1cm,
  body-indent: 0.3cm,
  spacing: 0.65em,
  marker: ([•], [◦])
)
#set enum(
  indent: 1.1cm,
  body-indent: 0.3cm,
  spacing: 0.65em,
  numbering: "1.",
  number-align: start
)
// Liste drugog nivoa
#show list.item: it => {
  show list: nested => {
    block(nested)
  }
  show enum: nested => {
    block(inset: (left: 0.1cm), nested)
  }
  it
}
#show enum.item: it => {
  show list: nested => {
    block(inset: (left: 0.1cm), nested)
  }
  show enum: nested => {
    block(inset: (left: 0.1cm), nested)
  }
  it
}

// Formatiranje listinga
#show raw.where(block: true): it => pad(y: 1em, it)

// Naslovi
#set heading(numbering: "1.1")
#show heading: set text(font: "Optina Display", weight: "regular", hyphenate: false, features: ("locl", "cv02", "cv04"))
#show heading: set block(below: 0.65em, above: 2em)
#show heading: it => it + par(text()[])
#show heading.where(level: 1): (it) => {
    pagebreak(to: "odd", weak: true)
    v(3em)
    set block(spacing: 8pt)
    set par(justify: false)
    if heading.numbering != none {
      // ako zelite da se prikazuje broj poglavlja, koristite donju liniju
      // rect(align(right + horizon, text(counter(heading).display() + ". " + it.body, size: 22pt)), fill: white, width: 100%)
      rect(align(right + horizon, text(it.body, size: 22pt)), fill: white, width: 100%)
    } else {
      rect(align(right + horizon, text(it.body, size: 22pt)), fill: white, width: 100%)
    }
    v(1em)
    par(text()[])
}
#let heading-formatter(size) = (it) => {
    v(1.5em)
    set par(justify: false)
    if heading.numbering != none {
      text(counter(heading).display() + ". " + it.body, size: size)
    } else {
      text(it.body, size: size)
    }
    v(0.5em)
}
#show heading.where(level: 2): heading-formatter(14pt)
#show heading.where(level: 3): heading-formatter(12pt)

// slike, tabele, listinzi
#show figure.where(kind: table): it => {
    set figure.caption(position: bottom)
    v(1em)
    it
    v(1em)
}
#show figure.where(kind: image): it => {
    v(1em)
    it
    v(1em)
}
#show figure.where(kind: raw): it => {
    set figure(supplement: [Листинг])
    v(1em)
    it
    v(1em)
}
#set ref(supplement: none)


#outline(title: [Садржај], depth: 2)

#set page(footer: context {
  if calc.odd(here().page()) {
      align(right, text(counter(page).display()))
  } else {
      align(left, text(counter(page).display()))
  }
})

#pagebreak(to: "odd", weak: false)
#set heading(numbering: "1.1")
#set page(numbering: "1")
#counter(page).update(1)


// TODO: Овде укључујете поглавља
#include "poglavlja/1-uvod.typ"
#include "poglavlja/2-stanje.typ"
#include "poglavlja/7-zakljucak.typ"


// Naslovi posle glavnog dela teksta
#set heading(numbering: none)
#show outline: set heading(outlined: true)
#context {
    if query(figure.where(kind: image)).len() > 0  [
        = Списак слика
        <spisak-slika>
        #outline(title: none, target: figure.where(kind: image))
    ]

    if query(figure.where(kind: image)).len() > 0  [
        = Списак листинга
        <spisak-listinga>
        #outline(title: none, target: figure.where(kind: raw))
    ]

    if query(figure.where(kind: table)).len() > 0  [
        = Списак табела
        <spisak-tabela>
        #outline(title: none, target: figure.where(kind: table))
    ]
}

#show figure: it => {
    set text(size: 9pt)
    set block(breakable: true)
    set table(
        columns: (1fr, 4fr),
        align: left,
        inset: 8pt,
        stroke: 0pt)
    it
}

// Додаци - искоментарисати ако се не користе
// #include "poglavlja/dodatak 1 - skracenice.typ"
// #include "poglavlja/dodatak 2 - pojmovi.typ"

#include "biografija.typ"

#bibliography(title: [Литература], "literatura.bib")

// Потребне исправке и дораде. У тексту користити са
// #todo[Коментар шта треба урадити]
// Функција todo се налази у модулу funkcije.typ
#todos()
