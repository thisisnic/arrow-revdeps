
callr::rscript("01-deps.R")
callr::rscript("02-check-cran.R")
callr::rscript("03-check-local.R")
callr::rscript("04-compare.R", stdout = "README.md", show = FALSE)
