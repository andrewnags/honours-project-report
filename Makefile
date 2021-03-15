
.PHONY : report clean clean-all

name := report
src := $(name).tex
dst := $(name).pdf
toc := $(name).toc
bibsrc := $(name).bib
bibdst := $(name).bibdst


report : $(toc) $(bibdst) $(dst)

$(dst) : $(src)
	pdflatex $(src)

$(toc) : $(src)
	pdflatex $(src)

$(bibdst) : $(bibsrc)
	biber $(name)
	pdflatex $(src)
	pdflatex $(src)
	touch $(bibdst)


clean :
	ls ./$(name).* | grep -vP 'tex|bib|bibdst|pdf' | xargs rm

clean-all :
	ls ./$(name).* | grep -vP 'tex|bib(?!dst)' | xargs rm
