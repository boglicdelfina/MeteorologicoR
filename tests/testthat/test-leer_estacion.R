
# Posibles tests:
# 1) Falla si el id no es texto --> expect_error()
# 2) Lee el archivo si ya existe, sin descargar --> expect_message()
# 3) Devuelve los datos del archivo --> expect_equal()

test_that("el id tiene que ser texto", {

  expect_error(leer_estacion(437, "datos/prueba.csv"), "debe ser un texto")
  expect_error(leer_estacion(TRUE, "datos/prueba.csv"), "debe ser un texto")

})

test_that("si el archivo ya existe no lo descarga", {

  archivo <- tempfile(fileext = ".csv")
  utils::write.csv(estaciones[1:10, ], archivo, row.names = FALSE)

  expect_message(leer_estacion("NH0472", archivo), "ya exist")

})

test_that("devuelve los datos del archivo", {

  archivo <- tempfile(fileext = ".csv")
  utils::write.csv(estaciones[1:10, ], archivo, row.names = FALSE)

  resultado <- suppressMessages(leer_estacion("NH0472", archivo))

  expect_equal(nrow(resultado), 10)

})
