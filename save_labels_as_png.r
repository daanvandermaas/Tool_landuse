source('lib.r')
source('lees_in.r')

dir_labels = 'db/labels_waterdeel'
dir_images = 'db/images_waterdeel'
select = c(8)

#selecteer klassen die je wilt gebruiken
klassen = read_feather('db/dataframe_levels.feather')
klassen = klassen[select,]


#maak vector van bestandsnamen
images = list.dirs(dir_labels, recursive = TRUE)
#selecteer alle subdirs die bij een afbeelding horen
splits = strsplit(images, '[/]')
splits = lapply(splits, function(split){
  if(length(split)>3){
    file.path( split[[3]], split[[4]])
  }else{
    NA
  }
})
splits = unlist(splits)
images = splits[!is.na(splits)]





##########################################################################################################################

#haal dirs van labels op
output_dir = 'plaatjes_labels'
dir.create( file.path('db',output_dir))
dirs = list.dirs(dir_labels, full.names = FALSE, recursive = FALSE)
for(dir in dirs){  dir.create( file.path('db',output_dir, dir))}



selectie = images

w = 512
for(i in 1:length(images)){
  
  x = lees_in(images = images[i], w = w, klassen = klassen, dir_images = dir_images, dir_labels = dir_labels)
  labels =  x[[2]]
  

    writeImage(as.matrix(labels[1,,]),   paste0('db/', output_dir, '/' , images[i], '.png')       )
  
  
}













