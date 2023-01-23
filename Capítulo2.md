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



