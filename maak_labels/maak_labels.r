source('snijd_uit.r')

dir_images = "/windows_share/output"
  subdirs_images = list.dirs(dir_images, full.names = FALSE)

dir_shapes = "/windows_share/shapes_rds"
  shapes = list.files(dir_shapes, full.names = FALSE)

dir_labels = "/windows_share/labels"
  
raster = readRDS("/windows_share/output/raster.rds")
  
  

  #loop door alle subdirs in dir_imges heen
  for(n in 1:length(subdirs_images)){
    dir = subdirs_images[n]
    
    #Maak subdir binen labels dir
    dir.create(file.path(dir_labels, dir))
    #pak alle namen van alle subdirs
    images = list.files(file.path(dir_images, dir))
    
    
    #loop door alle shapes heen
    for(shape in shapes){
      #lees shape in
      sh = readRDS(file.path(dir_shapes, shape))
      #snijd shape uit 
      sh = snijd_uit(shape = sh, raster = raster[n,])
      
      ######
      
      #loop door alle images in subdir heen
      for(image in images){
        #creeer dir voor image in subdir
        dir.create(file.path(dir_labels, dir, strsplit(image, '[.]')[[1]][1]))
        
        #lees in rasterize en sla op
        im = raster(file.path(dir_images, dir, image))
        r = rasterize(x = sh, y = im, field =  sh$class )
        r[is.na(r)] = -1
        saveRDS(r, file = paste0(dir_labels, '/', dir,'/', strsplit(image, '[.]')[[1]][1], '/', shape))
      }
      
    }
  }