// === GLOBAL HEADING STYLES ===
// These `#show` rules ensure that all headings have a consistent style across the document.

// Heading 1
#show heading.where(level: 1): it => block(width: 100%, above: 0pt, below: 11pt)[
  #text(size: 26pt, font: "Norad Display")[ #it ]
]

// Heading 2
#show heading.where(level: 2): it => block(width: 100%, above: 16pt, below: 14pt)[
  #text(size: 16pt, font: "Norad Serif")[ #it ]
]

// Heading 3
#show heading.where(level: 3): it => block(width: 100%, above: 12pt, below: 14pt)[
  #text(size: 12pt, font: "Norad Sans", fill: rgb(0x03, 0x54, 0x2d))[ #it ]
]

// Heading 4
#show heading.where(level: 4): it => block(width: 100%, above: 12pt, below: 2pt)[
  #text(size: 10pt, font: "Norad Sans")[ #it ]
]

// === FIGURE CAPTION TOP LEFT ALIGNMENT ===
#show figure: it => block(width: auto)[
  #it.caption
  #it.body
]

#show figure.caption: set align(left)

#show figure.caption: set text(
  font: "Norad Sans",
  size: 8pt,
  weight: "bold",
  fill: rgb(0x03, 0x54, 0x2d)
  )

// BLUE LINKS
#show link: it => {
  text(fill: blue)[#it]
}

// === TABLE OF FIGURES FUNCTION ===
#let table_of_figures(title: none) = {
  outline(
    title: title,
    target: figure
  )
}

// === COVER PAGE FUNCTION ===
#let cover_page(title, subtitle, authors, documentlabel, lang, region, cover-image) = page(
  background: rect(fill: rgb(0xdf, 0xef, 0xd4), width: 100%, height: 100%),
  margin: (top: 3cm, bottom: 0cm, x: 2.5cm),
  [
    #set text(lang: lang, region: region)

    // Logo
    #place(right + top, dx: 0cm, dy: -0.6cm, image("_extensions/norad-report-template/logo/norad-logo.svg", width: 4cm))

    #h(0.1em)

    // Document label
    #if documentlabel != none {
      block(inset: 0em, above: 2.6cm, below: 1em)[ 
        #rect(fill: rgb(0x03, 0x54, 0x2d), inset: (x: 1.2em, y: 0.7em))[ 
          #text(size: 10pt, font: "Norad Sans", weight: "bold", fill: rgb(223, 239, 212))[ #documentlabel ]
        ]
      ]
    }

    // Title
    #block(inset: 0em, above: 4.8em, below: 4.5em)[
      #text(size: 47pt, font: "Norad Display", fill: rgb(0x03, 0x54, 0x2d))[ #title ]
    ]

    // Subtitle
    #if subtitle != none {
      block(inset: 0em, above: 0em, below: 1em)[
        #context[
          #let subtitle_text = text(size: 14pt, font: "Norad Sans", fill: rgb(0x03, 0x54, 0x2d))[ #subtitle ]
          #let subtitle_width = measure(subtitle_text).width
          #subtitle_text
          #block(above: 23pt)[ #line(length: subtitle_width, stroke: 1pt + rgb(0x03, 0x54, 0x2d)) ]
        ]
      ]
    }

    // Author
    #if authors != none {
      let author_names = authors.map(a => a.name).join(", ")
      block(inset: 0em, below: 0em, above: 4.8em)[
        #text(size: 11pt, font: "Norad Serif", fill: rgb(0x03, 0x54, 0x2d))[ #author_names ]
      ]
    }

  // Include cover image on bottom half if provided
    #if cover-image != none and cover-image != "" {
      place(center+bottom)[
        #image(cover-image, width: 133%, height: 55%)
      ]
    }
  ]
)

// === ARTICLE FUNCTION ===
#let article(
  title: none,
  subtitle: none,
  documentlabel: none,
  authors: none,
  date: none,
  date-published: none,
  date-updated: none,
  isbn: none,
  cover-image: none,
  cover-image-credit: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (top: 2.95cm, bottom: 2.5cm, x: 2.5cm),
  paper: "a4",
  lang: "nb",
  region: "NO",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  tof: false,
  tof_title: none,
  doc,
) = {
  
 //  Default text
  set text(
    lang: lang,
    region: region,
    font: "Norad Sans",
    size: 10pt,
  )

// === Cover page ===
  cover_page(title, subtitle, authors, documentlabel, lang, region, cover-image)

// === Second page ===
  page(
    margin: (top: 2.95cm, bottom: 2.5cm, x: 2.5cm),
  )[ 

    #block(below: 2.5em)[ 
      #text(size: 26pt, font: "Norad Display")[ #title ] 
      ]
    
    #if subtitle != none {
      block(below: 2em)[
        #text(size: 16pt, font: "Norad Sans")[ #subtitle ]
      ]
    }

    #if isbn != none {
      block(below: 0.8em)[ #isbn ]
    }

    #if date-published != none {
      block(below: 2em)[ #date-published ]
    }

    #if date-updated != none {
      block(below: 1.5em)[ #date-updated ]
    }
    
    #block(below: 0.8em)[
        #link("https://www.bistandsresultater.no")[ 
          #text(
              font: "Norad Sans",
              weight: "bold",
              fill: black,
          )[ bistandsresultater.no ]
      ]
    ]

    #block(below: 1.5em)[
        #link("https://www.norad.no")[ 
          #text(
              font: "Norad Sans",
              weight: "bold",
              fill: black,
          )[ norad.no ]
      ]
    ]
  
    #if cover-image-credit != none {
      align(bottom)[
        #block(below: 1em)[#cover-image-credit]
      ]
    }
  ]

// === Main document content ===
  set page(
    paper: paper,
    margin: margin,
    number-align: right + bottom,
    numbering: "1",
  )

  set par(justify: true)
  set heading(numbering: sectionnumbering)

// TOC - Table of contents
if toc {
  let title = if toc_title != none { toc_title } else { "Table of contents" }
  
  // Block for the TOC title with 3 cm space below
  block(above: 0em, below: 65pt)[
    #text(size: 26pt, font: "Norad Display")[ #title ]
  ]
  
  // Block for the TOC body
  block(above: 0em, below: 2em)[
    #outline(
      title: none,
      depth: toc_depth,
      indent: toc_indent
    )
  ]
  pagebreak()
}

// TOF - Table of figures
if tof {
  let title = if tof_title != none { tof_title } else { "Table of Figures" }

  // Block for the TOF title with 3 cm space below
  block(above: 0em, below: 65pt)[
    #text(size: 26pt, font: "Norad Display")[ #title ]
  ]
  
  // Block for the TOF body
  block(above: 0em, below: 2em)[
    #table_of_figures(
      title: none
    )
  ]
  pagebreak()
}

// Page styles
  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }

// === Final page ===
pagebreak(to: "even") // Ensures correct even/odd placement for folding

page(
  background: rect(fill: rgb(3, 84, 45), width: 100%, height: 100%),
  margin: (x: 6.5cm, y: 6.5cm, top: 6.5cm, bottom: 3cm),
  footer: [] // This removes the footer, including the page number
)[
    // Centered logo
    #place(center, image("_extensions/norad-report-template/logo/norad-logo-vertical.svg"))

    // Bold "norad.no" text at the bottom with a hyperlink
    #place(
        bottom + right, // Places it at the bottom right
        link("https://www.norad.no")[ 
            #text(
                size: 1.8em,
                font: "Norad Sans",
                fill: rgb(223, 239, 212)
            )[ norad.no ]
        ]
    )
]

}
