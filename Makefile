all: diploma_quiet

help:
	@echo "Use:"
	@echo "  build   - build all"
	@echo "  diploma - run only LaTeX compilation"
	@echo "  clean"

build: diploma

diploma:
	pdflatex main.tex
	bibtex main.aux
	pdflatex main.tex
	pdflatex main.tex

diploma_quiet:
	pdflatex main.tex > /dev/null
	bibtex main.aux > /dev/null
	pdflatex main.tex > /dev/null
	pdflatex main.tex > /dev/null

clean:
	# for file in `find . -name "*.pdf"`; do rm $$file; done
	for file in `find . -name "*.log"`; do rm $$file; done
	for file in `find . -name "*.aux"`; do rm $$file; done
	for file in `find . -name "*.bbl"`; do rm $$file; done
	for file in `find . -name "*.blg"`; do rm $$file; done
	for file in `find . -name "*.toc"`; do rm $$file; done
	for file in `find . -name "*.out"`; do rm $$file; done
	for file in `find . -name "*.ftm"`; do rm $$file; done
	for file in `find . -name "*.eps"`; do rm $$file; done