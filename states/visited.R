# states I have visited...

library(mapdata)


# colour in the ones I've been to
gotem <- c(
#           "alabama",
#           "arizona",
           "arkansas",
           "california",
           "colorado"   ,
           "connecticut"                    ,
#           "delaware"   ,
           "district of columbia",
           "florida",
           "georgia"                        ,
#           "idaho"      ,
           "illinois",
           "indiana",
#           "iowa"                           ,
#           "kansas",
#           "kentucky",
           "louisiana",
           "maine"                          ,
           "maryland",
           "massachusetts:martha's vineyard",
           "massachusetts:main",
           "massachusetts:nantucket",
           "michigan:north"        ,
           "michigan:south"                 ,
#           "minnesota"            ,
           "mississippi"                    ,
#           "missouri"        ,
#           "montana"                        ,
#           "nebraska"             ,
           "nevada"                         ,
           "new hampshire"            ,
           "new jersey"                     ,
#           "new mexico"                 ,
           "new york:manhattan"             ,
           "new york:main"       ,
           "new york:staten island"         ,
           "new york:long island"       ,
           "north carolina:knotts"          ,
           "north carolina:main"     ,
           "north carolina:spit"            ,
#           "north dakota"           ,
           "ohio"                           ,
#           "oklahoma"         ,
           "oregon"                         ,
           "pennsylvania",
           "rhode island",
           "south carolina"     ,
#           "south dakota"                   ,
           "tennessee"          ,
           "texas"                          ,
           "utah"         ,
#           "vermont"                        ,
           "virginia:chesapeake"        ,
           "virginia:chincoteague"          ,
           "virginia:main"         ,
           "washington:san juan island"     ,
           "washington:lopez island"      ,
           "washington:orcas island"        ,
           "washington:whidbey island"    ,
           "washington:main"                ,
#           "west virginia"      ,
#           "wisconsin"                      ,
#           "wyoming"                        ,
NA
          )

got_count <- length(unique(sub("(\\w+):.*","\\1", gotem[!is.na(gotem)])))
cat("visited: ", got_count, "\n\n")


# add in alaska
#ak <- map("world2Hires",region="usa:Alaska",plot=FALSE)
ak <- maps:::map.poly("world2",region="usa:Alaska",as.polygon=TRUE)
# centre on 0,0
ak$x <- ak$x-mean(ak$x,na.rm=TRUE)
ak$y <- ak$y-mean(ak$y,na.rm=TRUE)
contr <- 0.5 # make it smaller
ak$x <- (ak$x*contr-110)
ak$y <- (ak$y*contr+20)

# colour the ones I've been through
#been <- c("Delaware"
#         )


# open the device
png("states.png",600,400)

# plot everything
plot(c(-130,-65),c(15,50),type="n",asp=1,axes=FALSE,xlab="",ylab="")
map("state",add=TRUE)
polygon(ak$x,ak$y,border=FALSE,col="red")
lines(ak$x,ak$y)

map("state",regions=gotem,add=T,fill=TRUE,col="red")

#map("state",regions=been,add=T,fill=TRUE,col="blue")

#legend(-95,25,c("visited","travelled through\n (train/airport)"),c("red","blue"),bty="n")

dev.off()


