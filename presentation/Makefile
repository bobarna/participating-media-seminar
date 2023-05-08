PAPER := main
BUILD_DIR := ./pdf

build: $(PAPER).pdf

# Call with e.g. "make jegyzet.pdf"
%.pdf: %.tex 
	pdflatex -output-directory $(BUILD_DIR) $<
	cp main.bib $(BUILD_DIR); 
	cd $(BUILD_DIR)
	- bibtex $*
	cd ..
	pdflatex -output-directory $(BUILD_DIR) $<
	pdflatex -output-directory $(BUILD_DIR) $<

clean:
	rm comment.cut main.{aux,bbl,blg,log,out,pdf}

