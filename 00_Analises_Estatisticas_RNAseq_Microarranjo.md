# 📈 Análises Estatísticas Essenciais para RNA-seq e Microarranjos

Este guia resume as principais abordagens estatísticas que você deve conhecer para interpretar experimentos de expressão gênica, tanto com microarranjos quanto com RNA-seq.

---

## 📊 1. Normalização

### RNA-seq:
- **TMM (Trimmed Mean of M-values)** – edgeR
- **DESeq size factors** – DESeq2
- **FPKM/TPM** – usadas para visualização, não para teste estatístico
- **VST/rlog** – transformações estabilizadoras de variância (para PCA/heatmap)

### Microarranjo:
- **Quantile normalization**
- **RMA (Robust Multi-array Average)**
- **Log2 transformação**

---

## 🧪 2. Testes Estatísticos para Genes Diferencialmente Expressos

### RNA-seq:
- Modelos baseados em contagem (distribuição **negativo binomial**)
  - **DESeq2** – shrinkage + Wald test / LRT
  - **edgeR** – glm + likelihood ratio test
  - **limma-voom** – aproxima RNA-seq a modelos lineares (microarranjo-style)

### Microarranjo:
- **limma** – modelo linear com moderação bayesiana de variância
- Comparação de médias via modelos lineares:
  - `lmFit()` + `eBayes()` → `topTable()`

---

## 🎯 3. Correção para Múltiplos Testes

- FDR (False Discovery Rate)
- Método de Benjamini-Hochberg
- Evita falsos positivos devido a milhares de testes simultâneos

> Regra comum: considerar `adj.p.value < 0.05`

---

## 🧮 4. Estatísticas de Exploração e Visualização

- **PCA (Análise de Componentes Principais)** → detectar outliers e separação entre grupos
- **Heatmaps hierárquicos** → clustering baseado em expressão
- **Boxplots e densidade** → ver distribuição das amostras

---

## 🔄 5. Modelagem de Contrastes

- Comparações específicas entre grupos usando contrastes
  - Ex: tratado vs controle, KO vs WT, tempo 24h vs 0h
- Modelos multifatoriais:
  - Interações: `~ genotype * treatment`
  - Bloqueios: `~ batch + condition`

---

## 📦 6. Enriquecimento Funcional (pós-DEG)

- **Teste de Hipótese:** Hipergeométrico ou Fisher (over-representation)
- **GSEA (Gene Set Enrichment Analysis):** ranking contínuo (ex: logFC)
- Bancos de dados:
  - GO (Gene Ontology)
  - KEGG
  - Reactome
  - MSigDB

---

## 📉 7. Correlação e Regressão (quando comparar com outros ômicos)

- Correlação de expressão entre genes ou com outras camadas (ATAC-seq, metilação)
- **Correlação de Pearson ou Spearman**
- Regressão linear para associação entre expressão e fenótipo clínico

---

## 🧠 8. Avaliação de Qualidade e Outliers

- Boxplots por amostra
- PCA com agrupamento inesperado
- Testes de variância e presença de batch effect

---

## ✅ Ferramentas que aplicam essas análises

| Análise                       | RNA-seq      | Microarray   |
|------------------------------|--------------|--------------|
| Normalização                 | DESeq2, edgeR| limma, affy  |
| DEG                          | DESeq2, edgeR, limma-voom | limma |
| Contrastes                  | DESeq2, limma | limma        |
| Enriquecimento GO/KEGG      | clusterProfiler, fgsea | clusterProfiler |
| Visualização                | pheatmap, EnhancedVolcano, plotly | idem |

---

## 📝 Conclusão

Dominar esses conceitos permite interpretar com segurança resultados de expressão gênica, validar experimentalmente descobertas e produzir análises robustas e publicáveis.
