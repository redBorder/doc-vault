BASE=logstash-documentation
OUTDIR=docs
CHAPTERS=chapters
LANG=es-ES
MAIN=$(BASE).adoc

.PHONY: all
all: html pdf

.PHONY: html
html: $(SOURCES) styles/$(CSS)
	asciidoctor $(MAIN) -a i18n=$(LANG) -a stylesheet=./styles/rubygems.css --attribute tabsize=4 -o $(OUTDIR)/$(LANG)/index.html

.PHONY: pdf
pdf: $(SOURCES) styles/$(CSS)
	asciidoctor-pdf $(MAIN) -a i18n=$(LANG) -a allow-uri-read -a img_path=$(PWD)/assets/images --attribute tabsize=4 -o $(OUTDIR)/pdf/$(LANG)_$(BASE).pdf

.PHONY: clean
clean:
	-rm -rf $(OUTDIR)/*

print-%  : ; @echo $* = $($*)
