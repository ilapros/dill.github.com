# make some plots from the zonation output....

suppressPackageStartupMessages(library(osampuri))
data("uri-lt-data")

gridd <- expand.grid(x=seq(min(pred$x),max(pred$x),by=1.99),
                     y=seq(min(pred$y),max(pred$y),by=2))
D <- as.matrix(dist(rbind(gridd[,c("x","y")],pred[,c("x","y")])))
D <- D[1:nrow(gridd),(nrow(gridd)+1):nrow(D)]
cell.id <- apply(D,2,which.min)

make.spec <- function(filename){
  t.file <- read.table(paste("../new\ results/",filename,sep=""),skip=6)
  mat <-as.matrix(t.file)
  mat[mat==-1] <- NA
  return(mat[cell.id])
}

filenames <- c("z-alcid-preds.asc","z-eider-preds.asc",
               "z-petrel-preds.asc","z-gannet-preds.asc","z-scoter-preds.asc",
               "z-loon-preds.asc","z-tern-preds.asc",
               "z-alcid-cv.asc","z-eider-cv.asc","z-gannet-cv.asc",
               "z-loon-cv.asc","z-petrel-cv.asc",
               "z-scoter-cv.asc","z-tern-cv.asc",
               "gchl_winter","distancelandkm","gchl_fall","depthm",
               "phimedian","roughness","gchl_summer","gchl_spring")
namess <- c(rep(NA,14),
            "Geometric\nmean winter\nChlorophyll a",
            "Distance\nfrom land",
            "Geometric\nmean fall\nChlorophyll a",
            "Depth","Sediment\ngrain size","Bottom\nroughness",
            "Geometric\nmean summer\nChlorophyll a",
            "Geometric\nmean spring\nChlorophyll a")

model.type <- c(c("N","P(Presence)")[c(1,2,1,1,2,1,1)],rep("CV",7),rep("cov",8))
i<-1
# build the data to plot
pred2<-c()
for(this.file in filenames){

  if(model.type[i] %in% c("N","P(Presence)","CV")){
    pred2 <- cbind(pred,N=make.spec(this.file))
  }else{
    pred2 <- cbind(pred,N=pred[[this.file]])
  }

  pred2 <- pred2[!is.na(pred2$N),]

  p <- ggplot(pred2)
  p <- p + geom_tile(aes(x=x,y=y,fill=N,height=2,width=2))
  p.opts.geo <- theme(panel.grid.major=element_blank(),
                      panel.grid.minor=element_blank(),
                      panel.background=element_blank(),
                      strip.background=element_blank(),
                      legend.key=element_blank(),
                      aspect.ratio=1
                     )
  p <- p + p.opts.geo
  p <- p + geom_polygon(aes(x=x,y=y,group=group),
                        colour="black",fill=NA,data=coast)
  xlims <- c(min(pred$x)-2,max(pred$x)+2)
  ylims <- c(min(pred$y)-2,max(pred$y)+2)
  p <- p + coord_equal(xlim = xlims,ylim = ylims)
  if(model.type[i] %in% "N"){
    p <- p + scale_fill_gradient(low="white",high="black",
                                 limits=c(0,max(pred2$N)),trans="sqrt")
  }else if(model.type[i] %in% c("cov","CV")){
    p <- p + scale_fill_gradient(low="white",high="black",
                              limits=c(min(pred2$N),max(pred2$N)))
  }else{
    p <- p + scale_fill_gradient(low="white",high="black",limits=c(0,1))
  }

  if(model.type[i] == "cov"){
    p <- p + labs(fill=namess[i])
  }else{
    p <- p + labs(fill=model.type[i])
  }

  print(p)

  ggsave(paste0("plot-",gsub("z-(\\w+)-(\\w+).asc","\\1-\\2",this.file),".png"),
          width=5,height=5)
  i <- i+1
}



