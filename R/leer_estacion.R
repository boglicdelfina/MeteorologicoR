
#' Descarga y lee los datos de una estacion meteorologica
#'
#' Descarga el archivo de una estacion del INTA si todavia no esta en el disco
#' y lo lee. Si el archivo ya existe en la ruta indicada, lo lee directamente
#' sin volver a descargarlo.
#'
#' @param id Texto con el codigo de la estacion, por ejemplo "NH0437".
#' @param ruta Texto con la ruta donde guardar o buscar el archivo, por
#'   ejemplo "datos/NH0437.csv".
#'
#' @returns Un data.frame con las mediciones diarias de la estacion.
#'
#' @examples
#' \dontrun{
#' estacion <- leer_estacion("NH0437", "datos/NH0437.csv")
#' }
#'
#' @export
leer_estacion <- function(id, ruta) {

  if (!is.character(id)) {
    cli::cli_abort(c(
      "El id debe ser un texto con el c\U00F3digo de la estaci\U00F3n.",
      "i" = "La variable ingresada es un {class(id)[1]}."
    ))
  }

  if (!file.exists(ruta)) {
    url <- paste0(
      "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
      id, ".csv"
    )
    utils::download.file(url, ruta)
    cli::cli_inform("Se descarg\U00F3 el archivo de la estaci\U00F3n {id} en {ruta}.")
  } else {
    cli::cli_inform("El archivo {ruta} ya exist\U00EDa, se lee directamente.")
  }

  readr::read_csv(ruta, show_col_types = FALSE)
}
