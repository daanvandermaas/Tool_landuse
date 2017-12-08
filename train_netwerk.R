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
batch_train = 2 #batchsize
batch_test = 1
clas = as.integer(2)
w = as.integer(512)


drop = 0.5 #dropout
ds = 0.99 #gradient descent
lr = 1e-3 #learningrate
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





############variabelen
w_conv1 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 3L, 4L), stddev=0.1), 'w_conv1')
b_conv1 <- tf$Variable(tf$truncated_normal(shape(1L, 4L), stddev=0.1), 'b_conv1')  
w_conv2 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 4L, 8L), stddev=0.1), 'w_conv12')
b_conv2 <- tf$Variable(tf$truncated_normal(shape(1L, 8L), stddev=0.1), 'b_conv2') 
w_conv3 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 8L, 16L), stddev=0.1), 'w_conv3')
b_conv3 <- tf$Variable(tf$truncated_normal(shape(1L, 16L), stddev=0.1), 'b_conv3')  
#
w_upconv1 <- tf$Variable(tf$truncated_normal(shape(3L, 3L,   16L, 16L), stddev=0.1), 'w_upconv1')
b_upconv1 <- tf$Variable(tf$truncated_normal(shape(1L, 16L), stddev=0.1), 'b_upconv1') 
w_upconv2 <- tf$Variable(tf$truncated_normal(shape(3L, 3L,   16L, 16L), stddev=0.1), 'w_upconv2')
b_upconv2 <- tf$Variable(tf$truncated_normal(shape(1L, 16L), stddev=0.1), 'b_upconv2') 
w_upconv3 <- tf$Variable(tf$truncated_normal(shape(3L, 3L,   16L, 16L), stddev=0.1), 'w_upconv3')
b_upconv3 <- tf$Variable(tf$truncated_normal(shape(1L, 16L), stddev=0.1), 'b_upconv3') 
#
w_out1 <- tf$Variable(tf$truncated_normal(shape(1L, 1L,   16L, 16L), stddev=0.1), 'w_out1')
b_out1 <- tf$Variable(tf$truncated_normal(shape(1L, 16L), stddev=0.1), 'b_out1')  
w_out2 <- tf$Variable(tf$truncated_normal(shape(1L, 1L,   16L, clas), stddev=0.1), 'w_out2')
b_out2 <- tf$Variable(tf$truncated_normal(shape(1L, clas), stddev=0.1), 'b_out2')  
#################







###################### De graph
h_conv1 <- tf$nn$relu(  tf$nn$conv2d(x, w_conv1, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv1 )
h_pool1 = tf$nn$max_pool(h_conv1 ,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 

h_conv2 <- tf$nn$relu(  tf$nn$conv2d(h_pool1 , w_conv2, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv2 )
h_pool2 = tf$nn$max_pool(h_conv2 ,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 

h_conv3 <- tf$nn$relu(  tf$nn$conv2d(h_pool2 , w_conv3, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv3 )
h_pool3 = tf$nn$max_pool(h_conv3 ,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 


h_upconv1 = tf$nn$relu(  tf$nn$conv2d(h_pool3, w_upconv1, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_upconv1 )
h_scale1 = tf$image$resize_images(h_upconv1, size =  c( as.integer(w/4) , as.integer(w/4) ))

h_upconv2 = tf$nn$relu(  tf$nn$conv2d(h_scale1, w_upconv2, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_upconv2 )
h_scale2 = tf$image$resize_images(h_upconv2, size =  c( as.integer(w/2) , as.integer(w/2) ))

h_upconv3 = tf$nn$relu(  tf$nn$conv2d(h_scale2, w_upconv3, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_upconv3 )
h_scale3 = tf$image$resize_images(h_upconv3, size =  c( as.integer(w) , as.integer(w) ))


out1 =   tf$nn$conv2d(h_scale3, w_out1, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_out1 
out2 =   tf$nn$conv2d(out1 , w_out2, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_out2 
out_softmax = tf$nn$softmax(out2, dim = -1L)
################


labels_one_hot = tf$one_hot(labels, depth = clas)

################
#fout functie
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




