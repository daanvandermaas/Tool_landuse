



maak_raster = function(c1, c2, step){





numx =  floor((c2[1] - c1[1]) /step ) 
numy = floor((c2[2] - c1[2]) /step ) 


coordinaten = data.frame( 'x1' =  c1[1] + c(0: numx ) *step  )

coordinaten$freq = numy +1
coordinaten = expandRows(coordinaten, 'freq')
coordinaten$y1 = c1[2] + c(0:numy ) *step

coordinaten$x2 = coordinaten$x1 + step
coordinaten$y2 = coordinaten$y1 + step

return(coordinaten)
}