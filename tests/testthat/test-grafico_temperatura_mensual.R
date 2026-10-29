
# Posibles tests:
# 1) Devuelve un objeto de ggplot2 --> expect_s3_class()
# 2) Usa el titulo por defecto --> expect_equal()
# 3) Usa el titulo que le pasamos --> expect_equal()
# 4) Avisa cuando elige colores al azar --> expect_message()
# 5) Falla si faltan colores --> expect_error()
# 6) Falla si no es un data.frame --> expect_error()

test_that("devuelve un grafico", {

  grafico <- grafico_temperatura_mensual(
    estaciones,
    colores = c("red", "blue", "green", "orange", "purple")
  )

  expect_s3_class(grafico, "ggplot")

})

test_that("el titulo por defecto es Temperatura", {

  grafico <- grafico_temperatura_mensual(
    estaciones,
    colores = c("red", "blue", "green", "orange", "purple")
  )

  expect_equal(grafico$labels$title, "Temperatura")

})

test_that("respeta el titulo que le pasamos", {

  grafico <- grafico_temperatura_mensual(
    estaciones,
    colores = c("red", "blue", "green", "orange", "purple"),
    titulo = "Otro titulo"
  )

  expect_equal(grafico$labels$title, "Otro titulo")

})

test_that("avisa cuando elige los colores sola", {

  expect_message(grafico_temperatura_mensual(estaciones), "al azar")

})

test_that("no grafica si faltan colores o el argumento es invalido", {

  expect_error(
    grafico_temperatura_mensual(estaciones, colores = c("red", "blue")),
    "Faltan colores"
  )
  expect_error(grafico_temperatura_mensual("hola"), "data.frame")

})
