
lees_in = function( pix , train_list , dir){

  
  gdal_setInstallation()
  
  ####deel computer op
  cl <- makeCluster(32, outfile="") #outfile="" voor output in console
  registerDoParallel(cl)
  
  
  for(j in 1:length(train_list)){
    
    if(nrow(train_list[[j]])> 1){
    
    #lees plaatjes uit de ecw files
    foreach(i=1:nrow(train_list[[j]]), .errorhandling = "stop", .export=c(), .packages = c("rgdal", "gdalUtils"), .verbose = TRUE) %dopar% {
      
      suppressWarnings(gdal_translate(names(train_list)[j] , outsize =  c(pix,pix), paste0(dir, j ,'_', i , ".gtiff"), projwin = c(train_list[[j]]$x1[i]  , train_list[[j]]$y2[i]   , train_list[[j]]$x2[i], train_list[[j]]$y1[i] ) ))
    
    }
    }
      
      
  }
  stopCluster(cl)
  
  
  
  

 
  
}


