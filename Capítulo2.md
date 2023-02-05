# 2. Los datos y sus tipos.

Todas las cosas que manipula R se llaman objetos. En general, éstos se construyen a partir de objetos más simples. De esta manera, se llega a los objetos más simples que son de cinco clases a las que se denomina atómicas y que son las siguientes:

* character (cadenas de caracteres).
* numeric (números reales).
* integer (números enteros).
* complex (números complejos).
* logical (lógicos o booleanos, que sólo toman los valores True o False).

En el lenguaje, sin embargo, cada uno de estas clases de datos no se encuentran ni se manejan de manera aislada, sino encapsulados dentro de la clase de objeto más básica del lenguaje: el vector. Un vector puede contener cero o más objetos, pero todos de la misma clase. En contraste, la clase denominada list, permite componer objetos también como una secuencia de otros objetos, pero, a diferencia del vector, cada uno de sus componentes puede ser de una clase distinta.


## 2.1. Los datos numéricos.

Probablemente el principal uso de R es la manipulación de datos numéricos. El lenguaje agrupa estos datos en **tres categorías**, a saber: **numeric**, **integer** y **complex**, pero cuando se introduce algo que puede interpretar como un número, su inclinación es tratarlo como un dato de tipo numeric, es decir, un número de tipo real, a no ser que explícitamente se indique otra cosa.

```{r}
x <- 2    # Se asigna el valor 2 a x.
print(x)  # Se imprime el valor de x.
sol:
[1] 2

print(class(x)) # Muestra cual es la clase de x.
sol:
[1] "numeric"

y <- 6/2        # Se asigna el valor de la operación dividir 6/2 a x
print(y)
sol:
[1] 3

print(class(y))
sol:
[1] "numeric"
```

Aparentemente las dos asignaciones que se hacen, mediante el operador de asignación <-, a la variable x, es de los enteros 2 y 3 respectivamente. Sin embargo, al preguntar, mediante la función class(), cuál es la clase de x, la respuesta es numeric, esto es, un número real. Para asignar explícitamente un entero, integer, a una variable, se agrega la letra L al final del número, como sigue:

```{r}
x <- 23L; print(x)
sol:
[1] 23

print(class(x))
sol:
[1] "integer"
```

Aquí la variable x tendrá como valor el entero 23. Como una nota adicional del lenguaje, nótese que se han escrito dos expresiones de R en un mismo renglón. En este caso, las expresiones se separan mediante ’;’. Para lograr que una expresión, como la operación de división 6/2, arroje como resultado un entero, se tiene que hacer una conversión; ello se logra mediante la función as.integer, como sigue:

```{r}
x <- as.integer(6/2); print(x)
sol:
[1] 3

print(class(x))
sol:
[1] "integer"
```

Por su parte, los números complejos, complex en el lenguaje, tienen una sintaxis muy particular; misma que se tiene que emplear para indicar explícitamente que un número introducido corresponde a ese tipo:

```{r}
x <- 21 + 2i
y <- 2i + 21    # El mismo valor que x
z <- -1 + 0i    # Corresponde a -1
tt <- sqrt(z)   # raíz cuadrada de -1
print(x); print(y); print(z); print(tt)

sol:
[1] 21+2i
[1] 21+2i
[1] -1+0i
[1] 0+1i

print(class(tt))
sol:
[1] "complex"
```

En los ejemplos anteriores a la variable tt se le asigna el resultado de una función, sqrt(), que es la raíz cuadrada de el número -1. Nótese que ésta es la forma correcta de calcular esa raíz, por ejemplo, sqrt(-1), hubiera arrojado como resultado un error. También, existe un valor numérico especial, Inf, que representa el infinito y que puede resultar en algunas expresiones, por ejemplo:

```{r}
x <- 1/0    # División por cero
print(x)
sol:
[1] Inf
```

Tambien dividir un número por Inf da cero:

```{r}
y <- 1/Inf
print(y)
sol:
[1] 0
```

Finalmente, algunas operaciones pueden resultar en algo que no es un número, esto se representa por el valor NaN. Veamos un ejemplo:

```{r}
x <- 0/0
x
sol:
[1] NaN
```

## 2.2. Vectores.

Se ha dicho con anterioridad que las clases atómicas de datos no se manejan de manera individual. En efecto, en todos los ejemplos anteriores, el lenguaje ha creado implícitamente vectores de longitud 1, y son esos los que se han asignado a las variables. Tomemos el caso más sencillo:

```{r}
x <- 2
print(x)
sol:
[1] 2
```

Aquí, la impresión del valor de x tiene una forma muy particular: “[1] 2”. El ’[1]’ que precede al valor, indica que se trata del primer elemento y único, en este caso, del vector que se muestra.

## 2.2.1. El uso de la **función c()** para crear vectores.

La primera manera de crear vectores es a partir de los elementos individuales que compondrán el vector. Para esto se utiliza la **función c()** como se muestra a continuación.

```{r}
x <- c(4,2,-8)
print(x)
sol:
[1] 4 2 -8
```

Distintas formas de asignar un vector a una variable:

```{r}
u <- c(4,2,-8)    # Usando el operador <-
c(4, 2, -8) -> v  # Usando el operador ->
assign("w", c(4, 2, -8))  # Usando la función assign
p = c(4, 2, -8)   # Usando el operador =

print(u); print(v); print(w); print(p)

sol:
[1] 4 2 -8
[1] 4 2 -8
[1] 4 2 -8
[1] 4 2 -8
```

La función c() sirve para concatenar varios elementos del mismo tipo. En todos los ejemplos mostrados, la impresión del vector se hace en un renglón que comienza con el símbolo ’[1]’, indicando con ello que el primer elemento del renglón corresponde al primer elemento del vector.

Un caso muy particular de asignación, es el de la función assign(). A diferencia de los otros casos vistos en el ejemplo anterior, el nombre de la variable aparece entre comillas.


## 2.2.2. Creación de vectores a partir de archivos de texto - la función scan().

Sea, por ejemplo, el caso del archivo UnVec.txt, que se contiene la siguiente información:

```{r}
12 15.5 3.1
-2.2 0 0.0007
```

Supóngase ahora que a partir de esos datos se quiere crear un vector. Para eso se usa la función scan(), como se muestra a continuación:

```{r}
vec <- scan("UnVec.txt")
print(vec)
sol:
[1] 12.0000 15.5000 3.1000 -2.2000 0.0000 0.0007
```

## 2.2.3. Creación de vectores a partir de secuencias y otros patrones.

Un vector, inicializado en ceros, o FALSE, y de longitud determinada, se puede crear con la función vector(). Es esta misma función la que permite crear vectores sin elementos. En seguida se muestran algunos ejemplos:

```{r}
v <- vector("integer", 0)
print(v) # Un vector de enteros sin elementos
sol:
integer(0)
```

```{r}
w <- vector("numeric", 3)
print(w) # Un vector de tres ceros
sol:
[1] 0 0 0
```

```{r}
u <- vector("logical", 5)
print(u) # Un vector de 5 FALSE
sol:
[1] FALSE FALSE FALSE FALSE FALSE
```

El operador ’:’ permite generar un vector entero a partir de una secuencia creciente o decreciente de enteros, cuyos extremos se indican, tal como se muestra en seguida:

```{r}
s <- 1:3
print(s)
sol:
[1] 1 2 3
```

```{r}
v <- 40:13
print(v); class(v) # El vector y su clase
sol:
[1] 40 39 38 37 36 35 34 33 32 31 30 29 28 27 26 25 24 23
[19] 22 21 20 19 18 17 16 15 14 13
[1] "integer"
```

Nótese que el desplegado o impresión del vector v, se ha tenido que hacer en dos renglones. Cada uno de esos renglones comienza, indicando entre corchetes [ ], el índice del primer elemento en el renglón. El alcance del operador ’:’ no se limita, sin embargo, sólo a números enteros. Veamos el siguiente, ejemplo:

```{r}
v <- pi:6
print(v); print(class(v))   # El vector y su clase
sol:
[1] 3.141593 4.141593 5.141593
[1] "numeric"
```

En este ejemplo, pi simboliza el valor de la constante matemática π ≈ 3.1416, y la secuencia de números reales que se produce es con incrementos de 1 a ese valor hasta mientras que no se rebase el límite superior, 6, en este caso. Por otra parte, este operador es un caso particular de la función seq() que permite generar una mayor variedad de secuencias numéricas. Veamos aquí algunos ejemplos:

```{r}
v <- seq(from = 5, to = 15, by = 2)
print(v); print(class(v))   # secuencia desde 5 hasta 15 de 2 en 2
sol:
[1]  5  7  9 11 13 15
[1] "numeric"
```

Debe notarse aquí, no obstante, que la clase del resultado de esta secuencia es numeric y no integer; esto es, el vector resultante es de números reales, que puede, a conveniencia, ser convertido a enteros, mediante la función as.integer().

La función seq() tiene varios argumentos más cuya documentación se puede consultar mediante ?seq o help(’seq’) en el intérprete de R. En seguida se muestra sólo otra forma bastante común de utilizar esta función, que tiene que ver con la producción de un vector o una secuencia de una longitud determinada.

```{r}
v <- seq(from = 4, by = 2, length.out = 8)
print(v)        # secuencia de 8 números iniciando desde 4 y de 2 en 2
sol:
[1]  4  6  8 10 12 14 16 18
```

Algunas veces es necesario repetir una secuencia de números varias veces para generar un vector deseado. La función rep() sirve para ese propósito.

```{r}
v <- c(4, 8, -3)
w <- rep(v, times = 5)
print(w)
sol:
[1]  4  8 -3  4  8 -3  4  8 -3  4  8 -3  4  8 -3
```

Finalmente, aveces se requiere construir un vector a partir de dos o más vectores ya existentes. La forma simple de lograr esto es con la función c() como se muestra a continuación:

```{r}
u <- c(3, 4, 5)
v <- c(5, 4, 3)
w <- c(u, v)
print(w)            # La concatenación de u y v
sol:
[1] 3 4 5 5 4 3
```

## 2.2.4. Acceso a los elementos individuales de un vector.

```{r}
v <- c(8, 7, -3, 2, 182)
print(v[5])         # El quinto elemento
sol:
[1] 182

print(v[1]); print(v[3])    # El primero y el tercer elemento.
sol:
[1] 8
[1] -3

print(v[4]+v[2])     # La suma del cuarto y segundo elementos de v.
sol:
[1] 9
```

El acceso a los elementos individuales de un vector no solamente es para consulta o lectura, sino también para su modificación o escritura. Por ejemplo:

```{r}
v[1] <- v[2] - v[5]
print(v)    # El resultado de la operación se ha guardado en v[1]
sol:
[1] -175 7 -3 2 182
```

Esta misma operación puede hacer crecer un vector. Por ejemplo, el vector v tiene 5 elementos. Si se asigna un valor al elemento 8, el vector crecerá hasta esa longitud, de la manera siguiente:

```{r}
v[8] <- 213
print(v)    # v tiene ahora 8 elementos con espacios vacios: NA
sol:
[1] -175 7 -3 2 182 NA NA 213
```

La nota aquí es que para aumentar el vector a esa longitud se tuvieron que introducir elementos ausentes o vacíos que se indican con el valor NA (del inglés: Not Available) en los espacios correspondientes.


Otra característica interesante de este lenguaje, es que permite dar nombre y acceder por medio de ese nombre a los elementos individuales de un vector. Supóngase por ejemplo que se tiene el registro de cantidades de ciertas frutas en un vector:

```{r}
frutas <- c(15, 100, 2, 30)
print(frutas)
sol:
[1]  15 100   2  30
```

Asociamos esos valores con el nombre de la fruta correspondiente:

```{r}
names(frutas) <- c("naranja", "pera", "manzana", "durazno")
print(frutas)
sol:
naranja    pera manzana durazno 
     15     100       2      30 
```

Otra manera más directa de nombrar los elementos de un vector, es en el momento mismo de la creación con la función c(), con una sintaxis semejante a la siguiente:

```{r}
frutas <- c(naranja = 15, pera = 100, manzana = 2, durazno = 30)
print(frutas)
sol:
naranja    pera manzana durazno 
     15     100       2      30 
```

Además se puede acceder a los elementos individuales del vector mediante su nombre:

```{r}
print(frutas["durazno"])
sol:
durazno 
     30 
```

```{r}
frutas["manzana"] <- 8
print(frutas)
sol:
naranja    pera manzana durazno 
     15     100       8      30 
```

El acceso a través de índices se sigue permitiendo:

```{r}
print(frutas[2])
sol:
pera 
 100
```

## 2.2.5. Operaciones sencillas con vectores.

Las operaciones aritméticas más comunes están definidas para vectores: la suma, la resta, la división y la exponenciación, todas ellas se definen elemento a elemento entre dos vectores. Por ejemplo:

```{r}
v <- 2 + 3     # Resulta en un vector de longitud 1.
print(v)
sol:
[1] 5
```

```{r}
v <- c(2, 3) - c(5, 1)   # # Resulta en un vector de longitud 2.
print(v)
sol:
[1] -3 2
```

```{r}
v <- c(2, 3, 4) * c(2, 1, 3)
print(v)
sol:
[1] 4 3 12
```

```{r}
v <- c(2, 3, 4)^(3:1)    # Eleva a potencias 3,2,1
print(v)
sol:
[1] 8 9 4
```

En todos los casos, la operación indicada se aplica elemento a elemento entre los dos vectores operandos. En el último ejemplo, debido al orden de precedencia de aplicación de los operadores, es necesario encerrar entre paréntesis la expresión 3:1.

En muchas ocasiones es necesario saber la longitud de un vector. La función **length()** aplicada a un vector regresa precisamente ese valor:

```{r}
u <- 2:33
v <- c(4, 5, 6)
w <- c(u, v)
print(w)
sol:
[1] 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
[19] 20 21 22 23 24 25 26 27 28 29 30 31 32 33 4 5 6
print(length(w))
[1] 35
```

Aprovecharemos el vector w, creado en el ejemplo anterior, para ilustrar también el uso de las operaciones lógicas. ¿Qué pasa si probamos este vector para saber cuáles de sus elementos son menores o iguales a 10?

```{r}
print(w <= 10)   # Prueba elementos menores o iguales a 10.
sol:
[1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[21] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
```

El resultado es un vector de lógicos, de la misma longitud que el original y paralelo a ese, en el que se indica, elemento a elemento cuál es el resultado de la prueba lógica: “menor o igual que diez”, en este caso. Otros operadores lógicos son: <, >, >=, ==, y !=.

En el asunto de las operaciones aritméticas que se han ilustrado anteriormente, surge una pregunta: ¿qué pasa cuando los vectores operandos no son de la misma longitud? En esos casos, el intérprete del lenguaje procede a completar la operación reciclando los elementos del operador de menor longitud. Así, por ejemplo:

```{r}
v <- c(4, 5, 6, 7, 8, 9, 10) * c(1, 2)
print(v)
sol:
Warning message:
In c(4, 5, 6, 7, 8, 9, 10) * c(1, 2) :
  longitud de objeto mayor no es múltiplo de la longitud de uno menor
```

```{r}
v <- c(4, 5, 6, 7, 8, 9, 10) * c(1, 2, 1, 2, 1, 2, 1)
print(v)
sol:
[1]  4 10  6 14  8 18 10
```

Notemos, sin embargo, que en el primer caso el sistema ha arrojado un mensaje de advertencia, Warning, indicando la diferencia en las longitudes de los operandos. La eliminación de estos mensajes se hace por medio de la función options(), como sigue:

```{r}
options(warn = -1)
v <- c(4, 5, 6, 7, 8,9, 10) * c(1, 2)
print(v)
sol:
[1]  4 10  6 14  8 18 10
```

Es esta funcionalidad la que permite hacer de manera muy simple algunas operaciones vectoriales, como por ejemplo:

```{r}
v <- c(2, -3, 4)
w <- 2 * (v^2)      # Dos veces el cuadrado de v
print(w)
sol:
[1] 8 18 32
```

Además, algunas funciones pueden recibir como argumento un vector y producir a su salida un vector de la misma longitud que el de entrada. Tal es el caso de las funciones trigonométricas como sin(), cos(), y la raíz cuadrada: sqrt(). Por ejemplo:

```{r}
# Se desea la raíz cuadrada de los siguientes valores:
v <- c(9, 8, 31)
print(sqrt(v))
sol:
[1] 3.000000 2.828427 5.567764
```

```{r}
# El sin de 30, 45 y 60 grados: Primero se hace la conversión a radianes:
angulos <- c(30, 45, 60) * (pi/180)
print(angulos)      # En radianes
sol:
[1] 0.5235988 0.7853982 1.0471976

senos <- sin(angulos)
print(senos)
sol:
[1] 0.5000000 0.7071068 0.8660254
```

# 2.3. Matrices.

Desde el punto de vista del lenguaje, una matriz es un vector con un atributo adicional: dim. Para el caso de las matrices, este atributo es un vector entero de dos elementos, a saber: el número de renglones y el número de columnas que componen a la matriz.

## 2.3.1. Construcción de Matrices.

Una de las formas de construir una matriz es a partir de un vector, como sigue:

```{r}
m <- 11:30
print(m)
sol:
[1] 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
```

Para convertirla en matriz simplemente se especifica el atributo dim.

```{r}
m <- 11:30
dim(m) <- c(4, 5)   # 4 renglones y 5 columnas
print(m)
print(class(m))
sol:
     [,1] [,2] [,3] [,4] [,5]
[1,]   11   15   19   23   27
[2,]   12   16   20   24   28
[3,]   13   17   21   25   29
[4,]   14   18   22   26   30

[1] "matrix" "array" 
```

Debe notarse que, mediante la construcción mostrada, el armado de la matriz se hace por columnas. Por otra parte, las dimensiones de la matriz pueden cambiarse en cualquier momento, y el acceso a un elemento particular de la matriz se hace ahora mediante dos índices: el renglón y la columna, aunque, el acceso a los elementos de la matriz como un vector, es decir, con un solo índice, sigue siendo posible, como se muestra en seguida:

```{r}
dim(m) <- c(5, 4) # Ahora 5 renglones y 4 columnas
print(m)
sol:
    [,1] [,2] [,3] [,4]
[1,]   11   16   21   26
[2,]   12   17   22   27
[3,]   13   18   23   28
[4,]   14   19   24   29
[5,]   15   20   25   30
```

Y el elemento en el renglon 3 y columna 2 es:

```{r}
print(m[3, 2])
sol:
[1] 18

print(m[8])    # acceso al mismo elemento, como vector, con un solo índice.
sol:
[1] 18
```

Una ventaja del lenguaje es que permite hacer referencia a una columna o a un renglón de la matriz, como si se tratara de un sólo objeto, o sea como un vector. Para ello, se omite alguno de los dos índices en la expresión de acceso a la matriz, como se muestra más adelante. En el ejemplo que se viene examinando, esos vectores estarían compuestos por números enteros, aunque los componentes de una matriz pueden ser también reales (numeric) o complejos (complex).


```{r}
# El renglón 3 de la matriz:
m[3, ]
sol:
[1] 13 18 23 28

# La columna 2 de la matriz:
m[, 2]
sol:
[1] 16 17 18 19 20

# La clase las columnas o renglones:
print(class(m[3, ]))
sol:
[1] "integer"
```

Las matrices también se pueden crear de manera flexible por medio de la función primitiva matrix(), que permite alterar la secuencia por default de armado de la matriz; esto es, ahora, si se quiere, se puede armar la matriz por renglones en vez de columnas:

```{r}
print((m <- matrix(11:30, nrow = 5, ncol = 4, byrow = TRUE)))
sol:
     [,1] [,2] [,3] [,4]
[1,]   11   12   13   14
[2,]   15   16   17   18
[3,]   19   20   21   22
[4,]   23   24   25   26
[5,]   27   28   29   30
```

Adicionalmente, a los renglones y las columnas de una matriz se les pueden asignar nombres, que pueden ser después consultados o usados como índices:

```{r}
m <- matrix(11:30, nrow = 5, ncol = 4, byrow = TRUE)
rownames(m) <- c("uno", "dos", "tres", "cuatro", "cinco")
colnames(m) <- c("UNO", "DOS", "TRES", "CUATRO")
print(m)
sol:
       UNO DOS TRES CUATRO
uno     11  12   13     14
dos     15  16   17     18
tres    19  20   21     22
cuatro  23  24   25     26
cinco   27  28   29     30

# Consulta de los nombres de las columnas:
print(colnames(m))
sol:
[1] "UNO"    "DOS"    "TRES"   "CUATRO"

# Una columna:
print(m[, "DOS"])
sol:
uno    dos   tres cuatro  cinco 
 12     16     20     24     28 
```

Las funciones rbind() y cbind(), son otras que se pueden utilizar para construir matrices, dando, ya sea los renglones individuales o las columnas individuales, respectivamente.

```{r}
m1 <- rbind(c(1.5, 3.2, -5.5), c(0, -1.1, 60))
print(m1)
sol:
     [,1] [,2] [,3]
[1,]  1.5  3.2 -5.5
[2,]  0.0 -1.1 60.0

print(class(m1[1, ]))    # ahora compuesta de números reales
sol:
[1] "numeric"

m2 <- cbind(c(1.5, 3.2, -5.5), c(0, -1.1, 60))
print(m2)
sol:
     [,1] [,2]
[1,]  1.5  0.0
[2,]  3.2 -1.1
[3,] -5.5 60.0
```

## 2.3.2. Acceso a los elementos individuales de una matriz.

Como en los casos anteriores, el lenguaje también provee de mecanismos para acceder a los elementos individuales de una matriz. Para ello se emplea el operador []. Supongamos que en la matriz m, del ejemplo anterior se quiere tener acceso al elemento que se encuentra en el renglón 2 y en la columna 1 de la matriz. Eso se logra de la siguiente manera:

```{r}
print(m2[2, 1])
sol:
[1] 15

Y también se pueden utilizar los nombres de renglón y columna, si es que la matriz los tiene:

```{r}
print(m["dos", "UNO"])
sol:
[1] 15
```

## 2.3.3. Operaciones sencillas con matrices.

Todas las operaciones aritméticas válidas para vectores, son validas para las matrices, siempre y cuando, las matrices operando tengan las mismas dimensiones y se aplican elemento a elemento, esto es, la operación se aplica entre cada columna, con su correspondiente, como si fueran vectores. (véase la sección correspondiente: 2.2.5). En seguida, se muestra un ejemplo con la multiplicación, que no debe ser confundido con la multiplicación matricial.

```{r}
m <- matrix(1:15, nrow = 5, ncol = 3)
print(m)
sol:
     [,1] [,2] [,3]
[1,]    1    6   11
[2,]    2    7   12
[3,]    3    8   13
[4,]    4    9   14
[5,]    5   10   15

mm <- rbind(1:3, 3:1, c(1, 1, 1), c(2, 2, 2), c(3, 3, 3)))
print(mm)
sol:
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    3    2    1
[3,]    1    1    1
[4,]    2    2    2
[5,]    3    3    3

print(m * mm)
sol:
     [,1] [,2] [,3]
[1,]    1   12   33
[2,]    6   14   12
[3,]    3    8   13
[4,]    8   18   28
[5,]   15   30   45
```

La multiplicación matricial se hace con el operador %*% . Para entender esta operación, pondremos un ejemplo con dos matrices, como sigue:

```{r}
A <- matrix(1:6, 3, 2)
print(A)
sol:
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

B <- rbind(7:9, 10:12)
print(B)
sol:
     [,1] [,2] [,3]
[1,]    7    8    9
[2,]   10   11   12
```

En el ejemplo, la matriz A será multiplicada por la matriz B, y debe notarse que, en este caso, el número de columnas de la matriz A, es igual al número de renglones de la matriz B. Los elementos de la matriz producto, estarán en las intersecciones de un renglón de la matriz A con una columna de la matriz B, y se calculan: el primer elemento del renglón de A por el primer elemento de la columna de B más el segundo elemento del renglón de A por el segundo elemento de la columna de B, etc. Este procedimiento es igual, para dimensiones mayores, siempre y cuando coincida el número de columnas de A con el número de renglones de B. En R, esta operación se hace así:

```{r}
print(A %*% B)
sol:
     [,1] [,2] [,3]
[1,]   47   52   57
[2,]   64   71   78
[3,]   81   90   99
```

Otra operación muy utilizada e implementada en R como una función, t(), es la traspuesta de una matriz. Esta es una operación en la que los renglones se cambian a columnas y viceversa, tal como se muestra en el siguiente ejemplo:

```{r}
# Se usa la misma matriz A del ejemplo anterior:
A <- matrix(1:6, 3, 2)
print(A)
sol:
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

# La traspuestas de A es:
print(t(A))
sol:
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
```

Otras operaciones sencillas se introducirán más adelante.

# 2.4. Factores y vectores de caracteres.

Los caracteres, o más apropiadamente, las cadenas de caracteres, se utilizan para nombrar cosas u objetos del mundo. Igual que en el caso de los números, en R la clase **character** no se refiere a una cadena de caracteres aislada sino a un vector que contiene cero o más cadenas de caracteres. De este modo podríamos tener por ejemplo, una lista (o vector) con los nombres de personas, y otra, paralela a la primera, con sus meses de nacimiento:

```{r}
persona <- c("Hugo", "Paco", "Luis", "Petra", "Maria", "Fulano", "Sutano", "Perengano", "Metano", "Etano", "Propano")
print(persona)
sol:
 [1] "Hugo"      "Paco"      "Luis"      "Petra"     "Maria"     "Fulano"    "Sutano"
 [8] "Perengano" "Metano"    "Etano"     "Propano" 

mes.nacimiento <- c("Dic", "Feb", "Oct", "Mar", "Feb", "Nov", "Abr", "Dic", "Feb", "Oct", "Dic")
print(mes.nacimiento)
sol:
 [1] "Dic" "Feb" "Oct" "Mar" "Feb" "Nov" "Abr" "Dic" "Feb" "Oct" "Dic"
 ```
 
Así, si se quiere imprimir el nombre de la persona 7 con su mes de nacimiento se puede hacer con:

```{r}
print(persona[7]); print(mes.nacimiento[7])
sol:
[1] "Sutano"
[1] "Abr"

# De una manera más "pulcra":
print(c(persona[7], mes.nacimiento[7]))
sol:
[1] "Sutano" "Abr"
```

La función **paste()** permite concatenar cadenas de caracteres y por medio de ella se puede dar incluso una mejor apariencia a la salida:

```{r}
paste(persona[7], "nacio en el mes de", mes.nacimiento[7])
sol:
"Sutano nacio en el mes de Abr"
```

## 2.4.1. Los factores y su estructura.

Los dos vectores anteriores pueden considerarse como una estructura de información, a la que se puede someter a algún tipo de procesamiento estadístico. El lenguaje tiene muchas herramientas para ese propósito. Considérese, por ejemplo, el problema de determinar la frecuencia de aparición de ciertos meses en el vector **mes.nacimiento**. En este caso, el lenguaje provee de una clase que facilita este tipo de análisis, a saber: la clase factor. Para entender esta clase, procedamos primeramente a transformar el vector **mes.nacimiento** a un factor, mediante la función de conversión **as.factor()**, como sigue:

```{r}
Fmes.nacimiento <- as.factor(mes.nacimiento)
print(Fmes.nacimiento)
sol:
[1] Dic Feb Oct Mar Feb Nov Abr Dic Feb Oct Dic
Levels: Abr Dic Feb Mar Nov Oct

# y generamos la impresión ahora con el factor:
print(paste(persona[7], "nacio en el mes de", Fmes.nacimiento[7]))
sol:
[1] "Sutano nacio en el mes de Abr"
```

Si se compara la impresión del factor **Fmes.nacimiento** con la del vector **mes.nacimiento**, se podría pensar que “no ha pasado mucho”. De hecho, la impresión bonita con la función **paste()**, ha resultado igual. Sin embargo, el **factor** exhibe una estructura adicional denominada **Levels**, en la que se han registrado e identificado los elementos del vector sin repetición; esto es, los nombres únicos de los meses, en este caso. La estructura interna de esta clase se puede descubrir:

```{r}
print(unclass(Fmes.nacimiento))
sol:
[1] 2 3 6 4 3 5 1 2 3 6 2
attr(,"levels")
[1] "Abr" "Dic" "Feb" "Mar" "Nov" "Oct"
```

Como se puede ver, el núcleo de la clase son dos vectores. El primero, es un vector de índices enteros, que sustituye al vector de caracteres original, y el segundo es un vector de caracteres, que contiene los niveles (Levels) o categorías, a los que hace referencia el primer vector. Abordemos ahora el problema que motivó la presente discusión: la frecuencia de aparición de ciertos elementos en un vector. La función **table()** toma típicamente como argumento un factor y regresa como resultado justamente la frecuencia de aparición de los niveles en el vector de índices:

```{r}
print(table(Fmes.nacimiento))
sol:
Fmes.nacimiento
Abr Dic Feb Mar Nov Oct 
 1   3   3   1   1   2 
```

La interpretación de estos resultados en el contexto de la estructura de información original, es que, por ejemplo, 3 personas del vector persona, nacieron en el mes de Dic. En el ejemplo mostrado, los niveles o Levels aparecen ordenados alfabéticamente. La creación de factores en los que se establezca un orden determinado en los niveles, se puede hacer con la función factor(), como se muestra:

```{r}
meses <- c("Ene","Feb","Mar","Abr","May","Jun","Jul","Ago",

"Sep","Oct","Nov","Dic")

# Se incluyen meses que no están en el vector original:
FFmes.nacimiento <- factor(mes.nacimiento, levels=meses)
print(FFmes.nacimiento)
sol:
[1] Dic Feb Oct Mar Feb Nov Abr Dic Feb Oct Dic
Levels: Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic

# Ahora la tabla de frecuencias es:
print(table(FFmes.nacimiento))
sol:
FFmes.nacimiento
Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic 
  0   3   1   1   0   0   0   0   0   2   1   3 
```

Debe notarse que la función **table()** pudiera haber recibido como argumento directamente el vector de caracteres original, y hubiera producido el resultado deseado, como se muestra:

```{r}
print(table(mes.nacimiento))
sol:
mes.nacimiento
Abr Dic Feb Mar Nov Oct 
 1   3   3   1   1   2 
```

La razón es simple: el intérprete del lenguaje sabe que la función está esperando recibir un factor y en consecuencia trata de convertir, en automático, el argumento que recibe, a esa clase. Como la conversión de vectores de caracteres a factores es trivial, la función no tiene ningún problema en desarrollar su tarea.

## 2.4.2. Acceso a los elementos de un factor.

El acceso a cada uno de los dos vectores que le dan estructura al factor se hace como se muestra a continuación:

```{r}
# Un elemento individual del factor:
print(Fmes.nacimiento[10])
sol:
[1] Oct
Levels: Abr Dic Feb Mar Nov Oct

# Un elemento individual de los niveles:
print(levels(Fmes.nacimiento)[3])
sol:
[1] "Feb"
```

Incluso es posible modificar todos o algunos de los niveles del factor. Por ejemplo:

```{r}
levels(Fmes.nacimiento)[3] <- "febrero"
print(Fmes.nacimiento)
sol:
[1] Dic     febrero Oct     Mar     febrero Nov     Abr     Dic     febrero Oct    
[11] Dic    
Levels: Abr Dic febrero Mar Nov Oct
```

Si se quiere tener acceso al factor como un vector de índices, se convierte a entero:

```{r}
print(as.integer(Fmes.nacimiento))
sol:
[1] 2 3 6 4 3 5 1 2 3 6 2
```

# 2.5. Listas.

Una lista, de la clase **list**, es una clase de datos que puede contener cero o más elementos, cada uno de los cuales puede ser de una clase distinta.

Por ejemplo, se puede concebir una lista para representar una familia: la mamá,
el papá, los años de casados, los hijos, y las edades de los hijos, de la manera
siguiente:

```{r}
familia <- list("Maria", "Juan", 10, c("Hugo", "Petra"), c(8,6))
print(familia)
sol:
[[1]]
[1] "Maria"

[[2]]
[1] "Juan"

[[3]]
[1] 10

[[4]]
[1] "Hugo"  "Petra"

[[5]]
[1] 8 6
```

Nótese que la lista contiene cinco elementos; los tres primeros son a su vez de un sólo elemento: el nombre de la mamá, el nombre del papá, y los años de casados. Los siguientes dos, son dos vectores de dos elementos cada uno: los hijos y sus respectivas edades.

Al igual que en el caso de los vectores, como se vio en la sección 2.2.4, los elementos de las listas pueden ser nombrados, lo que añade mayor claridad a su significado dentro de la lista. La forma de hacer esto se muestra a continuación:

```{r}
familia <- list(madre="Maria", padre="Juan", casados=10, hijos=c("Hugo", "Petra"), edades=c(8, 6))
print(familia)
sol:
$madre
[1] "Maria"

$padre
[1] "Juan"

$casados
[1] 10

$hijos
[1] "Hugo"  "Petra"

$edades
[1] 8 6
```

## 2.5.1. Acceso a los elementos individuales de una lista.

Al igual que en el caso de los vectores, las listas no serían de mucha utilidad sin la posibilidad de tener acceso a sus elementos individuales. El lenguaje, provee de este acceso mediante tres operadores, a saber: [ ], [[ ]], y $. El primero de estos operadores se revisará a detalle en el capítulo 3. Aquí se explicarán los otros dos operadores en su forma de uso más simple.

Cuando los elementos de la lista tienen nombre, se puede acceder a ellos con cualquiera de los dos operadores. Usando los ejemplos anteriores, esto se puede hacer de la manera siguiente:

```{r}
familia <- list(madre="Maria", padre="Juan", casados=10, hijos=c("Hugo", "Petra"), edades=c(8, 6))
# Acceso de lectura
print(familia$madre)
sol:
[1] "Maria"

print(familia[["madre"]])
sol:
[1] "Maria"

# Acceso de escritura
familia[["padre"]] <- "Juan Pedro"
print(familia$padre) # para checar el nuevo valor
sol:
[1] "Juan Pedro"
```

Nótese que al emplear el operador $, no se han usado las comillas para mencionar el nombre del elemento, pero, este operador también admite nombres con comillas. Por otra parte, el operador [[ ]], sólo admite los nombres de elementos con comillas, o de cualquier expresión que al evaluarse dé como resultado una cadena de caracteres. En seguida se muestran algunos ejemplos:

```{r}
familia$"madre" <- "Maria Candelaria"
mm <- "madre"
print(familia[[mm]])
sol:
[1] "Maria Candelaria"

print(familia[[ paste("ma", "dre", sep="")]])
sol:
[1] "Maria Candelaria"
```

En el último caso, el operador ha recibido como argumento la función **paste()**, que, como se ha dicho anteriormentre, sirve para concatenar cadenas de caracteres. Esta función supone de inicio que las cadenas irán separadas por un espacio en blanco. Por ello es que, en el ejemplo se indica que el separador es vacío mediante **sep=""**. Alternativamente, para este último caso, se puede usar la función **paste0()**, que de entrada supone que tal separador es vacío.

## 2.6. Data frames.

Un **data frame** es una lista, cuyos componentes pueden ser vectores, matrices o factores, con la única salvedad de que las longitudes, o número de renglones, en el caso de matrices, deben coincidir en todos los componentes. La apariencia de un **data frame** es la de una tabla y una forma de crearlos es mediante la función **data.frame()**. Veamos un ejemplo:

```{r}
m <- cbind(ord=1:3, edad=c(30L, 26L, 9L))
print(m)
sol:
     ord edad
[1,]   1   30
[2,]   2   26
[3,]   3    9

v <- c(1.80, 1.72, 1.05)
print(v)
sol:
[1] 1.80 1.72 1.05

ff <- data.frame(familia=c("Padre", "Madre", "Hijo"), m, estatura=v)
print(ff)
sol:
  familia ord edad estatura
1   Padre   1   30     1.80
2   Madre   2   26     1.72
3    Hijo   3    9     1.05
```

Una gran ventaja de los data frames, es que R tiene diversas funciones para leer y guardar las tablas que representan, en archivos de texto, y otros formatos. Como un ejemplo, supongamos que se tiene un archivo, denominado “Rtext.txt”, la siguiente información:

```{r}
   Precio   Piso  Area  Cuartos Edad Calentador
01  52.00  111.0  830      5    6.2     no
02  54.75  128.0  710      5    7.5     no
03  57.50  101.0  1000     5    4.2     no
04 57.50   131.0  690      6    8.8     no
05 59.75    93.0  900      5    1.9     si
```

La lectura de esta tabla hacia un data frame, es muy sencilla y se hace mediante la función **read.table()**, como sigue:

```{r}
mi.tabla <- read.table("Rtext.txt")
print(mi.tabla)
sol:
   Precio Piso  Area Cuartos Edad Calentador
01 52.00   111  830     5     6.2     no
02 54.75   128  710     5     7.5     no
03 57.50   101  1000    5     4.2     no
04 57.50   131  690     6     8.8     no
05 59.75    93  900     5     1.9     si
```

Nótese que el primer renglón y la primera columna no son parte de los datos de la tabla; ellos son, respectivamente, los nombres de las columnas y renglones de la tabla o data frame, lo que podemos constatar mediante las funciones colnames() y rownames():

```{r}
colnames(mi.tabla)
sol:
[1] "Precio" "Piso" "Area" "Cuartos"
[5] "Edad" "Calentador"

rownames(mi.tabla)
sol:
[1] "01" "02" "03" "04" "05"
```

Como se mencionó anteriormente, un data frame es una lista muy particular, pero, ¿cuáles son los elementos de esa lista? Los elementos de la lista, y que obedecen a todas las reglas sintácticas dadas anteriormente (ver sección 2.5.1), son las columnas de la tabla. Así, por ejemplo, al segundo elemento de la lista podemos tener acceso de las siguientes formas:

```{r}
print(mi.tabla$Piso)
sol:
[1] 111 128 101 131 93

print(mi.tabla[[2]])
sol:
[1] 111 128 101 131 93

print(mi.tabla[2])
sol:
   Piso
01 111
02 128
03 101
04 131
05 93
```

En el último caso, los datos se despliegan junto con el nombre de la columna y cada uno de los nombres de los renglones. Ello se debe a que en realidad, el operador [] extrae una rebanada del dato o variable sobre la cuál opera, un data frame en este caso, y que podríamos denominarlo como un sub-data frame aquí; esto es, se trata otra vez de un data frame pero más chiquito que el original.

Para tener acceso a un elemento individual de un data frame, se utiliza el operador [], con la misma sintaxis que se utilizó para las matrices. Por ejemplo, el elemento en el renglón 3 y la columna 2, se puede revisar, o incluso cambiar con:

```{r}
print(mi.tabla[3, 2])
sol:
[1] 101

# modificamos el elemento con:
mi.tabla[3, 2] <- 106
print(mi.tabla)
sol:
   Precio Piso Area Cuartos Edad Calentador
01  52.00 111  830     5    6.2     no
02  54.75 128  710     5    7.5     no
03  57.50 106  1000    5    4.2     no
04  57.50 131  690     6    8.8     no
05  59.75 93   900     5    1.9     si
```

Otra característica importante de los data frames es que, salvo que se indique otra cosa, las columnas de tipo character se convierten automáticamente a tipo factor:

```{r}
print(mi.tabla$Calentador)
sol:
[1] no no no no si
Levels: no si

print(class(mi.tabla$Calentador))
sol:
[1] "factor"
```

La posibilidad de operar con rebanadas de los data frames, es una de las cosas que hacen más atractivas a esta estructura. Si, por ejemplo, se quiere añadir, una nueva columna o componente del data frame, y ésta calcularla como el resultado de multiplicar el Precio por el Área, se puede hacer de la siguiente manera:

```{r}
mi.tabla$Total <- mi.tabla$Precio * mi.tabla$Area
print(mi.tabla)
sol:
   Precio Piso Area Cuartos Edad Calentador Total
01 52.00   111 830     5     6.2    no      43160
02 54.75   128 710     5     7.5    no      38872
03 57.50   106 1000    5     4.2    no      57500
04 57.50   131 690     6     8.8    no      39675
05 59.75    93 900     5     1.9    si      53775
```

## 2.7. Funciones.

A diferencia de otros lenguajes de programación procedurales, como C, Java, y PHP, en R las funciones constituyen una clase. Por ejemplo, los objetos de esa clase pueden ser asignados a variables; podría darse el caso, incluso, de armar una lista cuyos elementos fueran funciones.

Aunque la escritura de funciones es parte de la programación que se verá más adelante, se indicará aquí la forma de crear funciones como una herramienta para agrupar varias operaciones. La sintaxis para la creación de una función es como sigue:

```{r}
variable <- function(arg_1, arg_2, ..., arg_n) expresion
```

Como se puede ver, se trata de una asignación de un valor: la función, a una variable. A partir de esa definición, la variable se puede utilizar como el nombre de la función. En R, toda expresión tiene un valor, así que el valor de la expresión será lo que la función regresará cuando se aplique. En seguida se muestra un ejemplo.

```{r}
hipotenusa <- function(x, y) {sqrt(x^2 + y^2)}
print(class(hipotenusa))
sol:
[1] "function"
```

En este caso, la función de biblioteca sqrt(), entrega la raíz cuadrada, y el operador ^, eleva un valor a la potencia indicada como segundo argumento. La función entrega como resultado el último valor calculado que encuentre, aunque esta entrega se pude hacer explícita mediante la instrucción return, con lo cual la función anterior podría alternativamente ser codificada como:

```{r}
hipotenusa <- function(x, y) {return(sqrt(x^2 + y^2))
print(hipotenusa(3, 4))
sol:
[1] 5
}

Los argumentos de la función tienen nombres, y esos se pueden usar en el llamado a la función, cambiando incluso el orden en que aparecen en la definición de la función.

```{r}
print(hipotenusa(y = 4, x = 3))
sol:
[1] 5
```

Otra característica es que las funciones, en su definición, pueden tener valores asignados por defecto o en ausencia cuando es llamada la función:

```{r}
# valores por ausencia
hipotenusa <- function(x=3, y=4){return(sqrt(x^2 + y^2))}
print(hipotenusa())
sol:
[1] 5
```

Las funciones toman sus datos de los argumentos dados o de las variables que “le están al alcance” a la función, así por ejemplo, la siguiente función:

```{r}
PI <- 3.1416
ff <- function(r) {return(PI * r^2)}
```

si se ejecuta esta función, por ejemplo, con ff(3), puede disparar un error, ya que no se ha definido el valor de PI. Pero si se ejecuta en la siguiente secuencia, se obtendrá un valor, aun cuando la función se haya definido con anterioridad:

```{r}
print(ff(3))
sol:
[1] 28.27
```

La noción de función que se ha presentado aquí es muy básica. En un capítulo posterior se presenta la creación de funciones enriquecida por las estructuras de control que se discutirán también más adelante.

## 2.8. Coerción.

Se han abordado en este capítulo, no de una manera exhaustiva, pero sí para tener una idea clara de su potencial, los principales tipos de datos del lenguaje R. Estos tipos de datos son el fundamento para la construcción de otras clases de datos más complejas. Algunos de los tipos de datos admiten su conversión a otros tipos; para ello, el lenguaje provee de un conjunto de funciones de la forma: **as.<tipo>()**. En seguida se muestran algunos ejemplos.

Distintas conversiones entre datos numéricos:    
 
```{r}
x <- 1.03
print(x)
Sol:
[1] 1.03
```
     
    
