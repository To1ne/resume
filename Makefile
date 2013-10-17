all: nl en

clean:
	rm -f *.aux *.log *.out

distclean: clean
	rm -f *.pdf

install:
	cp *.pdf ~/Dropbox/Public/

%.pdf: %.tex
	$(PDFLATEX) $<

%.pdf: CV-ToonClaes-multi.tex
	sed -E "s/\\setdoclang\{[^\}]+\}\{[^\}]+\}/\\setdoclang\{$(auto_lang)\}\{$(auto_lang)\}/" CV-ToonClaes-multi.tex | $(PDFLATEX) --jobname=$*

TEXDIR:=/usr/texbin/
PDFLATEX:=$(TEXDIR)pdflatex

CV_FILENAME_STEM:=CV-ToonClaes-

auto_lang=$(patsubst $(CV_FILENAME_STEM)%,%,$*)

.PHONY: all nl clean distclean install

nl: CV-ToonClaes-nl.pdf
en: CV-ToonClaes-en.pdf

