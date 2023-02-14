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

Para factores solo las operaciones lógicas para probar la igualdad o desigualdad tienen significado:

```{r}
print(Fmes.nacimiento == "Mar") # igualdad
sol:
[1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE

print(Fmes.nacimiento != "Mar") # desigualdad
sol:
[1]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

No obstante, dado que, como se ha señalado en la sección 2.4.1, los factores tienen implícito un vector de enteros, que indexan el orden establecido por los Levels (niveles) del factor, se puede usar ese hecho para descubrir, en el caso de ejemplo, cuáles son los meses menores o iguales que “Abr” (número de orden 4, en Levels), de la siguiente manera:

```{r}
# El factor convertido a enteros:
print(as.integer(Fmes.nacimiento))
sol:
[1] 12  2 10  3  2 11  4 12  2 10 12

# El vector de logicos:
print(as.integer(Fmes.nacimiento) <= 4)
sol:
[1] FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE


# .. y usado como indice:
print(Fmes.nacimiento[as.integer(Fmes.nacimiento) <= 4])
sol:
[1] Feb Mar Feb Abr Feb
Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic
```

Una nota importante es que los operadores de selección no solamente se usan para consultar los valores, sino que también se pueden emplear para cambiar los valores de los elementos seleccionados mediante el operador. Así por ejemplo, podríamos cambiar cada uno los elementos negativos del vector v, a su correspondiente positivo, mediante la siguiente asignación:

```{r}
v[v < 0] <- -v[v < 0]
# .. y el vector v ahora es:
print(v)
sol:
 [1] 0.9568723 0.1671858 0.5170983 0.2140801 0.1453487 0.7277275 1.7556112 1.1870790 2.0023327 1.6967370 0.7265532 1.7976240
[13] 0.7226971 0.6689269 0.4014883 0.6778322 0.1656010 0.6264270 1.6318052 0.3667483
```

### 3.2.2. Matrices y data frames.

Las matrices y los data frames, son estructuras bidimensionales; es decir, tienen renglones y columnas, y por consiguiente, su comportamiento bajo el operador [] es similar. Como se ha visto en el capítulo 2, el acceso a los elementos individuales a estas dos estructuras consta de dos índices, separados por una coma, en el operador, así: **x[i, j]**; donde, x, es la estructura en cuestión, i, representa el número o identificador de renglón y j, el número o identificador de columna. 

Para las explicaciones y ejemplos que siguen se usarán las matrices y data frames que se generan a continuación:

```{r}
mt <- matrix(11:30, nrow = 4, ncol = 5)
print(mt)
sol:
    [,1] [,2] [,3] [,4] [,5]
[1,]  11   15   19   23   27
[2,]  12   16   20   24   28
[3,]  13   17   21   25   29
[4,]  14   18   22   26   30

# Se convierte la matriz a un data frame:
df.mt <- as.data.frame(mt)
print(df.mt)
sol:
  V1 V2 V3 V4 V5
1 11 15 19 23 27
2 12 16 20 24 28
3 13 17 21 25 29
4 14 18 22 26 30

# Se le asignan nombres a renglones y columnas de df.mt:
rownames(df.mt) <- c("uno", "dos", "tres", "cuatro")
colnames(df.mt) <- c("UNO", "DOS", "TRES", "CUATRO", "CINCO")
print(df.mt)
sol:
       UNO DOS TRES CUATRO CINCO
uno     11  15   19     23    27
dos     12  16   20     24    28
tres    13  17   21     25    29
cuatro  14  18   22     26    30
```

#### 3.2.2.1. El operador [] con un solo índice.

Tanto para matrices como para data frames, el lenguaje permite utilizar el operador **[]** con un solo índice, si bien el significado es diferente para cada uno de los casos. En el caso de las matrices el uso de un solo índice, provoca el tratamiento de la matriz como si fuera un vector constituido por la concatenación de sus columnas y el índice provisto se referirá entonces al elemento correspondiente a esa posición en el vector, mientras que en el caso de los data frames, dado que éstos son listas cuyos elementos son las columnas, ese uso del operador invoca justamente ese tratamiento; esto es, la operación regresará la columna correspondiente al índice dado. Veamos sendos ejemplos de esta operación:

```{r}
# La matriz con índice 5
print(mt[5])
sol:
[1] 15

# El data frame con índice 5
df.mt[5]
sol:
       CINCO
uno       27
dos       28
tres      29
cuatro    30
```

#### 3.2.2.2. Omisión de índices en el operador.

El caso anterior no se debe confundir con la omisión de índices en el operador, ya que en este caso, el operador, mediante una coma señala el espacio para dos índices, uno de los cuales se omite. Aquí, la semántica del operador es similar para matrices y para data frames, ya que en ambos casos, el operador regresa, o bien renglones, o bien columnas, de la estructura sobre la cual se opera. Veamos unos ejemplos:

```{r}
# El tercer renglón:
print(mt[3, ])
sol:
[1] 13 17 21 25 29

print(df.mt[3, ])
sol:
     UNO DOS TRES CUATRO CINCO
tres  13  17   21     25    29

# La tercer columna:
print(mt[, 3])
sol:
[1] 19 20 21 22

print(df.mt[, 3])
sol:
[1] 19 20 21 22
```

Se había dicho en la sección 3.1 que el operador **[]**, siempre regresa un objeto del mismo de la misma clase que el original. Los ejemplos anteriores manifiestan una excepción a esta regla, ya que:

```{r}
print(class(mt[3, ]))
sol:
[1] "integer"

print(class(df.mt[3, ]))  # sólo en este caso se cumple
sol:
[1] "data.frame"

print(class(mt[, 3]))
sol:
[1] "integer"

print(class(df.mt[, 3])
sol:
[1] "integer"
```

El lenguaje tiende a simplificar, cuando puede, a la clase más básica de dato, es decir, a vector; lo que podría resultar útil en algunos casos, pero que, en otros casos, podría complicar la programación. Este extraño comportamiento, no ortogonal, sin embargo, se puede modificar mediante la opción drop=FALSE, al usar el operador, como se muestra a continuación:

```{r}
# El tercer renglón:
print(mt[3, , drop = FALSE])
sol:
     [,1] [,2] [,3] [,4] [,5]
[1,]   13   17   21   25   29

print(class(mt[3, , drop = FALSE]))
sol:
[1] "matrix"

print(df.mt[3, , drop = FALSE])
sol:
     UNO DOS TRES CUATRO CINCO
tres  13  17   21     25    29

print(class(df.mt[3, , drop = FALSE]))
sol:
[1] "data.frame"
```

```{r}
# La tercer columna:
print(mt[, 3, drop = FALSE])
sol:
     [,1]
[1,]   19
[2,]   20
[3,]   21
[4,]   22

print(class(mt[, 3, drop = FALSE]))
sol:
[1] "matrix"

print(df.mt[, 3, drop = FALSE])
sol:
       TRES
uno      19
dos      20
tres     21
cuatro   22

print(class(df.mt[, 3, drop = FALSE]))
sol:
[1] "data.frame"
```

En este mismo tema, el operador permite la selección simultánea de varios renglones o varias columnas. A continuación se muestra el caso de varias columnas, y, dado que es muy similar, se deja al lector investigar cuál sería la forma de seleccionar varios renglones.

```{r}
# Selección de las columnas 4,3,2, en ese orden:
print(mt[, 4:2])
sol:
     [,1] [,2] [,3]
[1,]   23   19   15
[2,]   24   20   16
[3,]   25   21   17
[4,]   26   22   18

print(df.mt[, 4:2])
sol:
      CUATRO TRES DOS
uno        23   19  15
dos        24   20  16
tres       25   21  17
cuatro     26   22  18
```

Nótese que en el caso de múltiples columnas o renglones, dado que en su conjunto no pueden ser simplificados a vectores, el comportamiento del operador [], es ortogonal y obedece a la regla de entregar siempre un objeto de la misma clase que el original. 

Los mecanismos que habilita el operador [] y que se han descrito aquí, también permiten la selección de una ventana en el interior de ambas estructuras.

```{r}
print(mt[1:3, 4:2])
sol:
     [,1] [,2] [,3]
[1,]   23   19   15
[2,]   24   20   16
[3,]   25   21   17

print(df.mt[1:3, 4:2])
sol:
     CUATRO TRES DOS
uno      23   19  15
dos      24   20  16
tres     25   21  17
```

En este caso, como en el ejemplo anterior, se ha cambiado el orden de la secuencia de columnas en la ventana resultante, lo que, por cierto, resulta más evidente en el caso del data frame por el uso de nombres tanto para columnas como para renglones.

#### 3.2.2.3. El uso de índices lógicos o condiciones.

Al igual que en el caso de los vectores y los factores, este operador admite índices de tipo lógico, que resultan de la expresión de condiciones, que pueden ser tan complicadas como se quiera. Se verán aquí algunos ejemplos sencillos tanto para el caso de matrices como para el caso de data frames.

En la matriz y el data frame del ejemplo anterior, el segundo renglón se puede obtener fácilmente de la siguiente manera:

```{r}
print(mt[2, ])
sol:
[1] 12 16 20 24 28

print(df.mt[2, ])
sol:
    UNO DOS TRES CUATRO CINCO
dos  12  16   20     24    28
```

Ahora, supóngase que se quiere obtener ese mismo renglón, pero basado en el hecho de que el valor en la columna 2 es 16. Esto es: obtener el renglón, o renglones, cuyo valor en la columna 2 es 16. Primeramente, obsérvese que todos los valores en la columna 2 de la matriz o del data frame, se pueden comparar contra el valor 16, de la siguientes maneras:

```{r}
print(mt[, 2] == 16)
sol:
[1] FALSE TRUE FALSE FALSE

print(df.mt[, 2] == 16)
sol:
[1] FALSE TRUE FALSE FALSE
```

Como se puede ver el resultado es un vector de lógicos, cada uno de los cuales corresponde a la comparación por igualdad de cada uno de los elementos en la columna dos contra el valor 16; esto es, en cada uno de los renglones de esa columna. Esta comparación se puede utilizar como índice en el espacio correspondiente a los renglones en el operador [], para obtener los renglones que cumplen con la condición establecida. En este caso el arreglo de lógicos resultante de la condición actúa como una máscara o un filtro que sólo deja pasar, de la matriz, aquellos elementos para los cuales hay un valor TRUE, como se muestra a continuación:

```{r}
# Se usan paréntesis, (), para enfatizar la condición, aunque se podría prescindir de ellos:
print(mt[(mt[, 2] == 16), ])
sol:
[1] 12 16 20 24 28


print(df.mt[(df.mt[, 2] == 16), ])
sol:
   UNO DOS TRES CUATRO CINCO
dos 12  16  20    24     28

# En el caso de la matriz, si se quiere obtener como salida una matriz (de un solo renglón), se hace así:
print(mt[(mt[, 2] == 16), , drop = FALSE])
sol:
    [,1] [,2] [,3] [,4] [,5]
[1,] 12    16   20   24   28
```

Modifiquemos ahora la matriz y el data frame, para tener más de un renglón que cumple con esta condición:

```{r}
mt[4, 2] <- 16L
df.mt[4, 2] <- 16L
print(mt)  # El data frame es semejante
sol:
    [,1] [,2] [,3] [,4] [,5]
[1,]   11   15   19   23   27
[2,]   12   16   20   24   28
[3,]   13   17   21   25   29
[4,]   14   16   22   26   30
```

Y ahora, si se aplica nuevamente la operación de prueba, lo que se obtiene es un conjunto de renglones:

```{r}
print(mt[(mt[, 2] == 16), ])
sol:
    [,1] [,2] [,3] [,4] [,5]
[1,]   12   16   20   24   28
[2,]   14   16   22   26   30

print(df.mt[(df.mt[, 2] == 16), ])
sol:
       UNO DOS TRES CUATRO CINCO
dos     12  16   20     24    28
cuatro  14  16   22     26    30
```

Las expresiones o pruebas lógicas usadas como índices pueden ser más complejas si se quiere. Supongamos que se quiere obtener, todas las columnas que en su renglón 2 no son múltiplos de 8; esto se hace como se muestra en seguida.

```{r}
# La prueba lógica hace uso del operador módulo o residuo: %%
print(mt[2, ]%%8 != 0) # (Para el data frame es semejante)
sol:
[1] TRUE FALSE TRUE FALSE TRUE

# Ahora usemos la expresión como índice:
print(mt[, (mt[2, ]%%8 != 0)])
sol:
     [,1] [,2] [,3]
[1,]   11   19   27
[2,]   12   20   28
[3,]   13   21   29
[4,]   14   22   30

print(df.mt[, (df.mt[2, ]%%8 != 0)])
sol:
       UNO TRES CINCO
uno     11   19    27
dos     12   20    28
tres    13   21    29
cuatro  14   22    30
```

## 3.3. Los operadores [[]] y $.

Los operadores **[[]]** y **$**, son más o menos semejantes, aunque éste último limita su aplicación a las listas y, por consiguiente, también a los data frames. Estos operadores establecen formas de tener acceso a los elementos de las distintas estructuras mediante los nombres o identificadores asignados a esos elementos. Si bien es cierto que el operador **[]**, admite también nombres de los elementos como índices, como se ha mostrado en la sección 2.2.4, los operadores discutidos en esta sección habilitan formas más flexibles de tener acceso a los elementos de las estructuras mediante sus nombres, amenos de que ese acceso va a un nivel más profundo. Para comprender esto, piénsese en el siguiente símil: sea la estructura sobre la que actúan los operadores como una bodega que contiene cajas, que a su vez contienen distintos objetos. En general, el operador **[]**, podría considerarse como un dispositivo que mueve algunas de las cajas a otra, por así decirlo, sub-bodega o bodega más pequeña, y ese sería el resultado de la operación; es decir, entrega la sub-bodega con las cajas seleccionadas, mientras que los otros operadores entregan las cajas o incluso el contenido de éstas.

A manera de comparación, se dotará a la matriz mt, utilizada anteriormente, de nombres para sus columnas y renglones:

```{r}
rownames(mt) <- c("uno", "dos", "tres", "cuatro")
colnames(mt) <- c("UNO", "DOS", "TRES", "CUATRO", "CINCO")
print(mt)
sol:
       UNO DOS TRES CUATRO CINCO
uno     11  15   19     23    27
dos     12  16   20     24    28
tres    13  17   21     25    29
cuatro  14  18   22     26    30
```

Aquí, el acceso a renglones y columnas por nombres, mediante el operador [], da resultados semejantes tanto en matrices como en data frames:

```{r}
print(mt[, "TRES"])
sol:
   uno    dos   tres cuatro 
   19     20     21     22 
   
print(df.mt[, "TRES"])
sol:
[1] 19 20 21 22

print(mt["dos", ])
sol:
UNO    DOS   TRES  CUATRO  CINCO 
12     16     20     24     28 

print(df.mt["dos", ])
sol:
     UNO DOS TRES CUATRO CINCO
dos  12  16   20     24    28

# Para comparación con el operador [[]]:
print(mt["dos", "TRES", drop = F])
sol:
    TRES
dos  20

print(class(mt["dos", "TRES", drop = F]))  # La clase del objeto
sol:
[1] "matrix" "array" 

print(df.mt["dos", "TRES", drop = F])  # F es lo mismo que FALSE
sol:
    TRES
dos   20

print(class(df.mt["dos", "TRES", drop = F]))  # La clase del objeto
sol:
[1] "data.frame"
```

Como se ha dicho anteriormente, un data frame es una lista muy particular, cuyos componentes son las columnas del data frame, mismas que siempre tienen la misma longitud, y que en el caso del ejemplo, df.mt, es exactamente 4. De este modo, lo que se diga aquí para los data frames, con referencia a los operadores estudiados, en general es también válido para las listas. El operador **[[]]**, permite el acceso a esos componentes, ya sea mediante índices numéricos o los nombres provistos a los elementos de las estructuras. Así, para los dos últimos casos mostrados anteriormente:

```{r}
print(mt[[2, 3]])
sol:
[1] 20

print(mt[["dos", "TRES"]])
sol:
[1] 20

print(class(mt[["dos", "TRES"]]))
sol:
[1] "integer"

print(df.mt[[2, 3]])
sol:
[1] 20

print(class(df.mt[[2, 3]]))
sol:
[1] "integer"

print(df.mt[["dos", "TRES"]])
sol:
[1] 20
```

Nótese que a diferencia con el operador **[]**, el operador **[[]]**, no entrega en ni una matriz, ni un data frame, sino un vector entero de un solo elemento, en este caso. Compárese con los dos últimos casos del ejemplo anterior. Otra diferencia importante de este operador es que no admite ni rangos, ni conjuntos de índices; esto es, para cada espacio en el operador sólo admite ya sea un índice entero o una cadena de caracteres que identifica el nombre de algún elemento de la estructura sobre la que opera.

El operador **$**, es semejante pero sólo actúa sobre la estructura unidimensional de una lista o de un data frame. La diferencia de este operador con el operador **[[]]**, es que los nombres de los elementos no necesitan ir entre comillas, y pueden estar incompletos, cuando no hay ambigüedad en la identificación de los elementos a los cuales se refieren. Esta característica resulta más útil cuando se trabaja con el lenguaje directamente desde la consola, o sea, interactivamente, ya que puede representar alguna economía en la escritura de las expresiones.

```{r}
print(df.mt[["TRES"]])
sol:
[1] 19 20 21 22

print(df.mt$TRES)
sol:
[1] 19 20 21 22

print(df.mt$"TRES")
sol:
[1] 19 20 21 22

print(df.mt$T)
sol:
[1] 19 20 21 22
```

Nótese que en el código anterior, el intérprete del lenguaje se ha quejado emitiendo un “Warning”, que no representa ningún problema, ya que sólo informa que se ha hecho una identificación con un nombre incompleto.

El operador **[[]]**, también admite nombres incompletos, pero ese comportamiento tiene que ser señalado explícitamente por medio de la opción exact= FALSE, en el operador:

```{r}
print(df.mt[["TR", exact = F]])  # Recuerde F es FALSE
sol:
[1] 19 20 21 22
```

La riqueza en el uso de estos operadores se irá descubriendo a medida que se incorporen otras características del lenguaje que se estudiarán en los capítulos siguientes.
