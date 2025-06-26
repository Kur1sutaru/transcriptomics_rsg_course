
# 📊 Tutorial: Como Analisar Dados do GEO (ex: GSE262091) sem FASTQ

Este tutorial mostra como analisar dados do GEO já processados, sem necessidade de baixar arquivos FASTQ, utilizando:

- 🔬 Galaxy (via arquivos suplementares)
- 📦 R (via GEOquery + limma)

---

## 🔹 1. Entendendo o Estudo

Acesse o estudo GEO:  
🔗 [GSE262091 - NCBI GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE262091)

- O estudo possui dados **processados** como arquivos `.txt` e `.csv` na seção **"Supplementary files"**.
- Esses arquivos geralmente contêm:
  - Expressão gênica (TPM, counts ou log2FC)
  - Anotações experimentais (metadados)

---

## 🚀 Parte 1: Usando o Galaxy com Dados Processados

### ✅ Etapas

1. Vá para o Galaxy:  
   [usegalaxy.org](https://usegalaxy.org) ou [usegalaxy.eu](https://usegalaxy.eu)

2. Acesse **Tools → Get Data → Upload File**
   - Vá na aba **Paste/Fetch Data**
   - Cole a URL direta do arquivo `.txt` ou `.csv` da seção “Supplementary files” do GEO

     Exemplo:
     ```
     https://ftp.ncbi.nlm.nih.gov/geo/series/GSE262nnn/GSE262091/suppl/GSE262091_normalized_counts.txt.gz
     ```

3. Clique em **Start** e depois em **Close**.

4. Vá em:
   - **Statistics → DESeq2 (se for count)**
   - **Statistics → limma** (se for microarray ou log2 data)

5. Defina as colunas de grupo (ex: controle vs tratamento) e execute.

6. Visualize os resultados:  
   - Tabela de genes diferencialmente expressos  
   - Volcano plot, heatmap, PCA

---

## 🧪 Parte 2: Análise em R com GEOquery + limma

### 📦 Instalar pacotes (se necessário)
```r
if (!require("BiocManager")) install.packages("BiocManager")
BiocManager::install(c("GEOquery", "limma"))
```

### 📥 Baixar os dados
```r
library(GEOquery)
gse <- getGEO("GSE262091", GSEMatrix = TRUE)
expr <- exprs(gse[[1]])
meta <- pData(gse[[1]])
```

### 📊 Análise com limma
```r
library(limma)

# Definindo grupos
group <- factor(meta$`characteristics_ch1.1`)  # ou o nome da coluna de grupo
design <- model.matrix(~0 + group)
colnames(design) <- levels(group)

# Ajuste com limma
fit <- lmFit(expr, design)
contrast <- makeContrasts(Treated - Control, levels = design)
fit2 <- contrasts.fit(fit, contrast)
fit2 <- eBayes(fit2)

# Resultados
topTable(fit2, adjust = "BH")
```

### 🧬 Plot
```r
volcanoplot(fit2)
```

---

## 📌 Considerações

- Essa estratégia é ideal para:
  - Microarranjos
  - RNA-seq já normalizado (TPM, log2CPM, etc.)
- Verifique os metadados (`pData`) para identificar grupos e condições

---

## 📁 Extras

- Você pode exportar os resultados como CSV ou gerar gráficos interativos no R usando `EnhancedVolcano` ou `ggplot2`.
- Para análises funcionais, use os pacotes `clusterProfiler` ou `enrichR`.

---
