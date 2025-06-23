# 🖼️ Módulo 9 – Visualizações Interativas

### Volcano plot
```r
library(EnhancedVolcano)
EnhancedVolcano(res, lab = rownames(res),
                x = "log2FoldChange", y = "padj")
```

### PCA interativo
```r
library(plotly)
p <- plotPCA(vsd, intgroup = "condition", returnData = TRUE)
plot_ly(p, x = ~PC1, y = ~PC2, color = ~group)
```