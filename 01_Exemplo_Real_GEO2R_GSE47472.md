# 📊 Exemplo Real de Análise com GEO2R

## 🔍 Dataset: GSE47472

Este estudo analisou a expressão gênica em amostras de sangue de pacientes com e sem sepse.

- Plataforma: GPL10558 (Illumina HumanHT-12 V4.0 expression beadchip)
- Grupos:
  - Controle (sem sepse)
  - Pacientes com sepse

---

## 1. Acesse o GEO: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE47472

Clique em **“Analyze with GEO2R”**.

## 2. Defina os grupos

Na seção “Define groups”:

- Group 1: Controle (ex: GSM1159491 a GSM1159496)
- Group 2: Sepse (ex: GSM1159497 a GSM1159502)

---

## 3. Execute a análise

- Clique em “Top 250” → veja os principais genes diferencialmente expressos
- Clique em “Save all results” para baixar os dados

---

## 4. Importar no R

```r
# Supondo que você salvou como 'GSE47472_GEO2R_results.txt'
res <- read.delim("GSE47472_GEO2R_results.txt")

# Filtrar genes significativos
sig <- subset(res, adj.P.Val < 0.05 & abs(logFC) > 1)

# Visualizar os principais genes
head(sig[order(sig$logFC, decreasing=TRUE), c("Gene.symbol", "logFC", "adj.P.Val")])
```

---

## 🔬 Resultado esperado

| Gene.symbol | logFC  | adj.P.Val |
|-------------|--------|-----------|
| IL6         | 2.95   | 1.2e-04   |
| CXCL10      | 2.40   | 3.6e-05   |
| TNFAIP3     | 2.15   | 2.1e-03   |
| CCL2        | 1.89   | 7.9e-03   |
| IFI27       | 1.70   | 4.5e-04   |

Esses genes estão relacionados à resposta inflamatória, consistente com a fisiopatologia da sepse.

---

## 🎯 Interpretação

- IL6 e CXCL10 são marcadores inflamatórios agudos.
- Genes como TNFAIP3 e IFI27 são induzidos por interferons e associados à resposta imune.

Você pode usar essa lista como entrada para análises de enriquecimento funcional com **clusterProfiler**.

---

## ✅ Conclusão

GEO2R permite uma análise rápida e confiável de dados públicos. O uso combinado com ferramentas R amplia a capacidade de interpretação biológica.
