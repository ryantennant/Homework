install.packages('deSolve')
library(deSolve)
comp <- function(t, y, p) {
  N1 <- y[1]
  N2 <- y[2]
  with(as.list(p), {
    dN1.dt <- (r1 * N1 / K1) * (K1 - N1 - a12 * N2)
    dN2.dt <- (r2 * N2 / K2) * (K2 - N2 - a21 * N1)
    return(list(c(dN1.dt , dN2.dt)))
  })
}

## define model input
t<- 1:100
y0 <- c('N1'=0.1,'N2'=0.1)
p <- c('r1' = 0.1, 'r2' = 0.1, 
       'K1' = 1.05, 'K2'= 0.8,
       'a12'= 0.5, 'a21'= 0.2)

sim <- ode(y=y0, times = t, func = comp, parms=p, method='lsoda')

sim<-as.data.frame(sim)

plot(N1 ~ time, type ='l', col = 'blue', bty = 'l', data = sim)
points( N2 ~ time, type = 'l', lty=2, data= sim)

##
t<- 1:100
y0 <- c('N1'=0.1,'N2'=0.1)
p <- c('r1' = 0.3, 'r2' = 0.1, 
       'K1' = .75, 'K2'= .4,
       'a12'= 0.5, 'a21'= 0.5)

sim <- ode(y=y0, times = t, func = comp, parms=p, method='lsoda')

sim<-as.data.frame(sim)

plot(N1 ~ time, type ='l', col = 'blue', bty = 'l', data = sim)
points( N2 ~ time, type = 'l', lty=2, data= sim)

