# Mediciones diarias de cinco estaciones meteorologicas

Datos diarios de cinco estaciones del INTA ubicadas en Santa Fe, tomados
del Sistema de Informacion y Gestion Agropecuaria (SIGA). Incluye las
estaciones NH0046, NH0098, NH0437, NH0472 y NH0910.

## Usage

``` r
estaciones
```

## Format

Un data.frame con 95681 filas y 7 columnas:

- id:

  Codigo de la estacion, por ejemplo "NH0437".

- fecha:

  Fecha de la medicion.

- temperatura_abrigo_150cm:

  Temperatura media de abrigo a 150 cm, en grados Celsius.

- temperatura_abrigo_150cm_minima:

  Temperatura minima de abrigo a 150 cm, en grados Celsius.

- temperatura_abrigo_150cm_maxima:

  Temperatura maxima de abrigo a 150 cm, en grados Celsius.

- precipitacion_pluviometrica:

  Precipitacion diaria, en milimetros.

- humedad_media_8_14_20:

  Humedad relativa media, en porcentaje.

## Source

Instituto Nacional de Tecnologia Agropecuaria (INTA), SIGA.
<https://github.com/rse-r/intro-programacion/tree/main/datos>
