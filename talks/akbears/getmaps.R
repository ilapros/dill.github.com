## get the maps for the talk
## abstracted here so I can work offline

# Connected to the internet?
connected <- FALSE


mapw <- maph <- 2.5


library(ggplot2)
library(ggmap)

if(connected){

  ## map of the Anchorage area
  p <- ggmap(get_map("Anchorage",zoom=6,maptype="hybrid"))
  p <- p + labs(x="",y="") + theme_nothing()

  # build the overlay box
  overlay <- ggmap(get_map("Alaska",zoom=4,maptype="roadmap"))
  ovbox <- data.frame(x = c(-155,-155,-143,-143,-155),
                      y = c(58,64,64,58,58))
  overlaybox <- geom_path(aes(x=x,y=y),colour="red",data=ovbox)
  p <- p + inset(grob = ggplotGrob(overlay + theme_inset()+overlaybox),
                 xmin = -148, xmax = Inf,
                 ymin = -Inf, ymax = 60.5)

  # outline of the Talkeetna study area
  load("talkeetna-outline.RData")
  talk <- as.data.frame(talkeetna.outline@polygons[[1]]@Polygons[[1]]@coords)
  names(talk) <- c("lon","lat")
  p <- p + geom_polygon(aes(x=lon,y=lat),data=talk,fill="blue",alpha=0.4)

  print(p)

  ggsave("images/ak-talk.png",p,width=mapw,height=maph)
}



## transects

load("~/Dropbox/bears/talkeetna-GMU13E/talkeetna.RData")
p <- ggplot(segments)
p <- p + geom_path(aes(x=x,y=y,group=o.transect,colour=o.transect),size=0.1)
p <- p + labs(x="",y="")
p <- p + coord_equal()
p <- p + theme_minimal()
print(p)
ggsave("images/transects.png",p,width=mapw,height=maph)


## covariates

mapw <- 8
maph <- 5
load("~/Dropbox/bears/talkeetna-GMU13E/pred-grid.RData")

cov.names <- c("aspect","elev","slope","veg.mode","rveg.mode","spawn.dist")
cov.labels <- c("Aspect","Elevation","Slope","Vegetation","Simplified vegetation","Distance to (non-King) salmon spawn")

plot.it <- function(cov,lab){
  gr$x <- gr$x/1000
  gr$y <- gr$y/1000
  gr <- gr[gr$elev <= 1402,]
  p <- ggplot(gr)
  p <- p + geom_tile(aes_string(x="x",y="y",fill=cov))
  p <- p + labs(x="", y="", fill="")
  p <- p + ggtitle(lab)
  p <- p + coord_equal()
  p <- p + theme_minimal()
  print(p)
  ggsave(paste0("images/cov-",cov,".png"),p,width=mapw,height=maph)

  invisible()
}

Map(plot.it,cov.names,cov.labels)


## plot terms and map

wd <- getwd()
setwd("~/Dropbox/bears/talkeetna-GMU13E/")

load("gmu13e.RData")
source("map.R")

p <- bearmap(bl.dsm.nbopt.nv.xy.te)

setwd(wd)

# black bear map
ggsave("images/bl-map.pdf",p,width=10,height=10)

# terms: slope-aspect
png("images/slope-aspect.png", height=700, width=700)
vis.gam(bl.dsm.nbopt.nv.xy.te,view=c("slope","aspect"),plot.type="contour",main="s(slope,aspect,6.037)",contour.col="black")
dev.off()

# terms: elevation
png("images/elevation.png", height=700, width=700)
plot(bl.dsm.nbopt.nv.xy.te,select=2)
dev.off()








