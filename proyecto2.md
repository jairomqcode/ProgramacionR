# Proyecto 2.

## Rotación de un triángulo.

Supóngase ahora, que se tiene un triángulo, cuyos vértices son (1.0, 0.0), (2.0, 1.0), y (1.0, 1.0), y se quieren encontrar los vértices del triángulo resultante de una rotación de 32 grados. Tómese en cuenta que el lenguaje R, provee de las funciones trigonométricas sin(), cos(), así como del número pi.

```{r}
# Triángulo original:
m <- cbind(c(1, 0), c(2, 1), c(1, 1))
print(m)
sol:
     [,1] [,2] [,3]
[1,]    1    2    1
[2,]    0    1    1

# Se convierte el ángulo a radianes:
alpha <- 32 * pi/180

# La matriz para esa rotación es:
tr <- rbind(c(cos(alpha), -sin(alpha)), c(sin(alpha), cos(alpha)))

# El triángulo transformado:
mt <- tr %*% m    # multiplicación matricial

# Los vértices del triángulo transformado:
print(mt)
sol:
          [,1]     [,2]      [,3]
[1,] 0.8480481 1.166177 0.3181288
[2,] 0.5299193 1.907887 1.3779674
```
