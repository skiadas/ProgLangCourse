TEMPLATE = template.html
TEXTEMPLATE = template.tex
MDFILES := $(shell find . -name \*.md)
HTMLFILES := $(MDFILES:./%.md=site/%.html)
# ASSIGNMENTS := $(filter ./assignments/%.md,$(MDFILES))
PDFS := $(MDFILES:./%.md=site/%.pdf)
# TEXS := $(ASSIGNMENTS:./%.md=site/%.tex)
IMGFILES := $(shell find images -name \*.png)
IMGFILES := $(IMGFILES:%=site/notes/%)

$(HTMLFILES): site/%.html: %.md $(TEMPLATE)
	pandoc -o $@ --template=$(TEMPLATE) --mathjax --smart --filter ./makeHtml.hs $<

$(PDFS): site/%.pdf: %.md $(TEXTEMPLATE)
	pandoc -o $@ --template=$(TEXTEMPLATE) -t latex --listings --filter ./makeTex.hs $<


$(IMGFILES): site/notes/images/%.png: images/%.png
	cp $< $@

email:
	open "mailto:`cat students.txt`"

site: $(HTMLFILES) $(PDFS) $(IMGFILES)

all: site
