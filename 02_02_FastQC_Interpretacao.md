# 📊 Interpretação de Métricas do FastQC

## 🎯 Objetivo
Aprender a interpretar os gráficos e relatórios gerados pelo FastQC para avaliar a qualidade de dados de RNA-seq.

---

## 🔹 1. Per base sequence quality
- Mostra a qualidade média (Phred score) por posição da leitura.
- **Ideal**: Phred > 30 nas posições iniciais e intermediárias.
- **Problema**: queda de qualidade no final da leitura → pode indicar necessidade de trimming.

---

## 🔹 2. Per sequence quality scores
- Distribuição da qualidade média por leitura.
- Deve apresentar um pico alto próximo de Phred 30–40.
- Distribuições largas indicam variabilidade entre as leituras.

---

## 🔹 3. Per base sequence content
- Proporção de A, T, G, C por posição na leitura.
- Leituras RNA-seq podem ter pequeno desbalanceamento no início.
- Grandes desvios podem indicar contaminação ou adaptadores.

---

## 🔹 4. Per sequence GC content
- Distribuição da %GC entre todas as leituras.
- Deve formar uma curva normal.
- Picos secundários ou formatos irregulares podem indicar contaminação.

---

## 🔹 5. Sequence Length Distribution
- Tamanho das leituras detectadas.
- Deve ser constante (ex: 75 bp, 100 bp).
- Leituras muito curtas → trimming agressivo ou erro na geração dos dados.

---

## 🔹 6. Adapter Content
- Mostra presença de sequências adaptadoras.
- Se >10% em qualquer posição → aplicar trimming com fastp ou Trimmomatic.

---

## ✅ Dicas Gerais

- Use MultiQC para consolidar os relatórios de várias amostras.
- Se a maioria das métricas estiver verde ou amarela, os dados são utilizáveis.
- Adaptadores e baixa qualidade no final são os principais alvos de trimming.
