#!/bin/sh

## make the talk
pandoc -s -S -t slidy --css=slidy.css --mathjax=http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML talk.md -o talk.html -H jshead.html

