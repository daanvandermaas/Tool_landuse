source('lib.r')


#########Maak raster van upper right en lower left coordinaten
source('maak_raster.r')

c1 = c(0.000,300000.000)
c2 = c( 300000.000 , 620000.000 )
step_large = 25000
step_small = 51.2



raster = maak_raster(c1= c1, c2 = c2, step = step_large)
saveRDS(raster, file = "f:/output/raster.rds")
for(n in 1:nrow(raster)){
  coordinaten = maak_raster(c1=c(raster$x1[n], raster$y1[n]), c2 = c(raster$x2[n], raster$y2[n]), step = step_small)
  dir.create(file.path('f:/output/', n))
  
  
  ########################################################
  ########################################################### Dit runt op windows server
  
  ####Maak een list van deze coordinaten per ecw file
  source('list_per_ecw.r')
  
  ecw_path = "f:/Ortho/Blokken_Ecw"
  
  coordinaten_list = list_per_ecw(train = coordinaten, ecw_path = ecw_path)
  
 
  
  ######### Sla alle plaatjes in de list van coordinaten op als gtiff
  source('lees_in.r')
  pix = 512
  dir = paste0("f:/output/", n,'/')
  lees_in(pix = pix , train_list = coordinaten_list , dir= dir )
}





