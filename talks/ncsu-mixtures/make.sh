#!/bin/bash
Rscript -e "library(knitr);knit('talk.Rmd')"
#pandoc -t beamer talk.md -o talk.pdf
pandoc -S -s --mathjax -t slidy talk.md --css=slidy.css -o talk.html
#rm talk.md
#open talk.pdf
#open talk.html
