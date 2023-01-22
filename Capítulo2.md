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

## Diversas maneras de crear vectores.

## El uso de la **función c()** para crear vectores.

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

