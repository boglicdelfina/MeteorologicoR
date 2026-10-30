# Contribuir a MeteorologicoR

Este documento explica cómo proponer un cambio en MeteorologicoR.
Para una discucion detallada sobre contribucion y cosas sobre el paquete de tidyverse, por favor revisar
[guia de contribucion de development](https://rstd.io/tidy-contrib) y nuestro [principios de revision de codigo](https://code-review.tidyverse.org/).
## Corregir errores de tipeo

Podés corregir errores de tipeo, de ortografía o de gramática en la
documentación directamente desde la interfaz web de GitHub, siempre que el
cambio se haga en el archivo _fuente_.
Esto generalmente significa que tenés que editar los comentarios de
[roxygen2 comments](https://roxygen2.r-lib.org/articles/roxygen2.html) en un archivo
`.R`, no en un archivo `.Rd`.
Podés encontrar el `.R` que genera el `.Rd` leyendo el comentario de la primera
línea.
## Cambios más grandes

Si querés hacer un cambio más grande, conviene que primero abras un
[issue](https://github.com/boglicdelfina/MeteorologicoR/issues) y te asegures
de que alguien del equipo esté de acuerdo en que hace falta.
Si encontraste un error, abrí un issue que lo muestre con un ejemplo mínimo
reproducible (esto también te va a ayudar a escribir un test, si hace falta).
Mira la guia en [como crear un buen issue](https://code-review.tidyverse.org/issues/) para mas consejos.

### Proceso para los pull requests

*   Hacé un fork del paquete y clonalo en tu computadora. Si nunca lo hiciste,
    te recomendamos usar
    `usethis::create_from_github("boglicdelfina/MeteorologicoR", fork = TRUE)`.

*   Instalá todas las dependencias de desarrollo con
    `devtools::install_dev_deps()` y verificá que el paquete pase correctamente R CMD check usando
    `devtools::check()` sin problemas.
    Si `devtools::check()` no pasa limpio, conviene pedir ayuda antes de
    seguir.

*   Creá una rama de Git para tu pull request (PR). Te recomendamos usar
    `usethis::pr_init("descripcion-breve-del-cambio")`.

*   Hacé tus cambios, commiteá, y creá el PR con `usethis::pr_push()`
    siguiendo las instrucciones en el navegador.
    El título del PR tiene que describir brevemente el cambio.
    El cuerpo del PR tiene que incluir `Fixes #numero-de-issue`.

*   Para los cambios que afectan directamente a los usuarios, agregá un punto al principio de NEWS.md
    (justo debajo del primer encabezado). Seguí el estilo descripto en https://style.tidyverse.org/news.html.
    


### Estilo del código

*   El código nuevo debe seguir la guía de estilo de tidyverse [guia de estilo](https://style.tidyverse.org)
    Podés usar [Air](https://posit-dev.github.io/air/) para aplicar este estilo, pero no reformatees código que no esté relacionado con tu PR.

*   Usamos [roxygen2](https://cran.r-project.org/package=roxygen2), 
    con [Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), para documentacion.
    

*   Usamos [testthat](https://cran.r-project.org/package=testthat) para tests unitarios.
    las contribuciones con casos de test incluidas son mas faciles de aceptar

## Código de Conducta

Tené en cuenta que el proyecto MeteorologicoR se publica con un
[Código de Conducta del Pacto del Contribuyente](../CODE_OF_CONDUCT.md).
Al contribuir a este proyecto, aceptás respetar sus términos.
