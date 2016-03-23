SOURCES = $(wildcard *.md)
OUT = $(SOURCES:.md=.pdf)

HS_FILTERS_NAMES = nice-frac
PY_FILTERS_NAMES = pandoc-svg.py
EXT_FILTERS = pandoc-crossref

HS_FILTERS = $(addprefix filters/, $(HS_FILTERS_NAMES))
PY_FILTERS = $(addprefix filters/, $(PY_FILTERS_NAMES))
FILTERS = $(PY_FILTERS) $(HS_FILTERS) $(EXT_FILTERS)

.SUFFIXES: .hs

all: $(HS_FILTERS) $(OUT)

$(OUT): $(SOURCES)
	pandoc --smart -t latex $< $(addprefix --filter=, $(FILTERS)) -o $@

$(HS_FILTERS): $(addsuffix .hs, $(HS_FILTERS))
	ghc --make -O2 $< -o $@	

clean:
	rm -f $(OUT)
	rm -f $(addprefix filters/, $(HS_FILTERS))
	find . -name "*.pandoc.pdf" -delete

deepclean: clean
	rm -f $(HS_FILTERS)
	rm -f filters/*.hi filters/*.o
