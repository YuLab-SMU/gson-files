We proposed a new file format
[gson](https://CRAN.R-project.org/package=gson) for storing gene set and
related information, and provides read, write and other utilities to
process this file format. The gson files can be used as the annotation
input of
[clusterProfiler](https://bioconductor.org/packages/clusterProfiler/)
for enrichment analysis.

Here we provide some commonly used gson files, and we also welcome you
to submit more gson files by submitting [pull
request](https://github.com/YuLab-SMU/gson-files/pulls) or send us an
email:

Guangchuang Yu: <gcyu1@smu.edu.cn>

Erqiang Hu: <13766876214@163.com>

``` r
knitr::kable(gsonDf, align="c", caption="GSON files")
```

|        files        |                        download                        |      geneSet      |   organism   |           version            |
|:----------:|:-------------------------:|:---------:|:------:|:--------------:|
|  GO_ALL_human.gson  |  <https://yulab-smu.top/gson-files/GO_ALL_human.gson>  | Gene Ontology;ALL | Homo sapiens |          2022-03-10          |
|  GO_BP_human.gson   |  <https://yulab-smu.top/gson-files/GO_BP_human.gson>   | Gene Ontology;BP  | Homo sapiens |          2022-03-10          |
|  GO_CC_human.gson   |  <https://yulab-smu.top/gson-files/GO_CC_human.gson>   | Gene Ontology;CC  | Homo sapiens |          2022-03-10          |
|  GO_MF_human.gson   |  <https://yulab-smu.top/gson-files/GO_MF_human.gson>   | Gene Ontology;MF  | Homo sapiens |          2022-03-10          |
|   KEGG_human.gson   |   <https://yulab-smu.top/gson-files/KEGG_human.gson>   |       KEGG        |     hsa      | Release 103.0+/08-06, Aug 22 |
|  MKEGG_human.gson   |  <https://yulab-smu.top/gson-files/MKEGG_human.gson>   |       KEGG        |     hsa      | Release 103.0+/08-06, Aug 22 |
| Reactome_human.gson | <https://yulab-smu.top/gson-files/Reactome_human.gson> | reactome pathway  |    human     |              NA              |

GSON files

## How to use gson files

We provided `read.gson()` function in
[gson](https://CRAN.R-project.org/package=gson) package to read gson
files, and `write.gson` to write gson files.

``` r
library(clusterProfiler)
library(org.Hs.eg.db)
library(gson)

# use `gson_GO()` function in `clusterProfiler` package(the latest version in Github) to build GSON object.
gson_BP_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "BP")
gson_MF_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "MF")
gson_CC_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "CC")
gson_ALL_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "ALL")

# use `wite.gson()` function to save GSON object to files.
write.gson(gson_BP_human, file = "GO_BP_human.gson")
write.gson(gson_MF_human, file = "GO_MF_human.gson")
write.gson(gson_CC_human, file = "GO_CC_human.gson")
write.gson(gson_ALL_human, file = "GO_ALL_human.gson")
```

The `clusterProfiler` package of laster version in
[Github](https://github.com/YuLab-SMU/clusterProfiler) support passing a
GSON object to `enricher(gson)` and `GSEA(gson)`:

``` r
# use `read.gson()` function to read gson files
gson_BP_human <- read.gson("GO_BP_human.gson")
gson_MF_human <- read.gson("GO_MF_human.gson")
gson_CC_human <- read.gson("GO_CC_human.gson")
gson_ALL_human <- read.gson("GO_ALL_human.gson")
data(geneList, package="DOSE")
gene <- names(geneList)[abs(geneList) > 2]
x <- enricher(gene, gson = gson_BP_human)
head(x)
y <- GSEA(geneList, gson = gson_BP_human)
head(y)
```
