#vind alle subdirs
#dir_labels = '/home/beheerder/dgxs/Tool_landuse/transfer_20171206/labels'
#dir_images ='/home/beheerder/dgxs/transfer_20171201'
# dir_labels = '/media/beheerder/Seagate Backup Plus Drive/selectie_labels'
# dir_images = '/media/beheerder/Seagate Backup Plus Drive/selectie_images'

source('lib.r')
source('lees_in.r')

dir_labels = 'db/labels_wegen'
dir_images = 'db/images_wegen'


#selecteer klassen die je wilt gebruiken
klassen = read_feather('db/dataframe_levels.feather')
select = c(9)
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

selectie = images

w = 512
x = lees_in(images = selectie, w = w, klassen = klassen, dir_images = dir_images, dir_labels = dir_labels)
input = x[[1]]
labels =  x[[2]]


#haal dirs van labels op
output_dir = 'plaatjes_labels'
dir.create( file.path('db',output_dir))

dirs = list.dirs(dir_labels, full.names = FALSE, recursive = FALSE)
for(dir in dirs){  dir.create( file.path('db',output_dir, dir))}

for(i in 1:dim(labels)[1]){
  writeImage(as.matrix(labels[i,,]),   paste0('db/', output_dir, '/' , images[i], '.png')       )
}




