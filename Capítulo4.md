# Estructuras de control y manejo de datos.

En los lenguajes de programación, se entiende por estructuras de control aquellas construcciones sintácticas del lenguaje que dirigen el flujo de la ejecución de un programa en una dirección o en otra dentro de su código. Por ejemplo, prácticamente todos los lenguajes tienen una construcción “IF”, que permite ejecutar o saltar un conjunto, bloque o secuencia de instrucciones dentro del código de un programa. R también cuenta con un conjunto de estructuras de control, si bien, mucho de lo que éstas implementan se puede también hacer mediante:

## 4.1. La construcciones IF-ELSE.

Estas construcciones son semejantes a las de otros lenguajes de programación, con una salvedad que puede ser capitalizada por los usuarios del lenguaje: la construcción en sí misma regresa un valor, que puede, si se quiere, ser asignado a una variable o utilizado de otras maneras. Los siguientes ejemplos muestran la sintaxis y el uso de estas construcciones.

```{r}
aa <- 15
# if sin else:
if (aa > 14)
  print("SI MAYOR")
sol:
[1] "SI MAYOR"

if (aa > 14) print ("SI MAYOR")
sol:
[1] "SI MAYOR"

if (aa > 14) { # Instrucción compuesta
  print ("PRIMER RENGLON")
  print ("SI MAYOR")
}
sol:
[1] "PRIMER RENGLON"
[1] "SI MAYOR"

# Usando el valor que regresa el if:
y <- 10
y <- if (aa > 14) 50
print(y)
sol:
[1] 50
```

La construcción **IF** admite una sola expresión, pero ésta puede ser la expresión compuesta, que se construye mediante los paréntesis de llave { }, y las expresiones en su interior, separadas ya sea por el cambio de renglón o por ’;’. En los casos anteriores, la expresión señalada por el **if** se ejecuta u omite dependiendo del valor de la condición, **TRUE** o **FALSE**, respectivamente. En el caso del ejemplo la condición esta dada por la expresión **aa > 14**, que prueba si la variable **aa** es mayor que 14. La siguientes construcciones, redirigen la ejecución del código a distintos bloques o conjuntos de instrucciones dependiendo de que se cumplan o no las condiciones establecidas:

```{r}
if (10 > aa) { # 1er. bloque
print("RANGO MENOR")
} else if ( 10 <= aa && aa <= 20) { # 2o. bloque
print("primer renglon"); print("RANGO MEDIO")
} else { # 3er. bloque
print("RANGO MAYOR")
}
sol: 
[1] "primer renglon"
[1] "RANGO MEDIO"
```

Nótese que el segundo bloque de expresiones en el ejemplo, es una expresión compuesta de dos expresiones; pero como ellas se han dado en un solo renglón se han separado mediante el carácter ;. La condición que da lugar a este mismo bloque de expresiones, introduce dos nuevos operadores: <= y &&; el primero de ellos es el operador de comparación menor o igual que y el segundo es el operador lógico and. Entonces la condición es equivalente a la expresión matemática: 10 ≤ aa ≤ 201. Finalmente, el tercer y último bloque de expresiones, se ejecuta en caso de que ninguna de las condiciones correspondientes a los otros dos bloques se haya satisfecho.

## 4.2. Los ciclos.

El lenguaje cuenta con varios tipos de ciclos o repeticiones, a saber: repeticiones por un número determinado de veces, repeticiones mientras se cumple una condición y repeticiones infinitas. En seguida se discutirá cada uno de estos casos.

### 4.2.1. Repeticiones por un número determinado de veces.

La construcción que habilita esta operación es la instrucción **for**. El número de veces que se repite la expresión o expresiones englobadas en la instrucción, puede estar explícita en ella misma, como se muestra a continuación:

```{r}
letras <- c("c", "l", "i", "M", "T", "A")

for (i in 1:6) {
  print(letras[i])
}

sol:
[1] "c"
[1] "l"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```

El número de veces que se repite la expresión, puede quedar implícito en las estructuras de las cuales toma elementos el **for**. Así, el mismo resultado que se obtuvo en el ejemplo anterior, se puede obtener con cualquiera de las siguientes dos construcciones:

```{r}
for (i in seq_along(letras)) {
  print(letras[i])
}

sol:
[1] "c"
[1] "l"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```

```{r}
for (letra in letras) {
  print(letra)
}

sol:
[1] "c"
[1] "l"
[1] "i"
[1] "M"
[1] "T"
[1] "A"
```

En el primer caso se llamó a la función **seq_along()**, que genera una secuencia de enteros de acuerdo con el número de elementos que tenga el objeto que se le de como argumento. El segundo caso, tipifica la esencia de la construcción **for**, ya que se trata de ir tomando uno a uno los elementos del objeto consignado después de la partícula **in** del **for**.

### 4.2.2. Repeticiones mientras se cumple una condición.

La construcción que habilita esta operación es la instrucción **while**, que se puede ejemplificar como sigue:

```{r}
# Para la misma tarea de los ejemplos anteriores:
i <- 1
while (i <= 6) {
  print(letras[i])
  i <- i + 1
}
```

La salida de este ejemplo es la misma que la de los ejemplos anteriores. En este caso, si no se tiene cuidado en el manejo del índice i, involucrado en la condición, se puede dar lugar a un ciclo sin salida.


### 4.2.3. Repeticiones infinitas.

La construcción que habilita esta operación es la instrucción **repeat**. Aunque en realidad no se quiere significar que las repeticiones sean infinitas o interminables, como la instrucción no tiene condición de salida o interrupción, el resultado que la instrucción produciría en sí misma sería una repetición interminable; pero, el lenguaje provee facilidades para que desde el interior del bloque de expresiones que se repiten, se obligue la interrupción del ciclo, por ejemplo, mediante la instrucción **break**, que se detalla más adelante. Así, para producir los mismos resultados que en los ejemplos anteriores, se puede hacer así:

```{r}
i <- 1
repeat {
  print(letras[i])
  i <- i + 1
  if (i > 6)
    break
}
```

En este caso, mediante un **if** que prueba una condición de salida, se dispara una instrucción **break** que interrumpe el ciclo.

### 4.2.4. Interrupciones del flujo normal de los ciclos.

El flujo normal de los ciclos se puede interrumpir básicamente por medio de tres instrucciones diferentes: **break**, **next** y **return**. En el último ejemplo de la sección anterior, 4.2.3, se ha utilizado la instrucción break para obligar la salida de un ciclo infinito que se realiza mediante la instrucción repeat. No es éste, sin embargo, el único ciclo que puede interrumpir la instrucción break, ya que ella se puede utilizar en el interior de cualquier ciclo para forzar su interrupción. Como un ejemplo, se presenta un ciclo en que simula lo que podría ser un procedimiento iterativo para encontrar el valor de una variable, cuyo valor converge hacia un cierto valor con cada nueva iteración. Para no caer en ciclos verdaderamente infinitos, este tipo de procedimientos limitan el número de iteraciones a un valor suficientemente grande, lo que aquí se hace mediante una instrucción for limitada a 1000 repeticiones:

```{r}
# se usará un generador de números aleatorios,
# la siguiente función asegura su repetibilidad:
set.seed(140) # el argumento puede ser cualquier número
aprox <- 0.003 # Valor determinante para la salida del ciclo

Y_ini <- 2.7 # Supuesto valor inicial de Y
for (iter in 1:1000) { # aseguro no más de 1000 iteraciones
  # Procedimiento para calcular la siguiente Y, que
  # en este caso simularemos mediante generador aleatorio:
  Y <- Y_ini + 0.008*rnorm(1)
  # La condición de salida:
  if (abs(Y - Y_ini) <= aprox)
    break # Uso del break para salir del ciclo
# Preparamos para la siguiente iteración
Y_ini <- Y
}
# Veamos que ha resultado:
paste0("Y_ini: ", Y_ini, ", Y: ", Y, ", Num.iter: ", iter)
sol:
[1] "Y_ini: 2.76443400590741, Y: 2.76582777768031, Num.iter: 8"
```

En este ejemplo, el objetivo se ha alcanzado en 8 iteraciones. Se ha utilizado la función **abs()**, que entrega el valor absoluto de su argumento, y se ha utilizado un generador de números aleatorios con distribución normal, implementado mediante la función **rnorm()**, que se inicializa mediante la función **set.seed()**.

Un caso parecido de salida o interrupción de un ciclo es la instrucción **return**. Esta instrucción está asociada con las funciones y su propósito es interrumpir u obligar la salida de la función en la cuál se invoca, entregando, opcionalmente, como resultado de la función un valor si se da como argumento del return. De esta manera, la interrupción de un ciclo es realmente colateral, pero igualmente efectiva, solamente que la salida de ciclo no es exactamente afuera de él, sino afuera de la ejecución de la función en la que se ha invocado. Como un ejemplo, se creará y ejecutará una función: la función generadora de los números de fibbonacci, que, tenidos o dados los dos primeros números de fibbonacci, F0 y F1 , definidos ambos como 1, calcula cada uno de los siguientes como la suma de los dos anteriores.

```{r}
# Primero se crea la función:
fibbonacci <- function(n) {
  if (n %in% c(0,1))
    return (1)
  
  F0 <- 1; F1 <- 1; i <- 2
  repeat {
    s <- F0 + F1 # Suma de los fib anteriores
    if (i == n) # Ya es el que se busca
      return (s) # Sale hasta afuera de la función
    
    # recorremos los últimos dos próximos números
    F0 <- F1
    F1 <- s
    i <- i+1 # incrementamos el índice
  }
}

# El octavo número de fibbonacci se genera
# llamando a la función así:
fibbonacci(8)

sol:
[1] 34
```

Esta función utiliza el operador %in%, que identifica si un cierto elemento está dentro de un conjunto representado por un vector. La instrucción **return**, es una función primitiva que termina la ejecución de una función y entrega como resultado de la función el argumento que se le pase. En el caso del ejemplo, se ha usado dos veces: la primera, simplemente detecta si el argumento es 0 o 1, en cuyo caso termina la función y entrega 1 como resultado; la segunda vez, que es la que nos interesa, se usa dentro de la instrucción **repeat** para determinar si ya se ha llegado al número fibbonacci correspondiente, en cuyo caso termina allí la función y entrega como resultado el número correspondiente.

La instrucción **next** interrumpe el flujo normal de ejecución de un programa de una manera diferente: en vez de salir de un ciclo, solamente impide la ejecución de las instrucciones siguientes y regresa al principio del ciclo para ejecutar la siguiente iteración. El siguiente ejemplo ilustra esta operación:

```{r}
for (i in 1:7) {
  if (3 <= i && i <= 5)
    next
  print(i)
}

sol:
[1] 1
[1] 2
[1] 6
[1] 7
```

Hasta aquí, se han visto diferentes estructuras de control que, al igual que otros lenguajes de programación, permiten definir el flujo de ejecución de las instrucciones de algún programa. A través de estas estructuras de control se pueden manipular los elementos de las clases de datos compuestas. La riqueza de este lenguaje, sin embargo, está en el manejo de cada una de las distintas estructuras de información, implementadas a través de las clases de datos estructuradas, como vectores, factores, data frames, etc., como un todo a través de funciones que las contemplan de esa manera.

### 4.3.2. Las funciones sapply() y lapply().

Para empezar, supóngase que se tiene un data frame, exclusivamente de columnas numéricas y se quiere conocer el promedio de cada una de estas columnas. En este caso, la función **sapply()** permite aplicar una operación o una función a cada uno de los elementos la lista o data frame, dado como argumento. Así, la operación deseada se obtiene de la siguiente manera.

```{r}
misDatos <- data.frame(uno = runif(5, 10.5, 40.3), dos = runif(5), tres = runif(5, 155, 890))
print(misDatos)

sol:
       uno        dos     tres
1 21.78863 0.45177921 815.1000
2 33.10142 0.61051394 779.5767
3 35.52898 0.05165212 471.9405
4 22.28395 0.42383408 186.0485
5 34.95414 0.22631810 886.8341
```

```{r}
misDatos <- data.frame(uno = runif(5, 10.5, 40.3), dos = runif(5), tres = runif(5, 155, 890))
print(misDatos)
print(sapply(misDatos, mean, simplify = TRUE))

sol:
        uno         dos        tres 
 20.4052679   0.4312838 555.9578316 
 ```
 
 El argumento opcional **simplify**, especificado aquí como **TRUE**, obliga a que el resultado, si se puede, sea entregado como un vector, con un elemento correspondiente a cada una de las columnas en este caso, de otra manera, el resultado es entregado como una lista. El resultado obtenido con la función **lapply** es más o menos similar, pero el resultado se entrega siempre en una lista:
 
 ```{r}
 print(lapply(misDatos, mean))
 
 sol:
$uno
[1] 18.99592

$dos
[1] 0.2526924

$tres
[1] 484.9233
```

### 4.3.3. Operaciones marginales en matrices y la función apply().
