LATEX := xelatex
LATEX_ARGS := -synctex=1 -interaction=nonstopmode -file-line-error
LATEXMK := latexmk

main.pdf: main.tex cumcmthesis.cls
	$(LATEX) $(LATEX_ARGS) main.tex

clean:
	$(LATEXMK) -c main.pdf
	rm -f main.pdf *.synctex.gz

all: main.pdf