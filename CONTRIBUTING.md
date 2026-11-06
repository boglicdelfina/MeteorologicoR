# Contribuir a MeteorologicoR

Este documento explica cómo proponer un cambio en MeteorologicoR.

## Corregir errores de tipeo

Podés corregir errores de tipeo, de ortografía o de gramática en la
documentación directamente desde la interfaz web de GitHub, siempre que
el cambio se haga en el archivo *fuente*.

Esto generalmente significa que tenés que editar los comentarios de
[roxygen2](https://roxygen2.r-lib.org/articles/roxygen2.html) en un
archivo `.R`, no en un archivo `.Rd`. Podés encontrar el `.R` que genera
el `.Rd` leyendo el comentario de la primera línea.

## Cambios más grandes

Si querés hacer un cambio más grande, conviene que primero abras un
[issue](https://github.com/boglicdelfina/MeteorologicoR/issues) y te
asegures de que alguien del equipo esté de acuerdo en que hace falta.

Si encontraste un error, abrí un issue que lo muestre con un ejemplo
mínimo reproducible: eso también te va a ayudar a escribir un test, si
hace falta. Podés mirar la guía sobre [cómo crear un buen
issue](https://code-review.tidyverse.org/issues/) para más consejos.

### Proceso para los pull requests

- Hacé un fork del paquete y clonalo en tu computadora. Si nunca lo
  hiciste, te recomendamos usar
  `usethis::create_from_github("boglicdelfina/MeteorologicoR", fork = TRUE)`.

- Instalá todas las dependencias de desarrollo con
  `devtools::install_dev_deps()` y verificá que el paquete pase
  `devtools::check()` sin errores, warnings ni notas. Si no pasa limpio,
  conviene pedir ayuda antes de seguir.

- Creá una rama de Git para tu pull request. Te recomendamos usar
  `usethis::pr_init("descripcion-breve-del-cambio")`.

- Hacé tus cambios, commiteá, y creá el pull request con
  `usethis::pr_push()` siguiendo las instrucciones en el navegador. El
  título tiene que describir brevemente el cambio, y el cuerpo incluir
  `Fixes #numero-de-issue`.

### Estilo del código

- El código nuevo sigue la [guía de estilo de
  tidyverse](https://style.tidyverse.org). Podés usar
  [Air](https://posit-dev.github.io/air/) para aplicarla, pero no
  reformatees código que no tenga que ver con tu pull request.

- Usamos [roxygen2](https://cran.r-project.org/package=roxygen2) con
  [sintaxis
  Markdown](https://roxygen2.r-lib.org/articles/rd-formatting.html) para
  la documentación.

- Usamos [testthat](https://cran.r-project.org/package=testthat) para
  los tests. Las contribuciones que vienen con sus propios tests son más
  fáciles de aceptar.

## Código de Conducta

Tené en cuenta que el proyecto MeteorologicoR se publica con un [Código
de Conducta del Pacto del
Contribuyente](https://boglicdelfina.github.io/CODE_OF_CONDUCT.md). Al
contribuir a este proyecto, aceptás respetar sus términos.
