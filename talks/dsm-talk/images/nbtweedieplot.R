# example Tweedie and negative binomial densities
library(tweedie)
library(RColorBrewer)

# tweedie
y<-seq(0.01,5,by=0.01)
pows <- seq(1.2, 1.9, by=0.1)

fymat <- matrix(NA, length(y), length(pows))

i <- 1
for(pow in pows){
  fymat[,i] <- dtweedie( y=y, power=pow, mu=2, phi=1)
  i <- i+1
}

png(file="nbtweedied.png", width=800, height=400)

par(mfrow=c(1,2))
plot(range(y), range(fymat), type="n", ylab="Density", xlab="x", cex.lab=1.5,
     main="Tweedie")

rr <- brewer.pal(8,"Dark2")

for(i in 1:ncol(fymat)){
  lines(y, fymat[,i], type="l", col=rr[i], lwd=2)
}


# negbin


y<-seq(1,12,by=1)
disps <- seq(0.001, 1, len=10)

fymat <- matrix(NA, length(y), length(disps))

i <- 1
for(disp in disps){
  fymat[,i] <- dnbinom(y, size=disp, mu=5)
  i <- i+1
}

plot(range(y), range(fymat), type="n", ylab="Density", xlab="x", cex.lab=1.5,
     main="Negative binomial")

rr <- brewer.pal(8,"Dark2")

for(i in 1:ncol(fymat)){
  lines(y, fymat[,i], type="l", col=rr[i], lwd=2)
}


dev.off()
