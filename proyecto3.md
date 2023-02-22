# Proyecto 3.

cálculo del módulo o magnitud de un vector de números reales y el cálculo del promedio, o media, de un conjunto de datos provistos como un vector numérico. En el primer caso, recuérdese que dado un vector n-dimensional:

```{r}
v = (v1, v2, . . . , vn),
```

Su módulo o magnitud está dado por:

```{r}
|v| = (n - i=1 ∑ vi^2)
```

Dadas las estructuras de control aprendidas previamente, y sabiendo que el operador ^, sirve para elevar a una potencia dada y la función **sqrt()**, extrae la raíz cuadrada, la tentación inmediata es resolver esta operación como se hace en la mayoría de los lenguajes procedurales:

```{r}
# Sea el vector:
vv <- c(-2, 3, 4)
# Se creará una función que haga el trabajo
modulo <- function(vv) {
  s <- 0 # Contendrá la suma de cuadrados
  for (elt_v in vv) {
    s <- s + elt_v^2 # Incrementamos la suma
  }
  # El resultado es la raíz de la suma:
  sqrt(s)
}
# y el módulo que queremos es:
modulo(vv)

sol:
[1] 5.385165
```

También, se puede solucionar de la siguiente manera:

```{r}
vv <- c(-2, 3, 4)
# Puede quedar en una línea, así:
modulo0 <- function(vv) {sqrt(sum(vv^2))}
# y la utilizamos igual:
print(modulo(vv))

sol:
[1] 5.385165
```
