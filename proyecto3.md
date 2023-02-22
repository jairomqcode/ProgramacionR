# Proyecto 3.

cálculo del módulo o magnitud de un vector de números reales y el cálculo del promedio, o media, de un conjunto de datos provistos como un vector numérico. En el primer caso, recuérdese que dado un vector n-dimensional:

```{r}
v = (v1, v2, . . . , vn),
```

Su módulo o magnitud está dado por:

```{r}
|v| = (i=1 a n ∑ vi^2)
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

Nótese cómo, de manera admirable, esta forma de programación se apega mucho más a la fórmula matemática mostrada previamente.
El problema de la media de los valores en un vector numérico es incluso más sencillo. Para el mismo vector, v, definido con anterioridad, la siguiente
fórmula sirve para obtener la media:

```{r}
prom(v) = 1/n (i=1 a n ∑ vi)
```

En un lenguaje de programación usual, esto se haría más o menos así:

```{r}
# Primeramente construyamos un vector con elementos numéricos arbitrarios, con un generador de números aleatorios (distribución uniforme), entre 10.5 y 40.8, generamos 32 números, así:
nums <- runif(32, 10.5, 40.8)
suma <- 0 # Iniciamos la suma como cero
for (elt in nums) {suma <- suma + elt # se agrega cada elemento}
# Se calcula e imprime el promedio
print(promedio <- suma/length(nums))

sol:
[1] 23.95907

# También, se puede calcular como:
print(promedio <- sum(nums)/length(nums))
sol:
[1] 23.95907

# Podemos convertir estas operaciones en una función, así:
haz_promedio <- function(v) {sum(v)/length(v)}
# Y llamamos a la función:
print(haz_promedio(nums))
sol:
[1] 23.95907
```

Desde luego que un lenguaje como R, cuenta ya con una función que permite hacer este cálculo en un solo disparo: la función **mean()**.

```{r}
mean(nums)

sol:
[1] 23.95907
```
