# Transformaciones

## 

También buscamos ver si una transformación de una u otra característica o de ambas conduce a una relación lineal.

Esto se puede hacer aplicando la función `log()` a una de las variables.

```{r}
#| fig-pos: center
#| echo: false

gf_point(log(mpg) ~ weight, data = auto_data)
```

## El efecto de una transformación

El efecto de una transformación es "linealizar" la relación entre las variables.

::: columns
::: {.column width="50%"}
```{r}
#| fig-pos: center
#| echo: true

gf_point(mpg ~ weight, 
         data = auto_data)
```
:::
  
  ::: {.column width="50%"}
```{r}
#| fig-pos: center
#| echo: true

gf_point(log(mpg) ~ weight, 
         data = auto_data)
```
:::
  :::
  
  El diagrama de dispersión de la derecha explora la relación $log(Y) = X$. O , qeuivalentemente, la relación $Y = e^X$.

## Transformaciones

Otra forma común de ajustar la escala es transformar los datos o los ejes del gráfico. Usamos transformaciones para datos sesgados para que sea más fácil inspeccionar la distribución.

Y cuando la transformación produce una distribución simétrica, la simetría conlleva propiedades útiles para el modelado (que veremos más adelante).

Hay varias formas de transformar datos, pero la transformación de registros tiende a ser especialmente útil.

## La transformación del registro

La transformación logarítmica puede revelar varios tipos comunes de relaciones. Debido a esto, la transformación logarítmica se considera la navaja de las transformaciones.
