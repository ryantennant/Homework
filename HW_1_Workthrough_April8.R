t<-1:5

t <- 1:5
t
N <- c(100,158,315,398,794)


log.N <- log(N)

plot (log.N~t, typ='b')
L is for line, b is for both line and point

If you cant figure something out use google to find a message board that will help with R
R-bloggers is a good website - Ashkan

Use lm to estimate the slope

lm(log.N~t)

lm(log.N~t)$coefficients[2]

if you want just the coefficients use $coefficients where 1 represents the intercept
because it is the first coefficent and 2 gives the t or second coefficient.

^this was how to do question 6


?lm

model<- lm(log.N~t)
model

## Number 7
## First we need to simulate the model

copy paste from the given function on github
exp.growth <- function(t, y, p) {
  N <- y[1]
  with(as.list(p), {
    dN.dt <- r * N
    return(list(dN.dt))
  })
}

Remember to highlight the whole function before executing... durrrr

p<-('r'=0.25)
y0<-c('N'=1)
t<-1:100

library(deSolve)

## simulate the model

sim<-ode
ode means ordinary differential equation

sim <- ode(y=y0, times=t,func=exp.growth, parms=p, method='lsoda')

view(sim)
sim<- as.data.frame(sim)

view(sim)

p.2<-c('r'=0.8)

sim.2 <- ode(y=y0, times=t,func=exp.growth, parms=p.2, method='lsoda')

sim.2<- as.data.frame(sim.2)

p.3<-c('r'=.027)

sim.3 <- ode(y=y0, times=t,func=exp.growth, parms=p.3, method='lsoda')

sim.3<- as.data.frame(sim.3)

## lets plot these on the same figure

plot(N~time, data= sim, type='l',col='red',ylim=c(0,1e12),xlim=c(0,300))

points(N~time,data=sim.2, type='l',col='purple')

points(N~time,data=sim.3, type='l',col='yellow')
