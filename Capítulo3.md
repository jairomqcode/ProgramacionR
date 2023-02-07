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

Nótese que efectivamente, como se ha dicho anteriormente, la clase de dato resultante de la operación es la misma que la de entrada, un vector numérico en este caso:

```{r}
print(class(v))
sol:
[1] "numeric"

print(class(subv))
sol:
[1] "numeric"
```

El caso de los factores es similar. Se tomará un ejemplo introducido en la sección 2.4: un factor con ciertos meses de nacimiento:

```{r}
Fmes.nacimiento <- factor(c("Dic", "Feb", "Oct", "Mar", "Feb", "Nov", "Abr", "Dic", "Feb", "Oct", "Dic"), levels=c("Ene","Feb","Mar","Abr","May","Jun", "Jul","Ago","Sep","Oct","Nov","Dic"))

print(Fmes.nacimiento)
sol:
[1] Dic Feb Oct Mar Feb Nov Abr Dic Feb Oct Dic
Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic
```

Si se quiere extraer de ahí solamente los elementos comprendidos entre el dos y el cinco, se hace así:

```{r}
print(sub.Fmes.nacimiento <- Fmes.nacimiento[2:5])
sol:
[1] Feb Oct Mar Feb
Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic
```

Nótese que la salida sigue siendo un factor, con los mismos Levels (niveles), que el factor original, pero recortado de acuerdo con la operación indicada en el operador. Recuérdese que el código 2:5, en realidad es un vector entero, a saber: 2, 3, 4, 5; se antoja entonces natural extender la indexación, al uso de vectores de enteros arbitrarios. Esto es, para seleccionar subconjuntos arbitrarios de los vectores o factores originales. Así por ejemplo, para seleccionar los elementos, 2, 3, y del 5 al 8, tanto en el vector como en el factor de los ejemplos anteriores, se puede hacer de la siguiente manera:

```{r}
print(sub1.v <- v[c(2, 3, 5:8)])
sol:
[1] -0.1671858 -0.5170983 -0.1453487 -0.7277275  1.7556112  1.1870790

print(sub1.Fmes.nacimiento <- Fmes.nacimiento[c(2, 3, 5:8)])
sol:
[1] Feb Oct Feb Nov Abr Dic
Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic
```

Por otra parte, en esta mismo tema, los índices negativos, tienen el significado de excluir los elementos señalados por el índice. Así, el complemento de los subconjuntos anteriores se puede obtener así:

```{r}
print(sub2.v <- v[-c(2, 3, 5:8)])
sol:
 [1]  0.9568723 -0.2140801 -2.0023327 -1.6967370 -0.7265532  1.7976240 -0.7226971 -0.6689269 -0.4014883  0.6778322
[11]  0.1656010  0.6264270 -1.6318052 -0.3667483

print(sub2.Fmes.nacimiento <- Fmes.nacimiento[-c(2, 3, 5:8)])
sol:
[1] Dic Mar Feb Oct Dic
Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic
```

#### 3.2.1.2. Selección de elementos de acuerdo con una condición.

En la sección 2.2.5, se han introducido los operadores lógicos. Haciendo uso de esa noción, se puede por ejemplo, distinguir en el vector v, los elementos negativos de aquellos que no lo son, obteniendo un vector de lógicos, de la siguiente manera:

```{r}
print(v < 0)
sol:
[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
```

Surge la pregunta: ¿cómo se pueden extraer, con esta información, los elementos negativos o los positivos del vector original? El lenguaje permite utilizar como índice del operador [], un vector de lógicos en el que se obtendrá como salida un vector compuesto de los elementos cuyo índice sea TRUE. Entonces, la respuesta a la pregunta original se puede dar de las siguientes maneras:

```{r}
# Los negativos:
print(v[v < 0])
sol:
[1] -0.1671858 -0.5170983 -0.2140801 -0.1453487 -0.7277275 -2.0023327 -1.6967370 -0.7265532 -0.7226971 -0.6689269
[11] -0.4014883 -1.6318052 -0.3667483

# Primera forma de obtener los positivos, mediante la negacion lógica, con el operador !
print(v[!(v < 0)])
sol:
[1] 0.9568723 1.7556112 1.1870790 1.7976240 0.6778322 0.1656010 0.6264270

# Segunda forma de obtener los positivos, mediante el operador >=
print(v[v >= 0])
sol:
[1] 0.9568723 1.7556112 1.1870790 1.7976240 0.6778322 0.1656010 0.6264270
```

