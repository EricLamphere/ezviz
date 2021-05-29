
.onAttach <- function(...) {
  packageStartupMessage(
    emo::ji("beers"),
    crayon::white(" ezviz "),
    crayon::cyan(packageVersion("ezviz"))
  )
}
