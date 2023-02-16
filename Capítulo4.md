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

sol: 
[1] "primer renglon"
[1] "RANGO MEDIO"
```

Nótese que el segundo bloque de expresiones en el ejemplo, es una expresión compuesta de dos expresiones; pero como ellas se han dado en un solo renglón se han separado mediante el carácter ;. La condición que da lugar a este mismo bloque de expresiones, introduce dos nuevos operadores: <= y &&; el primero de ellos es el operador de comparación menor o igual que y el segundo es el operador lógico and. Entonces la condición es equivalente a la expresión matemática: 10 ≤ aa ≤ 201. Finalmente, el tercer y último bloque de expresiones, se ejecuta en caso de que ninguna de las condiciones correspondientes a los otros dos bloques se haya satisfecho.
