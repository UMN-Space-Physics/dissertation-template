LATEXMK=./latexmk/latexmk

# Various dependencies
MAIN=dissertation
MAIN_PDF=$(MAIN).pdf
MAIN_TEX=$(MAIN).tex
HELPER_FILES= makefile mnthesis.cls $(MAIN).bib
PRELIMS:=$(wildcard preliminaries/*.tex)
CHAPTERS:=$(wildcard chapters/*.tex)
FIGURES := $(wildcard figures/*)

# Tell make what our reserved target names are
#
# By using ALWAYS_COMPILE as an undefined target, it will always force the main
# PDF to compile. latexmk is smart and will do the minimum needed each time.
.PHONY: ALWAYS_COMPILE clean all tidy

# The default target
all: $(MAIN_PDF)

# Instructions to make the main pdf
$(MAIN_PDF): ALWAYS_COMPILE $(MAIN_TEX) $(HELPER_FILES) $(PRELIMS) $(CHAPTERS) $(FIGURES)
	$(LATEXMK) -pdf $(MAIN_TEX) -halt-on-error

# Clean up all the regeneratable files except for the final document (the .pdf)
tidy:
	$(LATEXMK) -c $(MAIN_TEX)

# Clean up all the regeneratable files, including the final document, and any
# temporary files. Don't echo the commands, don't print the LaTeXmk version
# number, and don't complain if there are no temporary files to clean up. 
clean:
	@ echo 'Cleaning up.'
	@- $(LATEXMK) -C $(MAIN_TEX) &> /dev/null ||:
	@- rm *~ chapters/*~ &> /dev/null ||:

force:
	$(LATEXMK) -pdf $(MAIN_TEX) -f
