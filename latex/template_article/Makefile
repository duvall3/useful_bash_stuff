# usage: make clean
#	 make
PROJECT=main
SOURCES=$(*.tex)
TEX=pdflatex
BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex

all: $(PROJECT).pdf

$(PROJECT).pdf: $(SOURCES)

.PHONY: all clean list

all:
	$(BUILDTEX)
	$(BIBTEX) $(PROJECT)
	$(BUILDTEX)
	$(BUILDTEX)

clean:
	rm -f *.ps *.dvi *.aux *.log p.ps *backup *~ *.bbl *blg *.pdf *.toc

list:
	@echo "Makefile targets:"
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | sed 's_^_\ \ _'

