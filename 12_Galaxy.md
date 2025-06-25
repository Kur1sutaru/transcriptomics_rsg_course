# 🌌 Guia Completo para Análise de RNA-seq no Galaxy

## 📚 Sumário
- [🔐 1. Criar Conta e Acessar o Galaxy](#1-criar-conta-e-acessar-o-galaxy)
- [📤 2. Carregar seus Dados (FASTQ, contagens, metadados)](#2-carregar-seus-dados-fastq-contagens-metadados)
- [🧬 3. Escolher ou Importar um Workflow de RNA-seq](#3-escolher-ou-importar-um-workflow-de-rna-seq)
- [⚙️ 4. Passos Típicos de um Workflow RNA-seq no Galaxy](#4-passos-típicos-de-um-workflow-rna-seq-no-galaxy)
- [📊 5. Ferramentas de Expressão Diferencial com DESeq2](#5-ferramentas-de-expressão-diferencial-com-deseq2)
- [🔗 6. Links Úteis e Repositórios Oficiais](#6-links-úteis-e-repositórios-oficiais)
- [✅ 7. Boas Práticas](#7-boas-práticas)

---

## 🔐 1. Criar Conta e Acessar o Galaxy

Você pode usar o Galaxy **sem instalar nada**. Basta criar uma conta:

- 🌍 Plataforma oficial: [https://usegalaxy.org](https://usegalaxy.org)
- Europa (mais rápido na maioria das vezes): [https://usegalaxy.eu](https://usegalaxy.eu)
- Brasil (em construção): [https://usegalaxy.org.br](https://usegalaxy.org.br)

---

## 📤 2. Carregar seus Dados (FASTQ, contagens, metadados)

- Vá em **Upload Data** (ícone de nuvem na parte superior esquerda).
- Envie arquivos `.fastq`, `.csv`, `.tsv`, `.gtf`, etc.
- Você pode usar também:
  - Google Drive
  - FTP
  - Links diretos (ex: SRA, GEO)

---

## 🧬 3. Escolher ou Importar um Workflow de RNA-seq

### Opção 1 – Usar um workflow existente no Galaxy EU:
1. Vá até: [https://usegalaxy.eu/workflows/list_published](https://usegalaxy.eu/workflows/list_published)
2. Procure por:
   - “RNA-seq”
   - “RNA STAR + DESeq2”
   - “RNA-Seq DGE”
3. Clique em "Import Workflow" para adicioná-lo à sua conta

### Opção 2 – Criar seu próprio workflow
1. Vá no menu **Workflow > Create**
2. Adicione ferramentas como:
   - `FastQC` → `Trimmomatic` → `STAR` → `FeatureCounts` → `DESeq2`
3. Salve e execute com seus dados

---

## ⚙️ 4. Passos Típicos de um Workflow RNA-seq no Galaxy

| Etapa | Ferramenta no Galaxy |
|-------|-----------------------|
| **1. QC de leitura** | FastQC |
| **2. Corte de adaptadores** | Trimmomatic ou Cutadapt |
| **3. Alinhamento ao genoma** | STAR, HISAT2 |
| **4. Contagem de genes** | FeatureCounts |
| **5. Análise diferencial** | DESeq2, EdgeR |
| **6. Visualizações** | PCA, Heatmap, MA-plot, Volcano plot |

---

## 📊 5. Ferramentas de Expressão Diferencial com DESeq2

- Após gerar matriz de contagem com `FeatureCounts`, rode `DESeq2`.
- Entradas:
  - Matriz de contagens
  - Planilha de metadados (colunas: sample_id, condition)
- Ative opções como:
  - `output normalized counts`
  - `Cook’s distance`
  - `independent filtering`
- Exporte resultados com p-adj e log2FoldChange

---

## 🔗 6. Links Úteis e Repositórios Oficiais

| Recurso | Link |
|--------|------|
| Galaxy Main | https://usegalaxy.org |
| Galaxy EU | https://usegalaxy.eu |
| Workflows Públicos Galaxy EU | https://usegalaxy.eu/workflows/list_published |
| Curso oficial RNA-seq Galaxy | https://training.galaxyproject.org/training-material/topics/transcriptomics/ |
| Exemplo de workflow RNA-seq Galaxy EU | https://usegalaxy.eu/u/rosenbrock/w/rna-seq-differential-expression-star-featurecounts-deseq2 |

---

## ✅ 7. Boas Práticas

- Use **mínimo 3 replicatas biológicas** por grupo.
- Sempre inspecione `FastQC` antes e depois da filtragem.
- Revise o `Design Formula` no DESeq2 (`~ condition`).
- Normalize os dados antes de gerar gráficos (use `rlog` ou `vst`).
- Filtre genes com `padj < 0.05` e `|log2FC| > 1` para priorização.

---

## 👩‍🔬 Para Suporte
- Fórum Galaxy: [https://help.galaxyproject.org](https://help.galaxyproject.org)
- Chat da comunidade: [https://matrix.to/#/#galaxyproject:matrix.org](https://matrix.to/#/#galaxyproject:matrix.org)

---

