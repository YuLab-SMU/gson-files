The `gson` file format was proposed in the CRAN R package
[gson](https://CRAN.R-project.org/package=gson). This format is designed
to store gene sets with related information (*e.g.*, gene set name,
version, species, etc.).

The [gson](https://CRAN.R-project.org/package=gson) package provides a
set of utilities to read, write and process `gson` files.

Here is a collection of gene sets stored in `gson` format:

| Gene Set          | Terms | Gene Coverage | Species      | Version                              | URL                                                                                                                                     |
|:------------------|------:|--------------:|:-------------|:-------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------|
| Gene Ontology;ALL | 22834 |         20709 | Homo sapiens | 2022-03-10                           | [<img src="https://yulab-smu.top/gson-files/img/download-solid.svg" width="30"/>](https://yulab-smu.top/gson-files/GO_ALL_human.gson)   |
| Gene Ontology;BP  | 15947 |         18800 | Homo sapiens | 2022-03-10                           | [<img src="https://yulab-smu.top/gson-files/img/download-solid.svg" width="30"/>](https://yulab-smu.top/gson-files/GO_BP_human.gson)    |
| Gene Ontology;CC  |  2009 |         19594 | Homo sapiens | 2022-03-10                           | [<img src="https://yulab-smu.top/gson-files/img/download-solid.svg" width="30"/>](https://yulab-smu.top/gson-files/GO_CC_human.gson)    |
| Gene Ontology;MF  |  4878 |         18410 | Homo sapiens | 2022-03-10                           | [<img src="https://yulab-smu.top/gson-files/img/download-solid.svg" width="30"/>](https://yulab-smu.top/gson-files/GO_MF_human.gson)    |
| KEGG              |   347 |          8164 | hsa          | Release 103.0+/08-06, Aug 22         | [<img src="https://yulab-smu.top/gson-files/img/download-solid.svg" width="30"/>](https://yulab-smu.top/gson-files/KEGG_human.gson)     |
| KEGG              |   187 |           846 | hsa          | Release 103.0+/08-06, Aug 22         | [<img src="https://yulab-smu.top/gson-files/img/download-solid.svg" width="30"/>](https://yulab-smu.top/gson-files/MKEGG_human.gson)    |
| reactome pathway  |  2541 |         10891 | human        | Version: 81; Source date: 2022-07-06 | [<img src="https://yulab-smu.top/gson-files/img/download-solid.svg" width="30"/>](https://yulab-smu.top/gson-files/Reactome_human.gson) |

Users can download the file and use it as background annotation in
[clusterProfiler](http://bioconductor.org/packages/clusterProfiler)
package to perform enrichment analysis.

``` r
library(gson)
kegg <- read.gson("KEGG_human.gson")

library(clusterProfiler)
data(geneList, package="DOSE")
de = names(geneList)[abs(geneList) > 2] # select fold change > 2 as DEG
k1 <- enricher(de, gson=kegg)
head(k1, 2)
```

    ##                ID    Description GeneRatio  BgRatio       pvalue     p.adjust
    ## hsa04110 hsa04110     Cell cycle     11/94 126/8164 1.781113e-07 3.740338e-05
    ## hsa04114 hsa04114 Oocyte meiosis     10/94 131/8164 2.312516e-06 2.428142e-04
    ##                qvalue                                             geneID Count
    ## hsa04110 3.655969e-05 8318/991/9133/890/983/4085/7272/1111/891/4174/9232    11
    ## hsa04114 2.373372e-04    991/9133/983/4085/51806/6790/891/9232/3708/5241    10

``` r
k2 <- GSEA(geneList, gson=kegg, verbose=FALSE)
```

    ## Warning in fgseaMultilevel(...): For some pathways, in reality P-values are less
    ## than 1e-10. You can set the `eps` argument to zero for better estimation.

``` r
head(k2, 2)
```

    ##                ID Description setSize enrichmentScore      NES       pvalue
    ## hsa04110 hsa04110  Cell cycle     115       0.6667235 2.796914 1.000000e-10
    ## hsa03050 hsa03050  Proteasome      43       0.7094784 2.462659 3.288699e-09
    ##              p.adjust      qvalues rank                   leading_edge
    ## hsa04110 3.340000e-08 2.463158e-08 1234 tags=40%, list=10%, signal=36%
    ## hsa03050 5.492127e-07 4.050292e-07 2516 tags=65%, list=20%, signal=52%
    ##                                                                                                                                                                                                                        core_enrichment
    ## hsa04110 8318/991/9133/890/983/4085/7272/1111/891/4174/9232/4171/993/990/5347/701/9700/898/23594/4998/9134/4175/4173/10926/6502/994/699/4609/5111/1869/1029/8317/4176/2810/3066/1871/1031/9088/995/1019/4172/5885/11200/7027/1875/7534
    ## hsa03050                                                                               5688/5709/5698/5693/3458/5713/11047/5721/5691/5685/5690/5684/5686/5695/10213/23198/7979/5699/5714/5702/5708/5692/5704/5683/5694/5718/51371/5682

You are welcome to share your gson file with the community. Please
create a [pull request](https://github.com/YuLab-SMU/gson-files/pulls).
