library(rgdal)
library(feather)

files = list.files('db/1', full.names = TRUE)

dataframe_levels = data.frame( 'shape_name' = files, 'levels' = -1)


for(file in files){
shape= readRDS(file)
levels = length(levels(shape$class))
dataframe_levels[ dataframe_levels$shape_name == file , 'levels'] = levels
}


write_feather( dataframe_levels, path = 'db/dataframe_levels.feather')

klassen = read_feather('db/dataframe_levels.feather')
klassen$shape_name = unlist( lapply(klassen$shape_name, function(name){
  paste0(strsplit(as.character(name), '[./]')[[1]][[3]], '.feather' )
  
}) )
klassen$levels = klassen$levels +1



write_feather(klassen, path = 'db/dataframe_levels.feather')
