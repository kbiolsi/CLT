set.seed(816213)  # Set a seed to maintain consistency in the parent distributions

# Each of the four parent distributions is based on 1,000,000 values

# Normally distributed parent distribution
normParent<-rnorm(1000000)
normParent<-(normParent-mean(normParent))/sd(normParent) 

# Uniform parent distribution
unifParent<-runif(1000000)

# Bimodal parent distribution (concatenation of two different normal distributions)
d1<-rnorm(300000,m=0,sd=1)
d2<-rnorm(700000,m=5,sd=1)
d3<-c(d1,d2)
bimodParent<-(d3-mean(d3))/sd(d3) # Transform to have mean of 0 and standard deviation of 1

# Skewed parent distribution
skewParent<-rgamma(1000000,2.5)

# Binomial parent distribution
binomParent<-rbinom(1000000,1,0.5)

# Number of samples used to estimate sampling distributions
numSamples = 5000


shinyServer(function(input, output) {
    data <-reactive({
        dist<-switch(input$dist,
                     'Normal'  = normParent,
                     'Uniform' = unifParent,
                     'Bimodal' = bimodParent,
                     'Binomial'= binomParent,
                     'Skewed'  = skewParent)

        allSamp<-sample(dist,size=numSamples*input$sampSize,replace=TRUE)
        allSamp<-matrix(allSamp,input$sampSize)
        mnDist<-apply(allSamp,2,mean)
    })
    
    output$hplot<-renderPlot({
       hist(data(),breaks=100,xlab="",
            main=paste(input$dist,"parent distribution, sample size =",input$sampSize),prob=TRUE)
       lines(density(data()),col="blue")
       curve(dnorm(x,mean=mean(data()),sd=sd(data())),add=TRUE,col="red")
               
    })
    
    output$qqplot<-renderPlot({
        qqnorm(data(),main=paste(input$dist,"parent distribution, sample size =",input$sampSize))
    })
    
    output$unifParent<-renderPlot({
        hist(unifParent,breaks=100,main="Uniform parent distribution",xlab="",xlim=c(0,1))
    })
    output$bimodParent<-renderPlot({
        hist(bimodParent,breaks=100,main="Bimodal parent distribution",xlab="")
    })
    output$skewParent<-renderPlot({
        hist(skewParent,breaks=100,main="Skewed parent distribution",xlab="")
    })
    output$binomParent<-renderPlot({
        hist(binomParent,main="Binomial parent distribution",xlab="")
    })    
    output$normParent<-renderPlot({
        hist(normParent,breaks=100,main="Normal parent distribution",xlab="")
    })
})