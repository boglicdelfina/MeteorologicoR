# Grafico del promedio mensual de temperatura

Calcula el promedio mensual de la temperatura de abrigo a 150 cm y lo
grafica con una linea por estacion.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Un data.frame con las mediciones de una o mas estaciones. Debe tener
  las columnas `id`, `fecha` y `temperatura_abrigo_150cm`.

- colores:

  Vector con un color por estacion. Si no se indica, se eligen colores
  al azar.

- titulo:

  Texto con el titulo del grafico. Por defecto "Temperatura".

## Value

Un grafico de ggplot2 con una linea por estacion.

## Examples

``` r
grafico_temperatura_mensual(
  estaciones,
  colores = c("darkred", "steelblue", "darkgreen", "orange", "purple")
)

```
