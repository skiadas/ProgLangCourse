TEMPLATE = template.html
TEXTEMPLATE = template.tex
CURR:=$(shell pwd)
MDFILES := $(shell find . -name \*.md | grep -v -e "/exams/")
HTMLFILES := $(MDFILES:./%.md=docs/%.html)
# ASSIGNMENTS := $(filter ./assignments/%.md,$(MDFILES))
PDFS := $(MDFILES:./%.md=docs/%.pdf)
# TEXS := $(ASSIGNMENTS:./%.md=docs/%.tex)
IMGFILES := $(shell find images -name \*.png)
IMGFILES := $(IMGFILES:%=docs/notes/%)

help:
	@echo "make all: Builds all html/pdf pages and moves images around"
	@echo "make clean: Deletes html/pdf pages whose corresponding md files are gone"
	@echo "make check: Checks for bad links within md files"

$(HTMLFILES): docs/%.html: %.md $(TEMPLATE)
	mkdir -p $(@D)
	pandoc -o $@ --template=$(TEMPLATE) --mathjax --filter ./makeHtml.hs --no-highlight $<

$(PDFS): docs/%.pdf: %.md $(TEXTEMPLATE)
	mkdir -p $(@D)
	cd $(@D); pandoc -o $(CURR)/$@ --template=$(CURR)/$(TEXTEMPLATE) -t latex --listings  --filter $(CURR)/makeTex.hs --resource-path=.:$(CURR)/images $(CURR)/$<; cd $(CURR)

$(IMGFILES): docs/images/%.png: images/%.png
	mkdir -p $(@D)
	cp $< $@

checklinks:
	@grep --include=*.md -E -r "\[.*?\]\(.*?md\)" . | sed -E 's/((.*\/)?[^\/]*\.md):.*\[.*\]\((.*md)\).*/\1 \3 \2\/\3/g' > tempfile.txt
	@while read -r file ref link; do \
		 test -e "$$link" || echo "BROKEN LINK $$ref\nIN $$file"; \
	done < tempfile.txt
	@rm tempfile.txt

check: checklinks

email:
	open "mailto:`cat students.txt`"

site: $(HTMLFILES) $(PDFS) $(IMGFILES)

all: site
