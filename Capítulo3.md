# 3. Acceso a porciones o subconjuntos de datos.

## 3.1. Los operadores de acceso o selección.

Los operadores de acceso a los datos estructurados: vectores, matrices, factores, listas y data frames, son:

* **[]** . (Ejemplo: mtx[2,3]) Este operador siempre regresa un objeto de la misma clase que el original1 y se puede emplear para seleccionar más de un elemento.

* **[[]]** . (Ejemplo: ff[[“Nombre”]]) Este operador se emplea para extraer elementos de una lista; esto incluye a los data frames que, como se ha dicho anteriormente, son un tipo particular de lista. Sólo permite la extracción o el acceso a un sólo elemento, aunque el elemento en sí mismo puede ser compuesto, y el objeto resultante no necesariamente es de la misma clase que la lista o data frame original.

* **$** . (Ejemplo: ff$Nombre) Este operador se emplea para extraer o acceder a los elementos de una lista o un data frame, a partir del nombre del elemento. Este operador hace más o menos lo mismo que el operador [[]].

## 3.2. El operador **[]**.

