#lees random plaatjes in
batch_test = 1
dir_out = 'db/resultaat/plaatjes'

batch = test[ sample(c(1:length(test)), size = batch_test ) ]


plaatjes = lees_in(images = batch, w = w, klassen = klassen, dir_images = dir_images, dir_labels = dir_labels)[[1]]

prediction = sess$run(out_softmax, feed_dict = dict(x = plaatjes, keep_prob = 1))

for(i in 1:dim(prediction)[1]){
saveRDS(plaatjes[i,,,],  paste0(dir_out, '_', i, '.rds') )
  saveRDS(prediction[i,,,1],  paste0(dir_out, '_', i, '.rds') ) 
}

