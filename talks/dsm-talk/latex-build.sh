#!/bin/sh

#Rscript -e 'library(knitr);knit("talk.Rmd")'

# build slidy presentation
# NB can't use self-contained and mathjax!
#    https://github.com/jgm/pandoc/issues/682
#pandoc -s -S -t slidy --css=slidy.css --mathjax=http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML talk.md -o talk.html -H jshead.html #--self-contained

#open talk.html


## make the Lisbon talk
pandoc -s -S -t slidy --css=slidy.css --mathjax=http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML talk-Lisbon.md -o talk-Lisbon.html -H jshead.html

# build a local version using local mathjax
pandoc -s -S -t slidy --css=slidy.css --mathjax=/Users/dill/sources/mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML talk-Lisbon.md -o local-talk-Lisbon.html -H jshead.html

