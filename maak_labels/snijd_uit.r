sh = snijd_uit(shape = sh, raster = raster[n,])

snijd_uit = function(shape, raster){
  
  selectie = lapply( c(1:length(shape@polygons)), function(i){
    
    0 <   sum( shape@polygons[[i]]@Polygons[[1]]@coords[,1]  > raster$x1       &
                 shape@polygons[[i]]@Polygons[[1]]@coords[,1]  < raster$x2    & 
                 shape@polygons[[i]]@Polygons[[1]]@coords[,2]  > raster$y1      &
                 shape@polygons[[i]]@Polygons[[1]]@coords[,2]  < raster$y2)  
    
    
    
  })
  
  selectie = unlist(selectie)
  
  shape = shape[selectie,]
  
  return(shape)
}