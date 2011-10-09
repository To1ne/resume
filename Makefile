TEXDIR = /usr/texbin/
PDFLATEX = $(TEXDIR)pdflatex

#all: $(patsubst %.tex,%.pdf,$(wildcard *.tex))
all: nl

nl: CV-ToonClaes-nl.pdf

%.pdf: %.tex
	$(PDFLATEX) $<

.PHONY: all nl
