.onAttach <- function(...) {
  renv::restore(lockfile = "./renv.lock")
}
