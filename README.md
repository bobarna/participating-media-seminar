Hosted on `gh_pages` branch:
[seminar paper](https://bobarna.github.io/participating-media-seminar/seminar_paper.pdf)
[presentation](https://bobarna.github.io/participating-media-seminar/presentation.pdf)

For building the seminar paper:
```
cd seminar_paper
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```
