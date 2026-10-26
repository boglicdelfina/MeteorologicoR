
library(readr)
library(dplyr)

base_url <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/"

estacion_0472 <- read_csv(paste0(base_url, "NH0472.csv"), show_col_types = FALSE)
estacion_0910 <- read_csv(paste0(base_url, "NH0910.csv"), show_col_types = FALSE)
estacion_0046 <- read_csv(paste0(base_url, "NH0046.csv"), show_col_types = FALSE)
estacion_0098 <- read_csv(paste0(base_url, "NH0098.csv"), show_col_types = FALSE)
estacion_0437 <- read_csv(paste0(base_url, "NH0437.csv"), show_col_types = FALSE)

# Nos quedamos solo con las columnas que usan las funciones del paquete,
# porque las 35 originales hacen un archivo demasiado pesado.
estaciones <- rbind(
  estacion_0472, estacion_0910, estacion_0046,
  estacion_0098, estacion_0437
) |>
  select(
    id,
    fecha,
    temperatura_abrigo_150cm,
    temperatura_abrigo_150cm_minima,
    temperatura_abrigo_150cm_maxima,
    precipitacion_pluviometrica,
    humedad_media_8_14_20
  )

# Agrega los datos al paquete
usethis::use_data(estaciones, overwrite = TRUE)
