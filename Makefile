SOURCES = $(wildcard *.md)
OUT = $(SOURCES:.md=.pdf)

all: $(OUT)

$(OUT): $(SOURCES)
	pandoc --smart -t latex $< --filter=filters/pandoc-svg.py --filter=pandoc-crossref -o $@

clean:
	rm -f $(OUT)
	find . -name "*.pandoc.pdf" -delete
