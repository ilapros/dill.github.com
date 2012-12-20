#!/bin/sh
# build slidy presentation
pandoc -s -S -i -t slidy --mathjax talk.md -o talk.html
# build tex for beamer
pandoc -s -i talk.md -o talk.tex -t beamer -S
pdflatex talk.tex
