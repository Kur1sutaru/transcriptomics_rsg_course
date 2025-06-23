# 🌐 Módulo 8 – Exportação e Reprodutibilidade

### Exportar resultados:
```r
write.csv(as.data.frame(res), "DEG_results.csv")
```

### Gerar relatório com RMarkdown
```r
rmarkdown::render("meu_analise.Rmd")
```

### Salvar ambiente
```r
save.image("analise_transcriptoma.RData")
```