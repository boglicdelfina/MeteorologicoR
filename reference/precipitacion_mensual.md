# Precipitacion acumulada por estacion y por mes

Suma la precipitacion diaria de cada estacion dentro de cada mes. Los
dias sin dato se ignoran; si un mes no tiene ningun dato, el acumulado
de ese mes es `NA` y no cero.

## Usage

``` r
precipitacion_mensual(datos)
```

## Arguments

- datos:

  Un data.frame con las mediciones de una o mas estaciones. Debe tener
  las columnas `id`, `fecha` y `precipitacion_pluviometrica`. La columna
  `fecha` tiene que ser de clase `Date` o `POSIXct`.

## Value

Un data.frame con una fila por estacion y por mes, y las columnas `id`,
`mes` (el primer dia del mes, como `Date`) y `precipitacion_acumulada`
(en milimetros).

## Examples

``` r
precipitacion_mensual(estaciones)
#> # A tibble: 3,151 × 3
#>    id     mes        precipitacion_acumulada
#>    <chr>  <date>                       <dbl>
#>  1 NH0046 1973-01-01                    90.4
#>  2 NH0046 1973-02-01                   204. 
#>  3 NH0046 1973-03-01                   197. 
#>  4 NH0046 1973-04-01                    99.2
#>  5 NH0046 1973-05-01                     4.4
#>  6 NH0046 1973-06-01                   160  
#>  7 NH0046 1973-07-01                    68.6
#>  8 NH0046 1973-08-01                     4  
#>  9 NH0046 1973-09-01                     9  
#> 10 NH0046 1973-10-01                   128. 
#> # ℹ 3,141 more rows
```
