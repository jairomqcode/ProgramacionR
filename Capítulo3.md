# 3. Acceso a porciones o subconjuntos de datos.

## 3.1. Los operadores de acceso o selección.

Los operadores de acceso a los datos estructurados: vectores, matrices, factores, listas y data frames, son:

* **[]** . (Ejemplo: mtx[2,3]) Este operador siempre regresa un objeto de la misma clase que el original1 y se puede emplear para seleccionar más de un elemento.

* **[[]]** . (Ejemplo: ff[[“Nombre”]]) Este operador se emplea para extraer elementos de una lista; esto incluye a los data frames que, como se ha dicho anteriormente, son un tipo particular de lista. Sólo permite la extracción o el acceso a un sólo elemento, aunque el elemento en sí mismo puede ser compuesto, y el objeto resultante no necesariamente es de la misma clase que la lista o data frame original.

* **$** . (Ejemplo: ff$Nombre) Este operador se emplea para extraer o acceder a los elementos de una lista o un data frame, a partir del nombre del elemento. Este operador hace más o menos lo mismo que el operador [[]].

## 3.2. El operador **[]**.

En el capítulo anterior se ha visto el uso de este operador para seleccionar o tener acceso a elementos individuales de distintos tipos de datos estructurados: vectores, matrices, factores, listas y data frames. Se visitarán nuevamente esos tipos de datos estructurados, pero para un uso más elaborado del operador.

### 3.2.1. Vectores y factores.

Tanto los vectores como los factores son estructuras unidimensionales, de este modo, el uso del operador **[]** es semejante en ambos. Anteriormente se ha visto como seleccionar un elemento de ambas estructuras. Veremos ahora como seleccionar grupos de elementos.

#### 3.2.1.1. Selección de una secuencia de elementos, o elementos particulares.

Un ejemplo de selección de una secuencia de elementos contenida en un vector podría ser con una indexación como la que se muestra a continuación:

```{r}
# P.ej. para un vector de 20 números aleatorios, generados
# con la función rnorm(), que genera números aleatorios con
# una distribución normal:

v <- rnorm(20)
print(v)
sol:
[1]  1.80099423 -1.56668245 -1.54117099 -0.64308253  1.64969029  0.07976817  1.70611545  0.68070015 -0.20362007  1.47979070
[11] -0.41533051 -0.59062115 -0.19576691  0.66899170 -2.10006550 -0.32898186 -1.24643484  0.62083826 -0.81350313  0.31424353

# Si queremos seleccionar de esos, sólo los números en las
# posiciones de la 5 a la 15:

subv <- v[5:15]
print(subv)
sol:
[1] -0.1453487 -0.7277275  1.7556112  1.1870790 -2.0023327 -1.6967370 -0.7265532  1.7976240 -0.7226971 -0.6689269
[11] -0.4014883
```

