#!/bin/bash

pandoc -s rosario.md -o output/rosario-pandoc.epub
pandoc -s rosario.md -o output/rosario-pandoc.pdf
pandoc -s rosario.md -o output/rosario-pandoc.tex
