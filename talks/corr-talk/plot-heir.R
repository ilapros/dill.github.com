# plot the hierarchy!


library(rgdal)


# load the data
segs <- readOGR(".","winter_1mi_cells")
segs <- spTransform(segs, CRS("+proj=longlat +ellps=GRS80"))
segs <- readOGR(".","winter_1mi_cells")
segs <- spTransform(segs, CRS("+proj=longlat +ellps=GRS80"))


par(mfrow=c(1,2))

# segment highlight
segs.seg <- segs
segs.seg@plotOrder <- as.integer(18)
plot(segs)
plot(segs.seg,col="red",add=TRUE)
# transect highlight

segs.tr <- segs
segs.tr@plotOrder <- as.integer(16:31)
plot(segs)
plot(segs.tr,col="grey",add=TRUE)
plot(segs.seg,col="red",add=TRUE)

dev.copy2pdf(file="seg-tr.pdf",width=9,height=4)

par(mfrow=c(3,3))


plot(segs)
plot(segs)
plot(segs)

plot(segs)
plot(segs.tr,col="grey",add=TRUE)
plot(segs.seg,col="red",add=TRUE)
plot(segs)
plot(segs)

plot(segs)
plot(segs)
plot(segs)
dev.copy2pdf(file="seg-tr.pdf",width=9,height=9)
