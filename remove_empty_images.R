library(tiff)

dir_images= "/windows_share/output"

subdirs = list.dirs(dir_images, full.names = TRUE, recursive = F)


for(dir in subdirs){
  images = list.files(dir, full.names = TRUE)
  for(image in images){
    im = readTIFF(image)
    if(sum(im[,,1] < 0.9) > 100000  ){
      file.remove(image)
    }
  }
  
}



