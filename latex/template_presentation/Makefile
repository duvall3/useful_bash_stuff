# usage: make clean
#	 make
PROJECT=main
SOURCES=$(*.tex)
TEX=pdflatex
#BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex

all: $(PROJECT).pdf

$(PROJECT).pdf: $(SOURCES)
#all:
	$(BUILDTEX)
#	$(BIBTEX) $(PROJECT)
	$(BUILDTEX)
	$(BUILDTEX)

clean:
	rm -f *.ps *.dvi *.aux *.log p.ps *backup *~ *.bbl *blg *.pdf *.toc 
	
