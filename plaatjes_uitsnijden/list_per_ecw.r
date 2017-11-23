





list_per_ecw = function( ecw_path, train){
  
  gdal_setInstallation(ignore.full_scan = FALSE)
  

#zoek files
ecw_filenames <- dir(ecw_path, pattern=".ecw")



#creeer een vector met de rd coordinaten van de hoeken van de ecw bestanden
lower_left_x <- vector()
lower_left_y <- vector()
upper_right_x <- vector()
upper_right_y <- vector()

for(i in 1:length(ecw_filenames)){
  
  info <- gdalinfo( file.path(ecw_path, ecw_filenames[i]), raw_output = FALSE)   
  lower_left_x[i] = info$bbox[[1,1]]
  lower_left_y[i] = info$bbox[[2,1]]
  upper_right_x[i] = info$bbox[[1,2]]
  upper_right_y[i] = info$bbox[[2,2]]
}

ecws <- data.frame(file.path(ecw_path, ecw_filenames), lower_left_x, lower_left_y, upper_right_x, upper_right_y)


#split train per ecw bestand
train_list = list()
for(i in 1:nrow(ecws)){
  train_list[[i]] = train[  train$x2  < ecws$upper_right_x[i]  & train$x1 > ecws$lower_left_x[i] & train$y2  < ecws$upper_right_y[i]  & train$y1 > ecws$lower_left_y[i]  ,]
  
  
}

names(train_list) = ecws$file.path.ecw_path..ecw_filenames.


return(train_list)

}
