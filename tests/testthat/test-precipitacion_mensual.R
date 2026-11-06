
# 1- Devuelve una fila por estacion y por mes, con las columnas esperadas --> expect_equal()
# 2- NAs: Un mes sin ningun dato da NA y no cero --> expect_true()
# 3- Falla si el argumento no es valido: no es data.frame, faltan columnas o la fecha no es Date --> expect_error()


test_that("devuelve una fila por estacion y por mes", {

  datos <- data.frame(
    id = c("A", "A", "A", "B"),
    fecha = as.Date(c("2020-01-05", "2020-01-20", "2020-02-03", "2020-01-10")),
    precipitacion_pluviometrica = c(1, 2, 3, 4)
  )

  resultado <- precipitacion_mensual(datos)

  expect_equal(nrow(resultado), 3)
  expect_equal(names(resultado), c("id", "mes", "precipitacion_acumulada"))

})

test_that("un mes sin datos da NA y los dias faltantes se ignoran", {
  datos <- data.frame(
    id = c("A", "A", "A"),
    fecha = as.Date(c("2020-01-05", "2020-01-20", "2020-02-03")),
    precipitacion_pluviometrica = c(10, NA, NA)
  )

  resultado <- precipitacion_mensual(datos)

  expect_equal(resultado$precipitacion_acumulada[1], 10)
  expect_true(is.na(resultado$precipitacion_acumulada[2]))

})

test_that("no acepta argumentos invalidos", {

  expect_error(precipitacion_mensual("hola"), "data.frame")

  expect_error(
    precipitacion_mensual(data.frame(id = "A")),
    "no tiene todas las columnas"
  )

  datos <- data.frame(
    id = "A",
    fecha = "2020-01-05",
    precipitacion_pluviometrica = 10
  )

  expect_error(precipitacion_mensual(datos), "Date o POSIXct")

})
