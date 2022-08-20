readme:
	Rscript -e 'rmarkdown::render("README.Rmd", rmarkdown::md_document(variant="gfm"), encoding="UTF-8")'

html:
	Rscript -e 'rmarkdown::render("README.Rmd", encoding="UTF-8")';\
	mv README.html index.html

