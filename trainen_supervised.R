source('lib.r')
source('lees_xml.r')
source('plaatjes_inlezen.r')


if(!dir.exists('db/netwerk')){
  dir.create('db/netwerk')
}




files = list.files('db/plaatjes') 
labels = paste0('db/xml/',  unlist( lapply( strsplit(files,'[.]'), function(x){x[1]})), '.xml' )
files = file.path('db/plaatjes', files)

data = data.frame('files' = files, 'labels' = labels, stringsAsFactors = FALSE)


samp = sample(x = c(1:nrow(data)),  size = round(0.8*nrow(data)))
train = data[samp,]
test = data[-samp,]

rm(data)
rm(labels)
rm(files)
###############







######constante
batch_train = 4 #batchsize
batch_test = 1
h = as.integer(400) #heigth image
w = as.integer(400) #width image
clas = as.integer(2)



drop = 0.5 #dropout
ds = 0.99 #gradient descent
lr = 1e-3 #learningrate
kanalen = as.integer(3) #kanalen image
###############





#############
#place holders
#input
x <- tf$placeholder(tf$float32, shape(NULL, h,w,kanalen))
labels <- tf$placeholder(tf$float32, shape(NULL, h,w,clas))
#dropout rate
keep_prob <- tf$placeholder(tf$float32)
#learningrate
lrate <- tf$placeholder(tf$float32)
##################





############variabelen
w_conv1 <-tf$Variable(tf$truncated_normal(shape(16L, 16L, 3L, 16L), stddev=0.1), 'w_conv1')
b_conv1 <- tf$Variable(tf$truncated_normal(shape(1L, 16L), stddev=0.1), 'b_conv1')  
#
w_conv2 <- tf$Variable(tf$truncated_normal(shape(8L, 8L,   16L, 32L), stddev=0.1), 'w_conv2')
b_conv2 <- tf$Variable(tf$truncated_normal(shape(1L, 32L), stddev=0.1), 'b_upconv1')  
w_out <- tf$Variable(tf$truncated_normal(shape(1L, 1L,   32L, clas), stddev=0.1), 'w_upconv1')
b_out <- tf$Variable(tf$truncated_normal(shape(1L, clas), stddev=0.1), 'b_upconv1')  
#################







###################### De graph
h_conv1 <- tf$nn$relu(  tf$nn$conv2d(x, w_conv1, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv1 )
h_pool1 = tf$nn$max_pool(h_conv1 ,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 
h_conv2 = tf$nn$relu(  tf$nn$conv2d(h_pool1, w_conv2, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv2 )
h_scale1 = tf$image$resize_images(h_conv2, size =  c(w,h))
out =   tf$nn$conv2d(h_scale1, w_out, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_out 
out_softmax = tf$nn$softmax(out, dim = -1L)
################




################
#fout functie
fout  = - tf$reduce_mean(  tf$multiply( labels  ,  tf$log(    tf$clip_by_value(out_softmax, clip_value_min =  1e-10, clip_value_max = 1)   ) ) )





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
  batch = train[sample(c(1:nrow(train)), size = batch_train ) , ]
  
  a = maak_heatmap(h = h , w=w, labels = batch$labels)
  
  b = lees_in(w=w, h=h, files = batch$files)
  
  
  
  #train met gradient descent
  train_step$run(feed_dict = dict(x = b, labels = a,keep_prob = drop, lrate = ds^i*lr))
  
  
  
  
  if(i %% 100 == 0){
    
    batch = test[sample(c(1:nrow(test)), size = batch_test ) , ]
    
    a = maak_heatmap(h = h , w=w, labels = batch$labels)
    
    b = lees_in(w=w, h=h, files = batch$files)
    
    
    
    acc = sess$run( fout, feed_dict = dict(x = b, labels = a,keep_prob = 1)  )
    
    print(paste('train accuracy:', acc))
    
  }
  
  
  
  
  
  
}




