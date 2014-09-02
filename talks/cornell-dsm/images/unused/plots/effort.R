# make some plots from the zonation output....

suppressPackageStartupMessages(library(osampuri))
data("uri-lt-data")

p.opts.geo <- theme(panel.grid.major=element_blank(),
                    panel.grid.minor=element_blank(),
                    panel.background=element_blank(),
                    strip.background=element_blank(),
                    legend.key=element_blank(),
                    aspect.ratio=1
                   )

p <- ggplot(seg)

p <- p + geom_segment(aes(x=tx,y=ty,xend=bx,yend=by))
p <- p + p.opts.geo
p <- p + geom_polygon(aes(x=x,y=y,group=group),
                      colour="black",fill=NA,data=coast)
xlims <- c(min(pred$x)-2,max(pred$x)+2)
ylims <- c(min(pred$y)-2,max(pred$y)+2)
p <- p + coord_equal(xlim = xlims,ylim = ylims)
p <- p + labs(x="x",y="y")
print(p)

ggsave("effort.png",width=5,height=5)



