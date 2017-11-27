#sh = snijd_uit(sh = sh, raster_row = raster[n,])


snijd_rasterrij_uit_raster = function(sh, raster_row){
  selectie = lapply( c(1:length(sh@polygons)), function(i){
    
    0 <   sum( sh@polygons[[i]]@Polygons[[1]]@coords[,1]  > raster_row$x1       &
                 sh@polygons[[i]]@Polygons[[1]]@coords[,1]  < raster_row$x2    & 
                 sh@polygons[[i]]@Polygons[[1]]@coords[,2]  > raster_row$y1      &
                 sh@polygons[[i]]@Polygons[[1]]@coords[,2]  < raster_row$y2)  
  })  
  selectie = unlist(selectie)
  
  sh = sh[selectie,]
  return(sh)
}


# 
# library(rgeos)
# 
# snijd_rasterrij_uit_raster = function(sh, raster_row){
# matrix = matrix(c(raster_row$x1, raster_row$y1,
#                   raster_row$x2, raster_row$y1,
#                   raster_row$x2, raster_row$y2,
#                   raster_row$x2, raster_row$y2),
#                 ncol = 2, byrow = TRUE)
# RD <- CRS(" +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +no_defs ")
# Ps1 = SpatialPolygons(list(Polygons(list(Polygon(matrix)), ID = "a")), proj4string=RD)
# #Onderstaande statement kost veel tijd
# sh_select<- sh[Ps1,]
# return(sh_select)
# }
# 


















