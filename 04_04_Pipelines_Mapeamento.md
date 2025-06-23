# 🔎 Módulo 4 – Comparação entre Pipelines de Mapeamento

## Ferramentas:
- **HISAT2**: rápido, sensível para alinhamento de RNA-seq, usado amplamente.
- **STAR**: mais pesado em RAM, porém extremamente rápido para grandes genomas.
- **Salmon**: método de pseudoalignment (sem alinhamento direto), rápido e preciso.

## Comparativo:

| Ferramenta | Tipo | Velocidade | Recurso | Saída |
|-----------|------|------------|---------|--------|
| HISAT2    | Alinhador | Média | Moderado | BAM |
| STAR      | Alinhador | Alta | Alta RAM | BAM |
| Salmon    | Pseudoaligner | Altíssima | Baixo | Quant.sf |

## Quando usar qual?
- Use HISAT2/STAR para downstream baseado em loci (ex: splice variants).
- Use **Salmon** quando seu foco for **expressão por transcrito**.
- Galaxy inclui wrapper para **Salmon quant** com índice preconstruído.