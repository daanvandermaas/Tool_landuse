#maak subshapes
source("snijd_uit.r")

dir_images = "/windows_share/output"
subdirs_images = list.dirs(dir_images, full.names = FALSE)
subdirs_images = subdirs_images[-1]
dir.create("/windows_share/subshapes")
subshapes_dirs = "/windows_share/subshapes"

dir_shapes = "/windows_share/shapes_rds"
shapes = list.files(dir_shapes, full.names = FALSE)
raster = readRDS("/windows_share/raster.rds")

for(n in 1:nrow(raster)){
 
  dir.create(file.path(subshapes_dirs, n))
  
}
 
  
  

    for(shape in shapes){
      print(paste("lees shape", shape))
      #lees shape in
      sh = readRDS(file.path(dir_shapes, shape))
      
      for(n in 1:nrow(raster)){
      subshape = snijd_uit(shape = sh, raster = raster[n,])
      saveRDS(subshape, file = file.path(subshapes_dirs, n, shape ))
      }
    }



  