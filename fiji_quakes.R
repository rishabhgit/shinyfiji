library(datasets)
library(googleVis)
data(quakes)


near.quake <- function(ilat, ilong)
{
  dist <- mapply(earth.dist, quakes$long, quakes$lat, ilong, ilat, SIMPLIFY = TRUE)
  min_dist <- c(min(dist), which.min(dist))
  
}



# Calculate distance in kilometers between two points
earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(round(d, digits=2))
}