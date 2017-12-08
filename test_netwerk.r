#lees random plaatjes in
batch_test = 10

batch = test[ sample(c(1:length(test)), size = batch_test ) ]


plaatjes = lees_in(images = batch, w = w, klassen = klassen, dir_images = dir_images, dir_labels = dir_labels)[[1]]

prediction = sess$run(out_softmax, feed_dict = dict(x = plaatjes, keep_prob = 1))

for(i in 1:dim(prediction)[1]){
saveRDS(plaatjes[i,,,],  paste0('db/resultaat/plaatjes_', i, '.rds') )
  saveRDS(prediction[i,,,1],  paste0('db/resultaat/predict_', i, '.rds') ) 
}

for(i in 1:3){
  display(plaatjes[i,,,])
  display(prediction[i,,,1])
}