#!/bin/sh

#Rscript -e 'library(knitr);knit("talk.Rmd")'

# build slidy presentation
pandoc -s -S -t slidy --css=slidy.css --mathjax talk.md -o talk.html -H jshead.html
#pandoc -s -S -t slidy --mathjax talk.md -o talk.html
#pandoc -s -S -t slidy --css=http://www.w3.org/Talks/Tools/Slidy2/styles/w3c-blue.css --mathjax talk.md -o talk.html
#pandoc -s -S -t slidy --mathml talk.md -o talk.html

#open talk.html

# refresh if open in Chrome
osascript -e 'tell application "Google Chrome"
  tell the active tab of its first window
    reload
  end tell
end tell'


## build tex for beamer
#pandoc -s -i talk.md -o talk.tex -t beamer -S
#pdflatex talk.tex
#open talk.pdf


#pandoc -s -i talk.tex -o talk2.tex -t beamer -S
