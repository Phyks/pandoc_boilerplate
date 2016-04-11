SOURCES = $(wildcard *.md)
OUT = $(SOURCES:.md=.pdf)

HS_FILTERS_NAMES =
PY_FILTERS_NAMES = pandoc-svg.py
EXT_FILTERS = asciimath/pandoc-asciimath

HS_FILTERS = $(addprefix filters/, $(HS_FILTERS_NAMES))
PY_FILTERS = $(addprefix filters/, $(PY_FILTERS_NAMES))
FILTERS = $(PY_FILTERS) $(HS_FILTERS) $(EXT_FILTERS)

all: $(HS_FILTERS) asciimath/pandoc-asciimath $(OUT)

.SUFFIXES: .md .pdf

%.pdf: %.md
	pandoc -S --toc -t latex $< $(addprefix --filter=, $(FILTERS)) -o $@

$(HS_FILTERS):
	ghc --make $@.hs -o $@	

asciimath/pandoc-asciimath:
	(cd asciimath; make)

clean:
	rm -f $(OUT)
	rm -f $(addprefix filters/, $(HS_FILTERS))
	find . -name "*.pandoc.pdf" -delete

deepclean: clean
	(cd filters/asciimath; make clean)
	rm -f $(HS_FILTERS)
	rm -f filters/*.hi filters/*.o
