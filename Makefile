# LaTeX Compiler in use
LC=pdflatex

# Source file name : tweak to your own liking ; in this case, you'd have write in main.tex
BASENAME=main
BUILDDIR=build

# Default target
$(BASENAME): $(BASENAME).tex
	# Creating the build dir
	mkdir -p $(BUILDDIR)
	# Compiling twice for ToC & lastPage
	$(LC) -jobname=$(BASENAME) -output-directory=$(BUILDDIR)/ $<
	$(LC) -jobname=$(BASENAME) -output-directory=$(BUILDDIR)/ $<
	# Moving the PDF back to current directory
	mv build/$(BASENAME).pdf .

clean: # --force allows the rms to keep going even if one fails
	rm -Rf $(BUILDDIR)
	rm -Rf $(RELEASE_NAME).pdf

# Every rule that doesn't generate a same name file must be mentionned ere
.PHONY: clean commit
