#!/bin/sh

#Rscript -e 'library(knitr);knit("talk.Rmd")'

# build slidy presentation
# NB can't use self-contained and mathjax!
#    https://github.com/jgm/pandoc/issues/682
pandoc -s -S -t slidy --css=slidy.css --mathjax=http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML talk.md -o talk.html -H jshead.html #--self-contained
#pandoc -s -S -t slidy --mathjax talk.md -o talk.html
#pandoc -s -S -t slidy --css=http://www.w3.org/Talks/Tools/Slidy2/styles/w3c-blue.css --mathjax talk.md -o talk.html
#pandoc -s -S -t slidy --mathml talk.md -o talk.html

#open talk.html

## refresh if open in Chrome
#osascript -e 'tell application "Firefox"
#  tell the active tab of its first window
#    reload
#  end tell
#end tell'


## build tex for beamer
#pandoc -s -i talk.md -o talk.pdf -t beamer -S
#pdflatex talk.tex
#open talk.pdf


#pandoc -s -i talk.tex -o talk2.tex -t beamer -S
