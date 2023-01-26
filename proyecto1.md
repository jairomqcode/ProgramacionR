## Ejemplo.

De un edificio, a una altura de 15 m, se ha lanzado con un ángulo de 50 grados, un proyectil a una velocidad de 7 m/s. ¿Cuáles serán las alturas (coordenadas y) del proyectil a cada 0.5 m de distancia horizontal desde donde se lanzó y hasta los 11 m?

Las ecuaciones que gobiernan este fenómeno son las siguientes:

x = v0xt + x0
y = −(gt^2/2) + v0yt + y0

Aquí, **g** es la aceleración de la gravedad, el parámetro **t** se refiere al tiempo, y la velocidad está descompuesta en sus componentes: **v0x** y **v0y**. Éstas se pueden obtener a partir de la velocidad inicial y el ángulo, usando las funciones trigonométricas **sin()** y **cos()**, y considerando que en R, los argumentos de esas funciones deben estar dados en radianes, y por tanto el ángulo debe convertirse a esa unidad.

Así, los datos de partida son como sigue:

```{r}
g <- 9.81   # aceleración gravedad.
x0 <- 0     # x inicial
y0 <- 15    # y inicial
vi <- 7     # velocidad inicial
alphaD <- 50    # ángulo-grados
```

y para encontrar las componentes de la velocidad:

```{r}
# Se convierte a radianes.
alpha <- (pi/180) * alphaD    # ángulo-radianes
v0x <- vi * cos(alpha)        # componente x de velocidad inicial
print(v0x)

sol:
[1] 4.499513

v0y <- vi * sin(alpha)    # componente y de velocidad inicial
print(v0y)

sol:
[1] 5.362311
```

Con esto es suficiente para proceder con el problema. Primeramente obtenemos las x para las que se desea hacer el cálculo, como sigue:

```{r}
# Desde 0 hasta 11 de 0.5 en 0.5:
las.x <- seq(from = 0, to = 11, by = 0.5)
```

En este ejemplo, la secuencia de valores de x se ha guardado en una variable de nombre “las.x”. En este lenguaje, en los nombres de las variables, el punto (.), así como el guión bajo (_), se pueden utilizar simplemente como separadores, para darles mayor claridad.

Nótese que en las fórmulas que gobiernan el fenómeno, dadas anteriormente, no se tiene **y** en función de **x**, sino que las dos coordenadas dependen del parámetro **t**, esto es, del tiempo. Para resolver este asunto simplemente se despeja el parámetro **t**, en la ecuación de **x**, y obtenemos:

t = (x − x0)/v0x

Así, obtenemos los valores de t correspondientes a las x, usando esta fórmula:

```{r}
las.t <- (las.x - x0)/v0x
```

Finalmente, encontramos las **y** correspondientes a las **t**, justamente encontradas, aplicando la fórmula para **y**:

```{r}
las.y <- -(g/2) * las.t^2 + v0y * las.t + y0

# Los resultados:

print(las.x)
sol:
[1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5  8.0  8.5  9.0  9.5 10.0 10.5 11.0

print(las.y)
sol:
[1] 15.0000000 15.5353081 15.9494790 16.2425125 16.4144087 16.4651675 16.3947891 16.2032734 15.8906203 15.4568299 14.9019022
[12] 14.2258372 13.4286349 12.5102953 11.4708183 10.3102040  9.0284524  7.6255636  6.1015373  4.4563738  2.6900730  0.8026348
[23] -1.2059407
```


