
# GO
library(clusterProfiler)
library(org.Hs.eg.db)
library(gson)
gson_BP_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "BP")
gson_MF_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "MF")
gson_CC_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "CC")
gson_ALL_human <- gson_GO(OrgDb = org.Hs.eg.db, keytype = 'ENTREZID', ont = "ALL")
write.gson(gson_BP_human, file = "GO_BP_human.gson")
write.gson(gson_MF_human, file = "GO_MF_human.gson")
write.gson(gson_CC_human, file = "GO_CC_human.gson")
write.gson(gson_ALL_human, file = "GO_ALL_human.gson")

# KEGG
KEGG_human <- gson_KEGG(species = "hsa", KEGG_Type="KEGG", keyType="kegg") 
MKEGG_human <- gson_KEGG(species = "hsa", KEGG_Type="MKEGG", keyType="kegg") 
write.gson(KEGG_human, file = "KEGG_human.gson")
write.gson(MKEGG_human, file = "MKEGG_human.gson")

# Reactome
library(ReactomePA)
Reactome_human <- gson_Reactome(organism = "human")
write.gson(Reactome_human, file = "Reactome_human.gson")


