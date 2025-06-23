# 🧪 Exercícios – Interpretação de FastQC

## 📁 Dataset sugerido:
Use um `.fastq.gz` real ou simulado (por exemplo: SRR12345678 via ENA ou GEO).

---

## 🔄 Passos:

1. Acesse https://usegalaxy.org
2. Faça upload de um `.fastq.gz` ou importe via link FTP/ENA.
3. Execute **FastQC** na amostra.
4. Visualize o relatório HTML.

---

## ✅ Perguntas:

1. O gráfico de “Per base sequence quality” mostra queda na extremidade 3’?  
2. A distribuição de GC está normal? Há picos incomuns?
3. O relatório aponta presença de adaptadores?
4. Qual o tamanho médio das leituras detectadas?
5. Você recomendaria trimming para esta amostra? Por quê?

---

## 🧠 Desafio adicional:
- Execute o **MultiQC** após rodar FastQC em 3 ou mais amostras.
- Compare a qualidade entre elas.
- Qual amostra apresenta mais problemas? Justifique com base nos gráficos.
