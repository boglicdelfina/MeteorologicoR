#' Precipitacion acumulada por estacion y por mes
#'
#' Suma la precipitacion diaria de cada estacion dentro de cada mes. Los dias
#' sin dato se ignoran; si un mes no tiene ningun dato, el acumulado de ese mes
#' es `NA` y no cero.
#'
#' @param datos Un data.frame con las mediciones de una o mas estaciones. Debe
#'   tener las columnas `id`, `fecha` y `precipitacion_pluviometrica`. La
#'   columna `fecha` tiene que ser de clase `Date` o `POSIXct`.
#'
#' @returns Un data.frame con una fila por estacion y por mes, y las columnas
#'   `id`, `mes` (el primer dia del mes, como `Date`) y
#'   `precipitacion_acumulada` (en milimetros).
#'
#' @examples
#' precipitacion_mensual(estaciones)
#'
#' @export
precipitacion_mensual <- function(datos) {

  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "El argumento datos debe ser un data.frame.",
      "i" = "La variable ingresada es un {class(datos)[1]}."
    ))
  }

  columnas <- c("id", "fecha", "precipitacion_pluviometrica")
  faltantes <- setdiff(columnas, names(datos))

  if (length(faltantes) > 0) {
    cli::cli_abort(c(
      "La tabla no tiene todas las columnas necesarias.",
      "i" = "Faltan: {faltantes}."
    ))
  }

  if (!inherits(datos$fecha, c("Date", "POSIXct"))) {
    cli::cli_abort(c(
      "La columna fecha debe ser de clase Date o POSIXct.",
      "i" = "La columna ingresada es un {class(datos$fecha)[1]}."
    ))
  }

  datos |>
    dplyr::mutate(mes = as.Date(lubridate::floor_date(fecha, "month"))) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(
      precipitacion_acumulada = if (all(is.na(precipitacion_pluviometrica))) {
        NA_real_
      } else {
        sum(precipitacion_pluviometrica, na.rm = TRUE)
      },
      .groups = "drop"
    )
}
