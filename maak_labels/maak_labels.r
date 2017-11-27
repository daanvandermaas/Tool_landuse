source('snijd_uit.r')

dir_images = "/windows_share/output"
subdirs_images = list.dirs(dir_images, full.names = FALSE)
subdirs_images = subdirs_images[-1]

dir_shapes = "/windows_share/shapes_rds"
shapes = list.files(dir_shapes, full.names = FALSE)
dir_subshapes = "/data/subshapes3"

dir_labels = "/windows_share/labels"

raster = readRDS("/data/raster1.rds")

#loop door alle subdirs in dir_imges heen
for(n in 1:length(subdirs_images)){
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
      print(paste("lees shape", shape))
      #lees shape in
      sh = readRDS(file.path(dir_subshapes, subdirs_images[n], shape))

      
      ######
      
      #loop door alle images in subdir heen
      for(image in images){

        
        #lees in rasterize en sla op
        im = raster(file.path(dir_images, dir, image))
        print(paste("start rasterize", image))
        r = rasterize(x = sh, y = im, field =  sh$class )
        
        if(sum(is.na(r[,]) ) < 512*512){
        print(image)
        }
        
        writeRaster( r,  paste0(dir_labels, '/', dir,'/', strsplit(image, '[.]')[[1]][1], '/', strsplit(shape, '[.]')[[1]][1], '.gtiff'), format="GTiff", overwrite=TRUE)
      }
      
    }
    
  }
}