### TACIANA - REGRESSÃO ###
?matrix

N <- 100
rho <- 0
mu1 <- 0; s1 <- 1
mu2 <- 0; s2 <- 1


mu <- c(mu1,mu2) 
sigma <- matrix(c(s1^2, s1*s2*rho, s1*s2*rho, s2^2),2) 
M <- t(chol(sigma))
# M %*% t(M)
Z <- matrix(rnorm(2*N),2,N) 
medias <- matrix(rep(mu,N), byrow=TRUE,ncol=2)
bvn2 <- t(M %*% Z) + medias
colnames(bvn2) <- c("bvn2_X1","bvn2_X2")


plot(bvn2[,1],bvn2[,2],col="royalblue1",pch=20,axes=FALSE,xlab="X1",ylab="X2",ylim=c(-30,30),xlim=c(-30,30))
lines(ellipse(sigma,centre=mu,npoints=N),col="firebrick1",lty=2,lwd=2)
Axis(side=1)
Axis(side=2)
require(ellipse)
plot(ellipse(sigma,centre=mu,npoints=N),col="firebrick1",type="l",lty=2,lwd=2,axes=FALSE,asp=1)
points(bvn2[,1],bvn2[,2],col="royalblue1",pch=20)
Axis(side=1)
Axis(side=2)

### plotly ###
require(MASS)

kd_teste <- kde2d(bvn2[,1],bvn2[,2], n = 100,h=2)
p_teste <- plot_ly(x = kd_teste$x, y = kd_teste$y, z = kd_teste$z) %>% add_trace(type="surface")
print(p_teste)

kd <- with(MASS::geyser, MASS::kde2d(duration, waiting, n = 50))
p <- plot_ly(x = x1, y = x2, z = z) %>% add_surface()

print(p)


###### Grafico Barras #####

data(iris)
attach(iris)
medias <- tapply(Sepal.Width,Species,mean)
desvio <- tapply(Sepal.Width,Species,sd)
centros <- barplot(medias,ylim=c(0,5),col=c("red","green","blue"),density=30,main="Gráfico de Barras") 
arrows(centros,medias-desvio,centros,medias+desvio,angle=90,code=3)
text(centros[1],(medias+desvio)[1]+0.15,"a")
text(centros[2],(medias+desvio)[2]+0.15,"b")
text(centros[3],(medias+desvio)[3]+0.15,"b")


curve(dnorm(x,mean = 27, sd = 3),xlim=c(15,39))
curve(dnorm(x),xlim=c(-3,3))
qnorm(0.0001)

pnorm(30,mean = 27 , sd = 3)-pnorm(20,mean = 27 , sd = 3)

1-pnorm(1)
qnorm(0.2,mean = 21 , sd = 5)
pnorm(27,mean = 21 , sd = 5)-pnorm(18,mean = 21 , sd = 5)



