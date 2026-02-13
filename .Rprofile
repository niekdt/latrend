Sys.setenv(RENV_PATHS_LIBRARY = path.expand("~/.renv/latrend/library"))

options(renv.download.override = function(url, destfile, ...) {
  download.file(url, destfile, mode = "wb", quiet = TRUE)
})

options(renv.config.install.transactional = FALSE)

source("renv/activate.R")

if (file.exists("MixTVEM.r")) {
  source("MixTVEM.r")
}
