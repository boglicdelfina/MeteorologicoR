
# dplyr y ggplot2 usan los nombres de las columnas sin comillas, y R CMD check
# no sabe de donde salen. Declararlas aca evita la nota de "no visible binding".
utils::globalVariables(c(
  "id",
  "fecha",
  "mes",
  "temperatura_abrigo_150cm",
  "temperatura_promedio"
))
