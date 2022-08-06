We proposed a new file format
[gson](https://CRAN.R-project.org/package=gson)’ for storing gene set
and related information, and provides read, write and other utilities to
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
| :-----------------: | :----------------------------------------------------: | :---------------: | :----------: | :--------------------------: |
|  GO_ALL_human.gson  |  <https://yulab-smu.top/gson-files/GO_ALL_human.gson>  | Gene Ontology;ALL | Homo sapiens |          2021-09-01          |
|  GO_BP_human.gson   |  <https://yulab-smu.top/gson-files/GO_BP_human.gson>   | Gene Ontology;BP  | Homo sapiens |          2021-09-01          |
|  GO_CC_human.gson   |  <https://yulab-smu.top/gson-files/GO_CC_human.gson>   | Gene Ontology;CC  | Homo sapiens |          2021-09-01          |
|  GO_MF_human.gson   |  <https://yulab-smu.top/gson-files/GO_MF_human.gson>   | Gene Ontology;MF  | Homo sapiens |          2021-09-01          |
|   KEGG_human.gson   |   <https://yulab-smu.top/gson-files/KEGG_human.gson>   |       KEGG        |     hsa      | Release 103.0+/08-06, Aug 22 |
|  MKEGG_human.gson   |  <https://yulab-smu.top/gson-files/MKEGG_human.gson>   |       KEGG        |     hsa      | Release 103.0+/08-06, Aug 22 |
| Reactome_human.gson | <https://yulab-smu.top/gson-files/Reactome_human.gson> | reactome pathway  |    human     |              NA              |

