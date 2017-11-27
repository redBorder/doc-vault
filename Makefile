BASE=logstash-documentation
OUTDIR=docs
CHAPTERS=chapters
LANG=es-ES
MAIN=$(BASE).adoc

.PHONY: html
html: $(SOURCES) styles/$(CSS)
        asciidoctor $(MAIN) -a i18n=$(LANG) -a img_path=images -a stylesheet=./styles/rubygems.css --attribute tabsize=4 -o $(OUTDIR)/$(LANG)/index.html
        cp -r assets/images $(OUTDIR)/$(LANG)

.PHONY: pdf
pdf: $(SOURCES) styles/$(CSS)
        asciidoctor-pdf $(MAIN) -a i18n=$(LANG) -a img_path=$(PWD)/assets/images --attribute tabsize=4 -o $(OUTDIR)/pdf/$(LANG)_$(BASE).pdf

.PHONY: clean
clean:
        -rm -rf $(OUTDIR)/*

print-%  : ; @echo $* = $($*)
