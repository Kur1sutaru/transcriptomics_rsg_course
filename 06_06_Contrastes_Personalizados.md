# 🧪 Módulo 6 – Comparações Múltiplas com `contrast = c(...)`

## Exemplo 1: simples
```r
results(dds, contrast = c("condition", "treated", "control"))
```

## Exemplo 2: três grupos (A, B, C)
```r
dds$group <- relevel(dds$group, ref = "A")
res_BvsA <- results(dds, contrast = c("group", "B", "A"))
res_CvsA <- results(dds, contrast = c("group", "C", "A"))
```

## Exemplo 3: interação
```r
design(dds) <- ~ genotype * treatment
results(dds, name = "genotypeKO.treatmenttreated")
```