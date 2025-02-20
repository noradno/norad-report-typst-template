# Norad Report Template for generating PDFs using Typst in Quarto
A customized tempate to create Norad PDF reports using Typst in Quarto. The design is a Typst implementation of the Norad Rapportmal for Microsoft Word using Norads fonts, color palette and other design guidelines from Norad's Design Manual.

Note that the repository currently does not contain folders with Norad's fonts and Norad's logos used in the template.

## Installing

```bash
quarto use template noradno/norad-report-typst-template
```
This will install the format extension and create an example qmd file that you can use as a starting place for your Norad report.

## Using
The example qmd demonstrates the document options supported by the Norad Report Format (`title`, `subtitle`, `author`, `date-published`, `date-updated`, `isbn`, `cover-image`, `lang`, `toc`, etc.). For example, your document options might look something like this:

```yaml
title: "Tall som teller"  # The main title of the document
subtitle: "Statistikk over norsk utviklingsbistand i 2024"  # The subtitle of the document
documentlabel: "RAPPORT"  # The label to be displayed on the document
author: "Av seksjon for statistikk og analyse, Norad"  # The author(s) of the document
cover-image: "cover-image-regimetype.png"  # The path to the cover image file
cover-image-credit: "Foto: Generert av ChatGPT"  # Credit for the cover image
date: last-modified  # Date the document was last modified; leave as 'last-modified' to auto-update
date-format: long  # The format in which to display the date
date-published: "Dato publisert: 13.05.2025"  # The date the document was published
date-updated:  # The date the document was last updated; leave blank if not applicable
isbn: "ISBN: XXX XX XXX"  # The ISBN number for the document
lang: nb  # The language of the document (nb for Norwegian bokmaal)
region: NO  # The region code (NO for Norway)
execute:
  freeze: false  # Set to true to prevent re-execution of code in the document
  merge: true  # Ensures figures, tables, and references work across child documents
  echo: false  # Set to true to show code chunks in the output document
  message: false  # Set to true to show messages in the output document
  warning: false  # Set to true to show warnings in the output document
format:
  norad-report-template-typst:
    toc: true  # Include a table of contents
    toc-title: "Innhold"  # Title for the table of contents
    toc-depth: 3  # Depth of the table of contents (number of heading levels included)
    number-sections: false  # Set to true to number sections
    tof: true  # Include a table of figures
    tof-title: "Figurer"  # Title for the table of figures
    # section-numbering: "1.1.1"  # Uncomment and set to true to enable section numbering
---
```

The title page of this document would be rendered as:

![](images/example-report-titlepage.png)

