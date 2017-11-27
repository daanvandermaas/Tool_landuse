#maak subshapes
source("snijd_uit.r")


#dir_images = "/windows_share/output"
#subdirs_images = list.dirs(dir_images, full.names = FALSE)
#subdirs_images = subdirs_images[-1]
dir.create("/windows_share/subshapes")
subshapes_dirs = "/windows_share/subshapes"

dir_shapes = "/windows_share/shapes_rds"
shapes = list.files(dir_shapes, full.names = FALSE)
raster = readRDS("/data/raster1.rds")

for(n in 1:nrow(raster)){
 
  dir.create(file.path(subshapes_dirs, n))
  
}
 
  
for(shape in shapes){
  print(paste("lees shape", shape))
  #lees shape in
  sh = readRDS(file.path(dir_shapes, shape))
  sh = snijd_rasterrij_uit_raster(sh = sh, raster = data.frame( 'x1' = min(raster$x1), 'y1' = min(raster$y1), 'x2' = max(raster$x2), 'y2'= max(raster$y2)))
  #clusterExport(cl, "sh")
  
  for(n in 1:nrow(raster)){
    print(c("start uitsnijden voor rasterdeel", n))
    raster_row = raster[n,]
    #clusterExport(cl, "raster_row")
    subshape = snijd_rasterrij_uit_raster(sh = sh, raster_row = raster_row)
    
    saveRDS(subshape, file = file.path(subshapes_dirs, n, shape ))
  }
}





  