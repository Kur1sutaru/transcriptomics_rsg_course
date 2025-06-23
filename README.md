# transcriptomics_rsg_course




Curso Online: Análise de Transcriptomas com R e Galaxy usando DESeq2
Cristal Villalba e RSG Brazil

Carga horária total: 8 horas (2 dias)
Formato: Online, com aulas ao vivo e/ou gravadas, materiais práticos e datasets reais do GEO



 * Pré-requisitos: Conhecimentos básicos de biologia molecular e noções de estatística, alem de saber usar R - Rstudio


* Objetivo Geral


   * Capacitar os participantes a realizar análise de expressão gênica diferencial (RNA-seq) com DESeq2, utilizando tanto a plataforma gráfica Galaxy quanto scripts em R, com interpretação de resultados e visualização de dados.



Módulo 1 – Introdução ao RNA-seq e Preparação de Dados (2h)
Conteúdo:
Fundamentos de RNA-seq: como funciona, o que mede, tipos de experimento


Estrutura de um projeto de transcriptoma (layout, replicatas, controle, condições)


Introdução ao NCBI GEO: busca e download de datasets públicos


Conversão de dados brutos (FASTQ) e contagens com Galaxy


Introdução ao Galaxy e ferramentas relevantes (FastQC, HISAT2, featureCounts)


Atividade prática:
Acessar um projeto no Galaxy


Importar arquivos FASTQ do GEO


Alinhar leituras com HISAT2


Gerar matriz de contagem com featureCounts





Módulo 2 – Análise com DESeq2 no R (2h)
Conteúdo:
Importação e manipulação de matrizes de contagem


Estrutura do DESeq2: DESeqDataSet, normalização e dispersão


Teste estatístico para genes diferencialmente expressos


Exportação de resultados


Atividade prática:
Rodar análise passo a passo em R com DESeq2


Filtrar genes com padj < 0.05 e log2FoldChange > 1


Gerar planilhas com os principais genes






Módulo 3 – Visualizações e Enriquecimento Funcional (2h)
Conteúdo:
Gráficos com DESeq2: MA plots, PCA, heatmaps, volcano plots


Enriquecimento funcional: Gene Ontology (GO) e KEGG


Ferramentas: clusterProfiler, org.Hs.eg.db


Atividade prática:
Gerar gráficos de qualidade de análise


Interpretar principais vias e funções alteradas




Módulo 4 – Comparando Galaxy vs R e Aplicações Reais (2h)
Conteúdo:
Comparando fluxos em Galaxy e R


Interpretação de resultados biológicos


Estudos de caso com datasets reais (ex: câncer, inflamação)


Boas práticas para publicação e reprodutibilidade


Atividade prática:
Analisar um segundo dataset com DESeq2 no Galaxy e comparar com R


Montar um mini-relatório com gráficos e genes destacados
Materiais e Recursos
Scripts em R comentados


PDF com passo a passo no Galaxy


Links para datasets GEO sugeridos


Listas de comandos e funções úteis


Templates de relatórios e gráficos




* Objetivos de Aprendizagem

Ao final do curso, o participante será capaz de:
Compreender o fluxo de trabalho completo de análise RNA-seq


Realizar análises no Galaxy e no R de forma autônoma


Interpretar os resultados de DESeq2 estatística e biologicamente


Gerar visualizações e relatórios prontos para apresentação ou publicação



Pré-requisitos no R:
Pacotes BiocManager, "DESeq2", "tidyverse", "pheatmap", "apeglm"


