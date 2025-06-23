# 🧠 Módulo 5 – Expressão em Nível de Transcrito com `tximport`

## Passos no R:

```r
library(tximport)
library(DESeq2)
library(readr)

samples <- read.csv("samples_salmon.csv")  # com paths dos quant.sf

files <- file.path(samples$path, "quant.sf")
names(files) <- samples$sample

tx2gene <- read.csv("tx2gene.csv")  # mapeia transcriptos para genes

txi <- tximport(files, type = "salmon", tx2gene = tx2gene)
dds <- DESeqDataSetFromTximport(txi, colData = samples, design = ~ condition)
```