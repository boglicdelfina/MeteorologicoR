# Tabla de resumen de la temperatura de abrigo

Calcula el promedio y el desvio estandar de la temperatura de abrigo a
150 cm para una o mas estaciones meteorologicas.

## Usage

``` r
tabla_resumen_temperatura(datos)
```

## Arguments

- datos:

  Un data.frame con las mediciones. Debe tener las columnas `id` y
  `temperatura_abrigo_150cm`.

## Value

Un data.frame con una fila por estacion y las columnas `id`, `promedio`
y `desvio`.

## Examples

``` r
tabla_resumen_temperatura(estaciones)
#> # A tibble: 5 × 3
#>   id     promedio desvio
#>   <chr>     <dbl>  <dbl>
#> 1 NH0046     17.3   5.90
#> 2 NH0098     18.6   5.98
#> 3 NH0437     20.2   5.77
#> 4 NH0472     18.0   5.94
#> 5 NH0910     17.7   6.12
```
