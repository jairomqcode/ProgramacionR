################################################################################
# Capítulo 2: Los datos y sus tipos.
#
# Todas las cosas que manipula R se llaman "objetos". Los objetos m??s simples son 
# de cinco clases a las que se denominan "atómicas" y que son las siguientes:
# 1. character (cadenas de caracteres).
# 2. numeric (números reales).
# 3. integer (números enteros).
# 4. complex (números complejos).
# 5. logical (lógicos o booleanos, que s??lo toman los valores True o False).
#
# Un "vector" puede contener cero o m??s objetos, pero todos de la misma clase.
################################################################################


################################################################################
# 2.1. Los datos numéricos.
#
# El lenguaje agrupa estos datos en tres categorías:
# 1. numeric.
# 2. integer.
# 3. complex.
# 
# 1. numeric:
x <- 2            # Se asigna el valor 2 a x.
print(x)          # Se imprime el valor de x.
print(class(x))   # Muestra cual es la clase de x.
#
y <- 6/2
print(y)
print(class(y))
#
# 2. integer:
# Para asignar explícitamente un entero, integer, a una variable, se agrega la
# letra L al final del número, como sigue:
z <- 7L; print(z); print(class(z))
#
# Para lograr que una expresión, como la operación 6/2, arroje como resultado un
# entero, se tiene que hacer una conversión mediante la función as.integer:
i <- as.integer(8/4); print(i); print(class(i))
#
# 3. complex:
# Los números complejos, complex en el lenguaje, tienen una sintaxis muy parti-
# cular misma que se tiene que emplear para indicar explicitamente que un número
# introducido corresponde a ese tipo:
c1 <- 21 + 2i
c2 <- 2i + 21
c3 <- -1 + 0i
tt <- sqrt(c3)        # La función "sqrt()" es la raíz cuadrada. 
print(c1); print(c2); print(c3); print(tt); print(class(tt))
#
# "Inf" representa el infinito.
j <- 1/0; print(j)
m <- 1/Inf; print(m)
#
# Finalmente, algunas operaciones pueden resultar en algo que no es un número,
# esto se representa por el valor "NaN.
l <- 0/0; print(l)
################################################################################