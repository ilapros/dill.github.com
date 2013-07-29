#!/bin/sh

Rscript -e 'library(knitr);knit("talk.Rmd")'

# build slidy presentation
pandoc -s -S -t slidy --mathjax talk.md -o talk.html
#pandoc -s -S -t slidy --mathml talk.md -o talk.html
# build tex for beamer
#pandoc -s -i talk.md -o talk.tex -t beamer -S
#pdflatex talk.tex
#open talk.pdf


#pandoc -s -i talk.tex -o talk2.tex -t beamer -S
