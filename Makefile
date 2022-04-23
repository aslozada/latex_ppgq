DOCNAME=master

all: master

.PHONY: master

master:
	pdflatex $(DOCNAME).tex
	bibtex $(DOCNAME).aux
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

clean:
	rm *.blg *.bbl *.aux *.log
