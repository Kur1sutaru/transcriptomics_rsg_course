# 🧪 Exercícios – Módulo 3: Trimming e Pré-processamento

1. Acesse o Galaxy e faça o upload de um arquivo `.fastq.gz` de RNA-seq (use o dataset do curso ou do GEO).
2. Rode o FastQC e observe se há presença de adaptadores e baixa qualidade nas extremidades.
3. Execute o trimming com:
   - Trimmomatic, com sliding window (4:20) e min length = 36
   - fastp, com trimming automático
4. Compare os arquivos antes e depois do trimming usando MultiQC.
5. Qual ferramenta foi mais eficaz? Justifique com base no relatório.