
# Preliminaries -----------------------------------------------------------

library(tidyverse)


fs = list.files('ModelFitting/', pattern = '\\.R$')



# single file
rmarkdown::render(
  "ModelFitting/nelder_mead.R",
  output_dir = '../m-clark.github.io/docs/models/',
  # output_yaml = 'render.yaml',   # ignored
  # params = list(title = 'blah'),
  knit_meta = list(comment = NA)
)


# all in theory, paths issue most likely; not worth the trouble
map(fs, rmarkdown::render, output_dir = '../m-clark.github.io/docs/models/')


# selection
fs_select = fs[grepl(fs, pattern = 'gradient')]

map(paste0('ModelFitting/', fs_select), rmarkdown::render, output_dir = '../m-clark.github.io/docs/models/')



