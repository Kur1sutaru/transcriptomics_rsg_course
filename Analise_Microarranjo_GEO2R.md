# 🧬 Análise de Microarranjos com GEO2R

## 🎯 Objetivo
Aprender a realizar análise de expressão gênica diferencial em experimentos de microarranjo usando a ferramenta online **GEO2R** do NCBI.

---

## 🧠 O que é GEO2R?

O **GEO2R** é uma ferramenta web que permite comparar dois ou mais grupos de amostras em estudos de expressão depositados no banco de dados **GEO (Gene Expression Omnibus)**.

📍 Acesse: https://www.ncbi.nlm.nih.gov/geo/geo2r/

---

## 📊 Etapas da análise no GEO2R

1. Acesse um dataset do GEO (ex: [GSE47472](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE47472)).
2. Clique em "Analyze with GEO2R".
3. Defina os grupos (ex: Controle vs Tratado).
4. Clique em "Top 250" para visualizar os genes diferencialmente expressos.
5. Faça o download completo usando o botão "Save all results".

---

## 🧾 Interpretação dos resultados

| Coluna | Descrição |
|--------|-----------|
| Gene.symbol | Nome do gene |
| adj.P.Val | Valor de p ajustado (FDR) |
| logFC | Log2 Fold Change |
| P.Value | Valor p não ajustado |
| AveExpr | Expressão média |

**Critério comum**: `adj.P.Val < 0.05` e `|logFC| > 1`.

---

# ✅ Exercícios práticos

1. Acesse o GEO e encontre um dataset de microarranjo com no mínimo 8 amostras.
2. Abra no GEO2R e defina 2 grupos experimentais.
3. Baixe os resultados completos da análise.
4. Filtre os genes com `adj.P.Val < 0.05` e `|logFC| > 1`.
5. Liste os 10 genes mais diferencialmente expressos.
6. Faça uma busca no NCBI Gene para interpretar a função de pelo menos 3 genes.

---

## 📝 Dica

Você pode importar os resultados salvos do GEO2R em um script R para visualização local:

```r
res <- read.delim("GEO2R_results.txt")
sig <- subset(res, adj.P.Val < 0.05 & abs(logFC) > 1)
head(sig[order(sig$logFC, decreasing=TRUE), ])
```