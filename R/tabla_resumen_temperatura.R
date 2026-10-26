
#' Tabla de resumen de la temperatura de abrigo
#'
#' Calcula el promedio y el desvio estandar de la temperatura de abrigo a
#' 150 cm para una o mas estaciones meteorologicas.
#'
#' @param datos Un data.frame con las mediciones. Debe tener las columnas
#'   `id` y `temperatura_abrigo_150cm`.
#'
#' @returns Un data.frame con una fila por estacion y las columnas `id`,
#'   `promedio` y `desvio`.
#'
#' @examples
#' tabla_resumen_temperatura(estaciones)
#'
#' @export
tabla_resumen_temperatura <- function(datos) {

  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "El argumento datos debe ser un data.frame.",
      "i" = "La variable ingresada es un {class(datos)[1]}."
    ))
  }

  if (!"temperatura_abrigo_150cm" %in% names(datos)) {
    cli::cli_abort("La tabla no tiene la columna temperatura_abrigo_150cm.")
  }

  datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desvio = stats::sd(temperatura_abrigo_150cm, na.rm = TRUE)
    )
}
