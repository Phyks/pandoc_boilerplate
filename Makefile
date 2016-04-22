SOURCES_ = $(wildcard *.md)
SOURCES = $(filter-out README.md, $(SOURCES_))
OUT = $(SOURCES:.md=.pdf)
IMG_ = $(wildcard *.jpg *.jpeg *.png *.svg *.bmp *.pdf)
IMG = $(filter-out $(OUT), $(IMG_))
BIB = $(wildcard *.bib)
ASCIIMATH=filters/asciimath/pandoc-asciimath

HS_FILTERS_NAMES =
PY_FILTERS_NAMES = pandoc-svg.py
EXT_FILTERS = pandoc-crossref pandoc-citeproc $(ASCIIMATH)

HS_FILTERS = $(addprefix filters/, $(HS_FILTERS_NAMES))
PY_FILTERS = $(addprefix filters/, $(PY_FILTERS_NAMES))
FILTERS = $(PY_FILTERS) $(HS_FILTERS) $(EXT_FILTERS)


all: pre-checks $(HS_FILTERS) $(ASCIIMATH) $(OUT)

pre-checks:
	@sh scripts/check-cabal.sh
	@sh scripts/check-deps.sh

install-deps:
	@echo "Updating packages list..."
	@stack update 2> /dev/null || cabal update
	@echo "Installing Alex..."
	@which "alex" > /dev/null || stack install alex 2> /dev/null || cabal install alex
	@echo "Installing Happy..."
	@which "happy" > /dev/null || stack install happy 2> /dev/null || cabal install happy
	@echo "Installing pandoc-citeproc..."
	@which "pandoc-citeproc" > /dev/null || stack install pandoc-citeproc 2> /dev/null || cabal install pandoc-citeproc
	@echo "Installing pandoc-crossref..."
	@which "pandoc-crossref" > /dev/null || stack install pandoc-crossref 2> /dev/null || cabal install pandoc-crossref
	@echo "Dependencies installed, make sure they are in your PATH."

.SUFFIXES: .md .pdf

%.pdf: %.md $(BIB) $(IMG)
	pandoc -S --toc -t latex $< $(addprefix --filter=, $(FILTERS)) -o $@

$(HS_FILTERS):
	ghc --make $@.hs -o $@

$(ASCIIMATH):
	(cd filters/asciimath; cabal update; make filter-only)

clean:
	rm -f $(addprefix filters/, $(HS_FILTERS))
	rm -f *.pdf

deepclean: clean
	(cd filters/asciimath; make clean)
	rm -f $(HS_FILTERS)
	rm -f filters/*.hi filters/*.o

