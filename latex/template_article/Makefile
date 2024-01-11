# usage: make clean
#	 make
PROJECT=main
SOURCES=$(*.tex)
TEX=latex
PDFTEX=pdflatex
BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex
BUILDPDFTEX=$(PDFTEX) $(PROJECT).tex

all: $(PROJECT).pdf

$(PROJECT).pdf: $(SOURCES)

.PHONY: all pdf dvi clean list

all:	# default output: PDF
	$(BUILDPDFTEX)
	$(BIBTEX) $(PROJECT)
	$(BUILDPDFTEX)
	$(BUILDPDFTEX)

pdf:
	$(BUILDPDFTEX)
	$(BIBTEX) $(PROJECT)
	$(BUILDPDFTEX)
	$(BUILDPDFTEX)

dvi:
	$(BUILDTEX)
	$(BIBTEX) $(PROJECT)
	$(BUILDTEX)
	$(BUILDTEX)

clean:
	rm -f *.ps *.dvi *.aux *.log p.ps *backup *~ *.bbl *blg *.pdf *.toc

list:
	@echo "Makefile targets:"
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | sed 's_^_\ \ _'

