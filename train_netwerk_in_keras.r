source('lib.r')
source('lees_in.r')

if(!dir.exists('db/netwerk')){
  dir.create('db/netwerk')
}



dir_labels = 'db/labels_waterdeel'
dir_images = 'db/images_waterdeel'


##########################bestanden prepareren

#selecteer klassen die je wilt gebruiken
klassen = read_feather('db/dataframe_levels.feather')
select = c(8)
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


#splits op in train en test
samp = sample(c(1:length(images)), size = round(0.8*length(images)))
train = images[samp]
test = images[-samp]


rm(samp)
rm(select)
rm(splits)
rm(images)



#####################################


model %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = 'relu',
                input_shape = input_shape) %>% 
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = 'relu') %>% 
  layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
  layer_dropout(rate = 0.25) %>% 
  layer_flatten() %>% 
  layer_dense(units = 128, activation = 'relu') %>% 
  layer_dropout(rate = 0.5) %>% 
  layer_dense(units = num_classes, activation = 'softmax')



summary(model)

compile(model,
        loss = "categorical_crossentropy",
        optimizer = optimizer_rmsprop(),
        metrics = c("accuracy")
)




batch = train[1:2]

input = lees_in(images = batch, w = w, klassen = klassen, dir_images = dir_images, dir_labels = dir_labels)
   images_batch  = input[[1]]
   labels_batch=  input[[2]]
images_batch[images_batch!=0] = 1






