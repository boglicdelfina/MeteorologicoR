# Descarga y lee los datos de una estacion meteorologica

Descarga el archivo de una estacion del INTA si todavia no esta en el
disco y lo lee. Si el archivo ya existe en la ruta indicada, lo lee
directamente sin volver a descargarlo.

## Usage

``` r
leer_estacion(id, ruta)
```

## Arguments

- id:

  Texto con el codigo de la estacion, por ejemplo "NH0437".

- ruta:

  Texto con la ruta donde guardar o buscar el archivo, por ejemplo
  "datos/NH0437.csv".

## Value

Un data.frame con las mediciones diarias de la estacion.

## Examples

``` r
if (FALSE) { # \dontrun{
estacion <- leer_estacion("NH0437", "datos/NH0437.csv")
} # }
```
