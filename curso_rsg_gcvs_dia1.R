setwd()
##Caso nao tenha sido instalado
#install.packages("BiocManager")
#BiocManager::install(c("DESeq2", "tidyverse", "pheatmap", "apeglm"))

library(DESeq2)
library(tidyverse)
library(pheatmap)


################################
# 📁 Importar dados#############
################################


countData <- read.delim("counts.tsv", row.names = 1)
colData <- read.csv("metadata.csv", row.names = 1)

# 🔬 Criar objeto DESeq2
dds <- DESeqDataSetFromMatrix(countData = countData,
                              colData = colData,
                              design = ~ condition)

# 📊 Pré-processamento
dds <- dds[rowSums(counts(dds)) > 10, ]  # remove genes com baixa contagem
dds <- DESeq(dds)

# 🧪 Resultados
res <- results(dds, contrast = c("condition", "treated", "control"))
res <- lfcShrink(dds, coef="condition_treated_vs_control", type="apeglm")
summary(res)

# 💾 Exportar genes significativos
sig <- subset(res, padj < 0.05 & abs(log2FoldChange) > 1)
write.csv(as.data.frame(sig), "DEGs.csv")

################################################################
################################################################
#### Como definir contrastes? - ver apostila ###################
################################################################


library(DESeq2)

# Simular metadados
samples <- data.frame(
  row.names = paste0("S", rep(1:4, each=2), "_", rep(c("C", "T"), 4)),
  condition = rep(c("control", "treated"), 4),
  batch = rep(c("A", "A", "B", "B"), each=2),
  subject = rep(paste0("S", 1:4), each=2)
)

samples$condition <- factor(samples$condition, levels = c("control", "treated"))

# Simular matriz de contagens (100 genes x 8 amostras)
set.seed(123)
counts <- matrix(rnbinom(100*8, mu=100, size=1), ncol=8)
rownames(counts) <- paste0("Gene", 1:100)
colnames(counts) <- rownames(samples)

# Introduzir efeito de tratamento em alguns genes
counts[1:10, samples$condition == "treated"] <- counts[1:10, samples$condition == "treated"] + 100

#Exemplo 1 – Design simples
dds1 <- DESeqDataSetFromMatrix(countData = counts, colData = samples, design = ~ condition)
dds1 <- DESeq(dds1)
res1 <- results(dds1)
summary(res1)


#Exemplo 2 – Design com batch
dds2 <- DESeqDataSetFromMatrix(countData = counts, colData = samples, design = ~ batch + condition)
dds2 <- DESeq(dds2)
res2 <- results(dds2)
summary(res2)


#Exemplo 3 – Design pareado por indivíduo
dds3 <- DESeqDataSetFromMatrix(countData = counts, colData = samples, design = ~ subject + condition)
dds3 <- DESeq(dds3)
res3 <- results(dds3)
summary(res3)

###Comparar os resultados
# Número de genes significativos detectados
sum(res1$padj < 0.05, na.rm = TRUE)
sum(res2$padj < 0.05, na.rm = TRUE)
sum(res3$padj < 0.05, na.rm = TRUE)



#############################################################################################
### Módulo 3: Visualizações e Enriquecimento################################################
################################################################################################


#Para verificar qualidade
# MA-plot
plotMA(res, ylim = c(-5, 5))

# PCA
vsd <- vst(dds, blind=FALSE)
plotPCA(vsd, intgroup="condition")

# Heatmap
select_genes <- head(order(res$padj), 30)
pheatmap(assay(vsd)[select_genes, ], cluster_rows = TRUE, cluster_cols = TRUE)

###Enriquecimento funcional
#BiocManager::install("clusterProfiler")
#BiocManager::install("org.Hs.eg.db")

library(clusterProfiler)
library(org.Hs.eg.db)

# Converter ENSEMBL para ENTREZ
gene_list <- rownames(sig)
entrez <- mapIds(org.Hs.eg.db, keys=gene_list, column="ENTREZID", keytype="SYMBOL", multiVals="first")

# GO Enrichment
ego <- enrichGO(gene = entrez, OrgDb = org.Hs.eg.db, ont = "BP", pAdjustMethod = "BH")
dotplot(ego, showCategory=15)

# KEGG
ekegg <- enrichKEGG(gene = entrez, organism = 'hsa')
barplot(ekegg)

## Gerar relatorio pra chefia / supervisor / orientador ficar feliz!!! rsrsrsrs

library(ggplot2)
ggplot(as.data.frame(res), aes(x=log2FoldChange, y=-log10(padj))) +
  geom_point(alpha=0.4) +
  geom_vline(xintercept=c(-1,1), col="red", linetype="dashed") +
  theme_minimal() +
  labs(title="Volcano Plot", x="log2 Fold Change", y="-log10 Adjusted p-value")



