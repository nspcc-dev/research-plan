#!/usr/bin/make -f

SHELL = bash

.PHONY: all
all: pic pdf

PIC_SRC := $(wildcard pic/*.puml)
PIC_EPS := $(addsuffix .eps, $(basename $(PIC_SRC)))

.PHONY: pic
pic: $(PIC_EPS)

pic/%.eps: pic/%.puml
	java -jar plantuml.jar -teps $^

pdf: pic
	pdflatex research_plan.tex

.PHONY: clean
clean:
	rm *.aux *.log *.out *.pdf pic/*-eps-converted-to.pdf
