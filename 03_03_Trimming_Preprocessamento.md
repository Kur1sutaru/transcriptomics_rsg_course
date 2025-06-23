# 🔧 Módulo 3 – Trimming e Pré-processamento Avançado

## Quando remover adaptadores?
- Quando detectados no relatório do FastQC (>10%).
- Quando há queda na qualidade nas extremidades 3’ das leituras.
- Quando há leituras muito curtas, com baixa qualidade ou contendo muitos ‘N’.

## Ferramentas para trimming

### 🧬 Trimmomatic
- Requer seleção manual do adaptador (TruSeq2, Nextera etc).
- Permite múltiplas estratégias: sliding window, quality threshold.
- Ideal para pipelines clássicos com controle fino dos parâmetros.

### ⚡ fastp
- Detecta adaptadores automaticamente.
- Aplica trimming de qualidade e gera relatórios com gráficos.
- Mais rápido e fácil de configurar, excelente para Galaxy.

## No Galaxy:
- Trimmomatic: escolha adaptador + sliding window (ex: 4:20), min length = 36.
- fastp: marque opções de trimming e visualize o relatório HTML.