#!/bin/sh

## make talk
pandoc -s -S -t slidy --css=slidy.css --mathjax=http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML talk.md -o talk.html -H jshead.html

# build a local version using local mathjax
#pandoc -s -S -t slidy --css=slidy.css --mathjax=/Users/dill/sources/mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML talk.md -o local-talk.html -H jshead.html

