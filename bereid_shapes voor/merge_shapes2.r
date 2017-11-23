library(rgdal)
dir_shapes = '/windows_share/shapes'




shape = readOGR(dir_shapes, layer = "functioneelgebied")
shape$class = shape$plus.type
shape$cat = 'functioneelgebied'
shape@data = data.frame('id' = shape@data[,1] , 'cat'= shape$cat , 'class' = shape$class)
writeOGR(shape, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "functioneelgebied")


shape2 = readOGR("/flashblade/other/bgt_shapes/bgt_begroeidterreindeel" )
shape2$class = shape2$class
shape2$cat = 'begroeidterreindeel'
shape2@data = data.frame('id' = shape2@data[,1] , 'cat'= shape2$cat , 'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shape2, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "begroeidterreindeel")






shape2 = readOGR("/flashblade/other/bgt_shapes/bgt_onbegroeidterreindeel")
shape2$class = shape2$bgt.fysiek
shape2$cat = 'onbegroeidterreindeel'
shape2@data = data.frame('id' = shape2@data[,1] , 'cat'= shape2$cat , 'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shape2, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "onbegroeidterreindeel")






shape2 = readOGR("/flashblade/other/bgt_shapes/bgt_waterdeel" )
shape2$class = shape2$class
shape2$cat = 'waterdeel'
shape2@data = data.frame('id' = shape2@data[,1] ,  'cat'= shape2$cat ,  'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shape2, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "waterdeel")





shape2 = readOGR("/flashblade/other/bgt_shapes/bgt_ondersteunendwegdeel"  )
shape2$class = shape2$function.
shape2$cat = 'ondersteunendwegdeel'
shape2@data = data.frame('id' = shape2@data[,1] , 'cat'= shape2$cat , 'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shape2, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "ondersteunendwegdeel")


shape2 = readOGR("/flashblade/other/bgt_shapes/bgt_overbruggingsdeel"  )
shape2$class = shape2$class
shape2$cat = 'overbruggingsdeel'
shape2@data = data.frame('id' = shape2@data[,1] , 'cat'= shape2$cat , 'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shape2, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "overbruggingsdeel")









shape2 = readOGR("/flashblade/other/bgt_shapes/bgt_overigbouwwerk"  )
shape2$class = shape2$bgt.type
shape2$cat ='overigbouwerk'
shape2@data = data.frame('id' = shape2@data[,1] , 'cat'= shape2$cat , 'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shape2, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "overbruggingsbouwwerk")







shape2 = readOGR("/flashblade/other/bgt_shapes/bgt_wegdeel"    )
shape2$class = shape2$function.
shape2$cat = 'wegdeel'
shape2@data = data.frame('id' = shape2@data[,1] , 'cat'= shape2$cat , 'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shape2, '/flashblade/Tool_landuse/shapes', driver = 'ESRI Shapefile', layer = "wegdeel")





##############moet nog verandert worden
shape2 = readOGR(dir_shapes  )
shape2$class = 'pand'
shape2$cat = 'pand'
shape2@data = data.frame('id' = shape2@data[,1] , 'cat'= shape2$cat , 'class' = shape2$class)
shape2@proj4string =  shape@proj4string
writeOGR(shapes, '/windows_share/shapes' , driver = 'ESRI Shapefile', layer = "pand")