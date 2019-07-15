#!/bin/bash

pandoc -s rosario.md -o output/rosario-pandoc.pdf -s
#pandoc -s rosario.md -o output/rosario-pandoc.tex -s
pandoc -s rosario.md -o output/rosario-pandoc.html --ascii -s
