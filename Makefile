SOURCES_ = $(wildcard *.md)
SOURCES = $(filter-out README.md, $(SOURCES_))
OUT = $(SOURCES:.md=.pdf)
ASCIIMATH=filters/asciimath/pandoc-asciimath

HS_FILTERS_NAMES =
PY_FILTERS_NAMES = pandoc-svg.py
EXT_FILTERS = pandoc-crossref $(ASCIIMATH)

HS_FILTERS = $(addprefix filters/, $(HS_FILTERS_NAMES))
PY_FILTERS = $(addprefix filters/, $(PY_FILTERS_NAMES))
FILTERS = $(PY_FILTERS) $(HS_FILTERS) $(EXT_FILTERS)


all: $(HS_FILTERS) $(ASCIIMATH) $(OUT)

.SUFFIXES: .md .pdf

%.pdf: %.md
	pandoc -S --toc -t latex $< $(addprefix --filter=, $(FILTERS)) -o $@

$(HS_FILTERS):
	ghc --make $@.hs -o $@	

$(ASCIIMATH):
	(cd filters/asciimath; make filter-only)

clean:
	rm -f $(addprefix filters/, $(HS_FILTERS))
	rm -f *.pdf

deepclean: clean
	(cd filters/asciimath; make clean)
	rm -f $(HS_FILTERS)
	rm -f filters/*.hi filters/*.o
