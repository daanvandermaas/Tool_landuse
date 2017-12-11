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
