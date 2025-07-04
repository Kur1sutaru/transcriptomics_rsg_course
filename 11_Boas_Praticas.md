# 🧬 Análise de RNA-seq com DESeq2 no Galaxy

## 📚 Sumário <!-- TOC -->
[📌 Objetivo](#-objetivo)
[⚠️ Principais Armadilhas e Como Resolver](#️-principais-armadilhas-e-como-resolver)
[1. Problemas de Convergência](#1-problemas-de-convergência)
[2. Outliers Fortes](#2-outliers-fortes)
[3. Dados Faltantes ou Mal Formatados](#3-dados-faltantes-ou-mal-formatados)
[4. Normalização Inadequada](#4-normalização-inadequada)
[5. Modelo Experimental Incorreto](#5-modelo-experimental-incorreto)
[🛠️ Ferramentas no Galaxy Recomendadas](#️-ferramentas-no-galaxy-recomendadas)
[✅ Exemplo Prático](#-exemplo-prático)
[📚 Referências](#-referências)



## 📌 Objetivo
Realizar análise de expressão diferencial usando **DESeq2** no **Galaxy**, evitando erros comuns como:
- Falha de convergência
- Outliers extremos
- Dados faltantes ou mal formatados
- Normalização inadequada
- Modelo experimental incorreto



## ⚠️ Principais Armadilhas e Como Resolver

### 1. Problemas de Convergência
**Sintoma:** Mensagens de erro como `iteration limit reached`.

**Diagnóstico:**
- DESeq2 falha ou retorna log2FoldChange como `NA`.

**Soluções:**
- Aplique filtro de baixa expressão antes de rodar DESeq2.
- Ative `independent filtering = TRUE` no Galaxy.
- Verifique se há replicatas biológicas suficientes (mínimo 3 por grupo).



### 2. Outliers Fortes
**Sintoma:** Genes com valores extremos e estatísticas incoerentes.

**Diagnóstico:**
- Gere gráficos de Cook’s Distance no Galaxy.
- Execute PCA para visualizar agrupamentos.

**Soluções:**
- Use a opção `cooksCutoff = TRUE`.
- Remova amostras discrepantes se necessário.

---

### 3. Dados Faltantes ou Mal Formatados
**Sintoma:** Arquivo de contagens falha na importação ou DESeq2 não reconhece colunas.

**Diagnóstico:**
- Inspecione os arquivos com `Inspect`, `Sort`, `Remove columns with NA`.

**Soluções:**
- Verifique:
  - Se há cabeçalho com nomes de amostras.
  - Se todos os campos estão preenchidos.
- Corrija via ferramentas de manipulação de tabela do Galaxy.

---

### 4. Normalização Inadequada
**Sintoma:** Dispersão alta, boxplots desbalanceados entre amostras.

**Diagnóstico:**
- Gere boxplots e PCA após normalização com `rlog` ou `vst`.

**Soluções:**
- Use **normalização por fator de tamanho**.
- Gere contagens normalizadas para visualização.

---

### 5. Modelo Experimental Incorreto
**Sintoma:** Comparações erradas ou sem significado biológico.

**Diagnóstico:**
- Verifique o `Design Formula` (ex: ~ condition).
- Analise a planilha de metadados.

**Soluções:**
- A coluna usada como fator (ex: `condition`) deve ter apenas texto categórico (ex: `tratado`, `controle`).
- Não use espaços ou acentos nos nomes de colunas ou categorias.

---

## 🛠️ Ferramentas no Galaxy Recomendadas

| Etapa | Ferramenta | Finalidade |
|-------|------------|------------|
| Pré-processamento | `FeatureCounts`, `Filter table by expression level` | Contagens e filtro |
| Análise Principal | `DESeq2`, `DESeq2 (Multifactor)` | Expressão diferencial |
| Diagnóstico | `Cook's distance`, `PCA plot`, `MA-plot`, `rlog`, `vst` | QC e validação |
| Visualização | `Heatmap`, `Boxplot`, `Volcano Plot` | Interpretação |
| Manipulação | `Cut`, `Join`, `Group`, `Remove columns with missing values` | Ajuste de tabelas |

---

## ✅ Exemplo Prático

```bash
1. Carregue o arquivo de contagens com genes nas linhas e amostras nas colunas.
2. Importe a tabela de metadados (TSV) com as colunas: sample_id, condition.
3. Rode DESeq2 no Galaxy:
   - Counts file: <seu arquivo>
   - Metadata file: <arquivo de metadados>
   - Design formula: ~ condition
4. Habilite:
   - Output normalized counts
   - Output Cook's distance
   - independentFiltering = TRUE
5. Gere:
   - PCA plot
   - MA plot
   - Heatmap
6. Filtre genes com padj < 0.05 e |log2FC| > 1


:book: Referências
Galaxy DESeq2 Tool Help

Love et al. (2014) DESeq2 paper

Bioconductor DESeq2 vignette
