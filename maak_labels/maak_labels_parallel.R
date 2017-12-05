

dir_images = "/windows_share/output"
subdirs_images = list.dirs(dir_images, full.names = FALSE)
subdirs_images = subdirs_images[-1]

dir_shapes = "/windows_share/shapes_rds"
shapes = list.files(dir_shapes, full.names = FALSE)
dir_subshapes = "/windows_share/subshapes_small"

dir_labels = "/windows_share/labels"

raster = readRDS("/data/raster1.rds")

#loop door alle subdirs in dir_images heen
for(n in 571:length(subdirs_images)){
  dir = subdirs_images[n]
  print(paste("subdir", subdirs_images[n]))
  #Maak subdir binen labels dir
  dir.create(file.path(dir_labels, dir))
  #pak alle namen van alle subdirs
  images = list.files(file.path(dir_images, dir))
  
  #loop door alle shapes heen
  if(length(images)>0){
    #creeer dir voor image in subdir
    for(image in images){ dir.create(file.path(dir_labels, dir, strsplit(image, '[.]')[[1]][1]))}
    for(shape in shapes){
      print(paste("lees shape", file.path(dir_subshapes, subdirs_images[n], shape)))
      #lees shape in
      sh = readRDS(file.path(dir_subshapes, subdirs_images[n], shape))
      cl <- makeCluster(16, outfile="") #outfile="" voor output in console
      registerDoParallel(cl)
      
      ######
      
      #loop door alle images in subdir heen
      foreach(i=1:length(images), .errorhandling = "stop", .export=c(), .packages = c("rgdal", "gdalUtils", 'feather', 'raster'), .verbose = F) %dopar% {
        image = images[i]
        
        #lees in rasterize en sla op
        im = raster(file.path(dir_images, dir, image))
        
        if(nrow(sh)>0){
          r = rasterize(x = sh, y = im, field =  as.numeric(sh$class )+1)
        }else{
          r = raster(im)
          r[,] = NA
        }
        
        r = as.data.frame(  array(r[,], dim = dim(r)[1:2] ))
        r[is.na(r)] = 0
        
        
        
        write_feather(r, path = paste0(dir_labels, '/', dir,'/', strsplit(image, '[.]')[[1]][1], '/', strsplit(shape, '[.]')[[1]][1], '.feather'))
        
        
        
      }
    }
  }
}
