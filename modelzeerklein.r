############variabelen
w_out1 <- tf$Variable(tf$truncated_normal(shape(1L, 1L,   3L, 16L), stddev=0.1), 'w_out1')
b_out1 <- tf$Variable(tf$truncated_normal(shape(1L, 16L), stddev=0.1), 'b_out1')  
w_out2 <- tf$Variable(tf$truncated_normal(shape(1L, 1L,   16L, clas), stddev=0.1), 'w_out2')
b_out2 <- tf$Variable(tf$truncated_normal(shape(1L, clas), stddev=0.1), 'b_out2')  
#################







###################### De graph
out1 =   tf$nn$conv2d(x, w_out1, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_out1 
out2 =   tf$nn$conv2d(out1 , w_out2, strides=c(1L, 1L, 1L, 1L), padding='SAME') + b_out2 
out_softmax = tf$nn$softmax(out2, dim = -1L)
################
