# Star Chart Makefile

# TeX source files
TEX_FILES := $(shell find . -name "*.tex")

# PDF output files
PDF_FILES := $(TEX_FILES:.tex=.pdf)

# Main target
all: $(PDF_FILES)

%.pdf: %.tex
	echo "Building $<"
	pdflatex -output-directory="$(@D)" "$<" > /dev/null
	pdflatex -output-directory="$(@D)" "$<" > /dev/null

clean:
	rm -f $(PDF_FILES)
	rm -f $(PDF_FILES:.pdf=.aux)
	rm -f $(PDF_FILES:.pdf=.log)
	rm -f $(PDF_FILES:.pdf=.out)
	rm -f $(PDF_FILES:.pdf=.synctex.gz)
	rm -f $(PDF_FILES:.pdf=.toc)

# `make clean` is a "phony" target
.PHONY: clean

# Silence everything
.SILENT:
