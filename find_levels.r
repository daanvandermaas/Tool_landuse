library(rgdal)
library(feather)

files = list.files('db/1', full.names = TRUE)

dataframe_levels = data.frame( 'shape_name' = files, 'levels' = -1)


for(file in files){
shape= readRDS(file)
levels = length(levels(shape$class))
dataframe_levels[ dataframe_levels$shape_name == file , 'levels'] = levels
}


write_feather( dataframe_levels, path = 'dataframe_levels.feather')