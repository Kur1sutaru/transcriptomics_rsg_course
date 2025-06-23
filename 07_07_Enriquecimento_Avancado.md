# 🧩 Módulo 7 – Enriquecimento Sofisticado

### clusterProfiler – GO/KEGG + visualizações
```r
ego <- enrichGO(gene = entrez, OrgDb = org.Hs.eg.db, ont = "BP")
emapplot(ego)
cnetplot(ego)
```

### GSEA com `fgsea`
```r
library(fgsea)
fgseaRes <- fgsea(pathways = msigdb, stats = gene_list, minSize = 15)
```