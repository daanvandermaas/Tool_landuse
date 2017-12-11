################################model volledig

############variabelen
w_conv1 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 3L, 64L), stddev=0.1), 'w_conv1')
b_conv1 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv1')  
w_conv2 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv12')
b_conv2 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv2') 
w_conv3 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv3')
b_conv3 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv3')  
w_conv4 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv4')
b_conv4 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv4')  
w_conv5 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv5')
b_conv5 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv5')  
w_conv6 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv6')
b_conv6 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv6')  
w_conv7 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv7')
b_conv7 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv7')  
w_conv8 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv8')
b_conv8 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv8')  
w_conv9 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv9')
b_conv9 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv9')  
w_conv10 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv10')
b_conv10 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv10')  
w_conv11 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv11')
b_conv11 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv11')  
w_conv12 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv12')
b_conv12 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv12')  
w_conv13 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv13')
b_conv13 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv13')  
w_conv14 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv14')
b_conv14 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv14')  
w_conv15 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv15')
b_conv15 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv15')  



w_conv16 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv16')
b_conv16 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv16')  
w_conv17 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_conv17')
b_conv17 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv17')  
w_upconv1 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_upconv1')
b_upconv1 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_upconv1')  


w_conv18 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 128L, 96L), stddev=0.1), 'w_conv18')
b_conv18 <- tf$Variable(tf$truncated_normal(shape(1L, 96L), stddev=0.1), 'b_conv18')  
w_conv19 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 96L, 64L), stddev=0.1), 'w_conv19')
b_conv19 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv19')  
w_upconv2 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_upconv2')
b_upconv2 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_upconv2')  


w_conv20 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 128L, 96L), stddev=0.1), 'w_conv20')
b_conv20 <- tf$Variable(tf$truncated_normal(shape(1L, 96L), stddev=0.1), 'b_conv20')  
w_conv21 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 96L, 64L), stddev=0.1), 'w_conv21')
b_conv21 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv21')  
w_upconv3 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_upconv3')
b_upconv3 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_upconv3')  

w_conv22 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 128L, 96L), stddev=0.1), 'w_conv22')
b_conv22 <- tf$Variable(tf$truncated_normal(shape(1L, 96L), stddev=0.1), 'b_conv22')  
w_conv23 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 96L, 64L), stddev=0.1), 'w_conv23')
b_conv23 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv23')  
w_upconv4 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_upconv4')
b_upconv4 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_upconv4')  

w_conv24 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 128L, 96L), stddev=0.1), 'w_conv24')
b_conv24 <- tf$Variable(tf$truncated_normal(shape(1L, 96L), stddev=0.1), 'b_conv24')  
w_conv25 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 96L, 64L), stddev=0.1), 'w_conv25')
b_conv25 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv25')  
w_upconv5 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 64L), stddev=0.1), 'w_upconv5')
b_upconv5 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_upconv5')  

w_conv26 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 128L, 96L), stddev=0.1), 'w_conv26')
b_conv26 <- tf$Variable(tf$truncated_normal(shape(1L, 96L), stddev=0.1), 'b_conv26')  
w_conv27 <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 96L, 64L), stddev=0.1), 'w_conv27')
b_conv27 <- tf$Variable(tf$truncated_normal(shape(1L, 64L), stddev=0.1), 'b_conv27')  
w_convout <-tf$Variable(tf$truncated_normal(shape(3L, 3L, 64L, 2L), stddev=0.1), 'w_convout')
b_convout <- tf$Variable(tf$truncated_normal(shape(1L, 2L), stddev=0.1), 'b_convout')  




###########de graph

h_conv1 <- tf$nn$relu(  tf$nn$conv2d(x, w_conv1, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv1 )

h_conv2 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv1, w_conv2, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv2 ) )
h_conv3 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv2, w_conv3, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv3 ) )
h_pool1 = tf$nn$max_pool(h_conv3 ,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 


h_conv4 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_pool1, w_conv4, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv4 ) )
h_conv5 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv4, w_conv5, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv5 ) )
h_conv6 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv5, w_conv6, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv6 ) )
h_pool2 = tf$nn$max_pool(h_conv6,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 

h_conv7 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_pool2, w_conv7, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv7 ) )
h_conv8 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv7, w_conv8, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv8 ) )
h_conv9 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv8, w_conv9, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv9 ) )
h_pool3 = tf$nn$max_pool(h_conv9,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 

h_conv10 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_pool3, w_conv10, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv10 ) )
h_conv11 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv10, w_conv11, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv11 ) )
h_conv12 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv11, w_conv12, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv12 ) )
h_pool4 = tf$nn$max_pool(h_conv12,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 

h_conv13 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_pool4, w_conv13, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv13 ) )
h_conv14 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv13, w_conv14, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv14 ) )
h_conv15 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv14, w_conv15, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv15 ) )
h_pool5 = tf$nn$max_pool(h_conv15,     ksize=c(1L, 2L, 2L, 1L),strides=c(1L, 2L, 2L, 1L), padding='SAME') 

h_conv16 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_pool5, w_conv16, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv16 ) )
h_conv17 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv16, w_conv17, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv17 ) )
h_upconv1=   tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d_transpose( h_conv17,  w_upconv1,  output_shape = c(batch_input, 32L,32L, 64L),  strides = c(1L,2L,2L,1L), padding='SAME') + b_upconv1 ))

h_concat1 = tf$concat( list(h_conv14, h_upconv1), axis = 3L)
h_conv18 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_concat1, w_conv18, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv18 ) )
h_conv19 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv18, w_conv19, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv19 ) )
h_upconv2= tf$contrib$layers$batch_norm( tf$nn$relu( tf$nn$conv2d_transpose( h_conv19,  w_upconv2,  output_shape = c(batch_input, 64L,64L, 64L),  strides = c(1L,2L,2L,1L), padding='SAME') + b_upconv2 ))

h_concat2 = tf$concat( list(h_conv11, h_upconv2), axis = 3L)
h_conv20 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_concat2, w_conv20, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv20 ) )
h_conv21 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv20, w_conv21, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv21 ) )
h_upconv3 = tf$contrib$layers$batch_norm( tf$nn$relu( tf$nn$conv2d_transpose( h_conv21,  w_upconv3,  output_shape = c(batch_input, 128L,128L, 64L),  strides = c(1L,2L,2L,1L), padding='SAME') + b_upconv3 ))

h_concat3 = tf$concat( list(h_conv8, h_upconv3), axis = 3L)
h_conv22 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_concat3, w_conv22, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv22 ) )
h_conv23 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv22, w_conv23, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv23 ) )
h_upconv4 = tf$contrib$layers$batch_norm( tf$nn$relu( tf$nn$conv2d_transpose( h_conv23,  w_upconv4,  output_shape = c(batch_input, 256L,256L, 64L),  strides = c(1L,2L,2L,1L), padding='SAME') + b_upconv4 ))

h_concat4 = tf$concat( list(h_conv5, h_upconv4), axis = 3L)
h_conv24 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_concat4, w_conv24, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv24 ) )
h_conv25 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv24, w_conv25, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv25 ) )
h_upconv5 = tf$contrib$layers$batch_norm( tf$nn$relu( tf$nn$conv2d_transpose( h_conv25,  w_upconv5,  output_shape = c(batch_input, 512L,512L, 64L),  strides = c(1L,2L,2L,1L), padding='SAME') + b_upconv5 ))

h_concat5 = tf$concat( list(h_conv2, h_upconv5), axis = 3L)
h_conv26 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_concat5, w_conv26, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv26 ) )
h_conv27 <- tf$contrib$layers$batch_norm(tf$nn$relu(  tf$nn$conv2d(h_conv26, w_conv27, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_conv27 ) )
h_convout <-  tf$sigmoid( tf$nn$conv2d(h_conv27, w_convout, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_convout  )


out_softmax = tf$nn$softmax(h_convout, dim = -1L)