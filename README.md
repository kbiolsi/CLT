Developing Data Projects project

Demonstration of the Central Limit Theorem


Note: Although the .md file created by RStudio Presenter doesn't show
the code, the charts in the slide presentation were created using the 
following code:

```{r echo=FALSE,fig.height=4.5,fig.width=10}
set.seed(91722)
rn<-rgamma(1000,2.5)
par(mfrow=c(1,2))
hist(rn,prob=TRUE,ylim=c(0,0.3),main="",xlab="")
lines(density(rn),col="blue")
curve(dnorm(x,mean=mean(rn),sd=sd(rn)),add=TRUE,col="red")
qqnorm(rn)
```