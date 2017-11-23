
###Maak er .rds files van


dir_in = '/windows_share/shapes/'
dir_out = '/windows_share/shapes_rds'

paths = list.files(dir_in, pattern = "*.shx")

paths = lapply(paths, function(path){
  
  strsplit(path,'[.]')[[1]][1]
  
})
paths = unlist(paths)



for(i in 1:length(paths)){
 shape =  readOGR(dir_in, layer = paths[i])
 print(paths[i])
  saveRDS(shape, paste0(dir_out, "/", paths[i], ".rds"))
  
}