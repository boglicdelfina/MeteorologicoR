
#' Grafico del promedio mensual de temperatura
#'
#' Calcula el promedio mensual de la temperatura de abrigo a 150 cm y lo
#' grafica con una linea por estacion.
#'
#' @param datos Un data.frame con las mediciones de una o mas estaciones.
#'   Debe tener las columnas `id`, `fecha` y `temperatura_abrigo_150cm`.
#' @param colores Vector con un color por estacion. Si no se indica, se
#'   eligen colores al azar.
#' @param titulo Texto con el titulo del grafico. Por defecto "Temperatura".
#'
#' @returns Un grafico de ggplot2 con una linea por estacion.
#'
#' @examples
#' grafico_temperatura_mensual(
#'   estaciones,
#'   colores = c("darkred", "steelblue", "darkgreen", "orange", "purple")
#' )
#'
#' @export
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {

  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "El argumento datos debe ser un data.frame.",
      "i" = "La variable ingresada es un {class(datos)[1]}."
    ))
  }

  cantidad_estaciones <- length(unique(datos$id))

  if (is.null(colores)) {
    colores <- sample(grDevices::colors(), cantidad_estaciones)
    cli::cli_inform("No se indicaron colores, se eligieron {cantidad_estaciones} al azar.")
  }

  if (length(colores) < cantidad_estaciones) {
    cli::cli_abort(c(
      "Faltan colores para graficar todas las estaciones.",
      "i" = "Hay {cantidad_estaciones} estaciones y se indicaron {length(colores)} colores."
    ))
  }

  datos |>
    dplyr::mutate(mes = lubridate::month(fecha)) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(
      temperatura_promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    ) |>
    ggplot2::ggplot(ggplot2::aes(mes, temperatura_promedio)) +
    ggplot2::geom_line(ggplot2::aes(color = id)) +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::scale_x_continuous(breaks = 1:12) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura media (\U00B0C)",
      color = "Estaci\U00F3n"
    )
}
