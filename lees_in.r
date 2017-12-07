




lees_in = function(images, w, klassen, dir_images, dir_labels){

a = array(0, dim = c(length(images),w,w,3))

clas = sum(klassen$levels) - nrow(klassen) +1



for(i in 1:length(images)){
im = readTIFF( paste0(dir_images, '/' , images[i],'.gtiff' ))
a[i,,,1] = t(im[,,1])
a[i,,,2] = t(im[,,2])  
a[i,,,3] = t(im[,,3])  
}



b = list()


for(j in 1:nrow(klassen)){
b[[j]] = array(-1, dim = c(length(images),w,w) )
  
  for(i in 1:length(images)){
    label =  read_feather( file.path(dir_labels, images[i], klassen$shape_name[j])  )
  b[[j]][i,,] = as.matrix(label)

  }

}

#merge de lijst van arrays naar 1 array met unieke labels
labels = array(0, dim = c(length(images), w,w))
N=0
for(n in 1:length(b)){
  b[[n]][ b[[n]] == 0 ] = -N
  labels = labels + b[[n]] + N
  N = N + klassen$levels[n] - 1
}



return(list(a, labels))

}