
dir = 'db/resultaat_water'

files = list.files(dir)



for(i in 1:5){
  plaatje = readRDS(paste0(dir, '/plaatjes_', i, '.rds') )
predict = readRDS(paste0(dir, '/predict_', i, '.rds'))
  

predict[predict<0.9] = 0
  display(plaatje)
  display(predict)
  
}