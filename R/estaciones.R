
#' Mediciones diarias de cinco estaciones meteorologicas
#'
#' Datos diarios de cinco estaciones del INTA ubicadas en Santa Fe, tomados
#' del Sistema de Informacion y Gestion Agropecuaria (SIGA). Incluye las
#' estaciones NH0046, NH0098, NH0437, NH0472 y NH0910.
#'
#' @format Un data.frame con 95681 filas y 7 columnas:
#' \describe{
#'   \item{id}{Codigo de la estacion, por ejemplo "NH0437".}
#'   \item{fecha}{Fecha de la medicion.}
#'   \item{temperatura_abrigo_150cm}{Temperatura media de abrigo a 150 cm, en grados Celsius.}
#'   \item{temperatura_abrigo_150cm_minima}{Temperatura minima de abrigo a 150 cm, en grados Celsius.}
#'   \item{temperatura_abrigo_150cm_maxima}{Temperatura maxima de abrigo a 150 cm, en grados Celsius.}
#'   \item{precipitacion_pluviometrica}{Precipitacion diaria, en milimetros.}
#'   \item{humedad_media_8_14_20}{Humedad relativa media, en porcentaje.}
#' }
#'
#' @source Instituto Nacional de Tecnologia Agropecuaria (INTA), SIGA.
#'   <https://github.com/rse-r/intro-programacion/tree/main/datos>
"estaciones"
