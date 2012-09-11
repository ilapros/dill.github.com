# states I have visited...

library(mapdata)


# colour in the ones I've been to
gotem <- c(
#           "alabama",
#           "arizona",
#           "arkansas",
           "california",
#           "colorado"   ,
#           "connecticut"                    ,
#           "delaware"   ,
           "district of columbia",
           "florida",
#           "georgia"                        ,
#           "idaho"      ,
           "illinois",
           "indiana",
#           "iowa"                           ,
#           "kansas",
#           "kentucky",
#           "louisiana",
           "maine"                          ,
           "maryland",
           "massachusetts:martha's vineyard",
           "massachusetts:main",
           "massachusetts:nantucket",
#           "michigan:north"        ,
#           "michigan:south"                 ,
#           "minnesota"            ,
#           "mississippi"                    ,
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
#           "north carolina:knotts"          ,
#           "north carolina:main"     ,
#           "north carolina:spit"            ,
#           "north dakota"           ,
#           "ohio"                           ,
#           "oklahoma"         ,
#           "oregon"                         ,
           "pennsylvania",
           "rhode island",
#           "south carolina"     ,
#           "south dakota"                   ,
#           "tennessee"          ,
#           "texas"                          ,
#           "utah"         ,
#           "vermont"                        ,
#           "virginia:chesapeake"        ,
#           "virginia:chincoteague"          ,
#           "virginia:main"         ,
#           "washington:san juan island"     ,
#           "washington:lopez island"      ,
#           "washington:orcas island"        ,
#           "washington:whidbey island"    ,
#           "washington:main"                ,
#           "west virginia"      ,
#           "wisconsin"                      ,
#           "wyoming"                        ,
NA
          )

# colour the ones I've been through
been <- c("Connecticut",
          "Delaware"
         )


# open the device
png("states.png",600,400)

# plot everything
map("state")

map("state",regions=gotem,add=T,fill=TRUE,col="red")

map("state",regions=been,add=T,fill=TRUE,col="blue")


dev.off()


