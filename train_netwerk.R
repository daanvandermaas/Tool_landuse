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







######constante
batch_train = 1 #batchsize
batch_test = 1
batch_input = 1L
clas = as.integer(2)
w = as.integer(512)


drop = 0.5 #dropout
ds = 0.99 #gradient descent
lr = 1e-2 #learningrate
kanalen = as.integer(3) #kanalen image
###############





#############
#place holders
#input
x <- tf$placeholder(tf$float32, shape(NULL, w,w,kanalen))
labels <- tf$placeholder(tf$int32, shape(NULL, w,w))
#dropout rate
keep_prob <- tf$placeholder(tf$float32)
#learningrate
lrate <- tf$placeholder(tf$float32)
##################



source('modelklein.r')





################
#fout functie
labels_one_hot = tf$one_hot(labels, depth = clas)
fout  = - tf$reduce_mean(  tf$multiply( labels_one_hot  ,  tf$log(    tf$clip_by_value(out_softmax, clip_value_min =  1e-10, clip_value_max = 1)   ) ) )





#trainstep met adam optimizer (met momentum)
train_step <- tf$train$AdamOptimizer(lrate)$minimize(fout)
#bereken percentage goede antwoorden


###########
#maak sessie
sess <- tf$InteractiveSession()
sess$run(tf$global_variables_initializer())
###########


####################
#train

print('start')


############################
train = "1923/24_61"
################################################





for (i in 1:200000) {
  
  
  
  #lees random plaatjes in
  batch = train[ sample(c(1:length(train)), size = batch_train ) ]
  
  
  input = lees_in(images = batch, w = w, klassen = klassen, dir_images = dir_images, dir_labels = dir_labels)
  b= input[[1]]
  a=  input[[2]]
  a[a!=0] = 1
  
  #train met gradient descent
  train_step$run(feed_dict = dict(x = b, labels = a,keep_prob = drop, lrate = ds^i*lr))
  
  
  
  
  if(i %% 100 == 0){
    

    
    acc = sess$run( fout, feed_dict = dict(x = b, labels = a,keep_prob = 1)  )
    
    print(paste('train accuracy:', acc))
    
  }
  
  
  
  
  
  
}




