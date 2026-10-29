
# Posibles tests:
# 1) Devuelve una fila por estacion --> expect_equal()
# 2) Devuelve las columnas esperadas --> expect_equal()
# 3) Calcula bien el promedio --> expect_equal()
# 4) Falla si no es un data.frame --> expect_error()
# 5) Falla si falta la columna de temperatura --> expect_error()

test_that("devuelve una fila por estacion", {

  resultado <- tabla_resumen_temperatura(estaciones)

  expect_equal(nrow(resultado), 5)
  expect_equal(names(resultado), c("id", "promedio", "desvio"))

})

test_that("calcula bien el promedio", {

  datos <- data.frame(
    id = c("A", "A", "B", "B"),
    temperatura_abrigo_150cm = c(10, 20, 30, 40)
  )

  resultado <- tabla_resumen_temperatura(datos)

  expect_equal(resultado$promedio, c(15, 35))

})

test_that("ignora los valores faltantes", {

  datos <- data.frame(
    id = c("A", "A", "A"),
    temperatura_abrigo_150cm = c(10, 20, NA)
  )

  expect_equal(tabla_resumen_temperatura(datos)$promedio, 15)

})

test_that("no acepta argumentos invalidos", {

  expect_error(tabla_resumen_temperatura("hola"), "data.frame")
  expect_error(tabla_resumen_temperatura(data.frame(id = "A")), "no tiene la columna")

})
