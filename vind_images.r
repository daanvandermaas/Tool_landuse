#vind alle subdirs
#dir_labels = '/home/beheerder/dgxs/Tool_landuse/transfer_20171206/labels'
#dir_images ='/home/beheerder/dgxs/transfer_20171201'
dir_labels = '/media/beheerder/Seagate Backup Plus Drive/selectie_labels'
dir_images = '/media/beheerder/Seagate Backup Plus Drive/selectie_images'




#maak dataframe met levels en bestandsnamen
klassen = read_feather('dataframe_levels.feather')
klassen$shape_name = unlist( lapply(klassen$shape_name, function(name){
  paste0(strsplit(as.character(name), '[./]')[[1]][[3]], '.feather' )
  
}) )
 klassen$levels = klassen$levels +1
 
 
 #selecteer klassen die je wilt gebruiken
 
 
 select = c(8)
klassen = klassen[select,]
 
 



images = list.dirs(dir_labels, recursive = TRUE)




#selecteer alle subdirs die bij een afbeelding horen
splits = strsplit(images, '[/]')
splits = lapply(splits, function(split){
  if(length(split)>6){
  file.path( split[[6]], split[[7]])
  }else{
    NA
  }
})
splits = unlist(splits)
images = splits[!is.na(splits)]




#splits op in train en test
samp = sample(c(1:length(images)), size = round(0.8*length(images)))
train = images[samp]
test = images[-samp]






##########################################################################################################################

w = 512
x = lees_in(images = selectie, w = w, klassen = klassen, dir_images = dir_images, dir_labels = dir_labels)
input = x[[1]]
labels =  x[[2]]



for(i in 1:length(selectie)){
display(as.Image(input[i,,,]))
display(as.Image(labels[i,,]))
}