library(rgdal)
library(gdalUtils)
dir = '/data/other/bgt/20171103'
dir_out = '/windows_share/shapes/'


gmls = dir(dir, pattern=".gml") 
gmls_path = file.path(dir, gmls)

i = 21

for(i  in 21:length(gmls_path) ){

  print(gmls[i])
  
  ogr2ogr(gmls_path[i],   file.path(dir_out, strsplit(gmls[i], '[.]')[[1]][1] ), overwrite = T, skipfailures = T )
  




}