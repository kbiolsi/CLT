
# Text to be placed on the Overview tab
overview<-div(
    br(),
    p("This application is to help you visualize the main implication of the Central Limit Theorem: regardless of the shape of the population distribution, as sample size increases, the sampling distribution of the mean will approach
      a normal distribution."),
    br(),
    p("From the panel on the left you may choose a parent distribution and a sample size."),
    p(strong("Parent distribution:"),"You have the choice of five parent distributions from which the 
      samples will be drawn: uniform, bimodal, skewed, binomial, and normal."),
    p(strong("Sample size:"),"Use the slider bar to select a sample size from 1 to 50."),
    br(),
    p("The",em(strong("Histogram")),"tab displays a histogram for the sampling distribution of the mean based on your selections."),
    p("The",em(strong("Q-Q Plot")),"tab displays a normal quantile-quantile plot for the sampling distribution of the mean based on your selections."),
    p("The",em(strong("Parent Distributions")),"tab provides histograms for the five different 
       parent distributions. These do not change based on your selections but are provided
       to give you a sense of how different these five distributions are in shape."),
    p("The",em(strong("Details")),"tab provides details on the sampling and computations.")
)

# Text to be place on the Details tab
details<-div(br(),"The five parent distributions are each based on 1,000,000 values. These were constructed 
              using runif(), rnorm(), rbinom(), and rgamma(). The bimodal distribution was constructed by 
              concatenating two different normal distributions.",br(),br(),
              "Suppose a sample of size 12 is selected using the slider. Then 5000 samples of 12 values
              are drawn from the selected distribution. (There is nothing magical about the number 5000 - 
              we just want to be sure we are drawing a large number of samples.) For each sample of 12 values, 
              the mean is computed, yielding a total of 5000 means. These means are then used to create the 
              corresponding histogram and q-q plot.",br(),br(),
              "As the sample size increases, the Central Limit Theorem tells us that the resulting distributions 
              of the mean values will tend to become more normal in shape.")



shinyUI(fluidPage(
    titlePanel("Demonstration of the Central Limit Theorem"),
    sidebarLayout(position="left",
                  
                  sidebarPanel( 
                      br(),br(),br(),
                      selectInput("dist",label="Choose the parent distribution",
                                  choices=c("Uniform","Bimodal","Skewed","Binomial","Normal"),
                                  selected="Uniform"),
                      
                      sliderInput("sampSize",label="Sample size",
                                  min=1,max=50,value=1)
                  ),
                  
                  mainPanel(
                      tabsetPanel(
                          tabPanel("Overview", overview),
                          tabPanel("Histogram",br(),"The histogram below represents the sampling distribution of the mean 
                                   based on the distribution and sample size you selected.
                                   The red curve represents a normal distribution with the 
                                   same mean and standard deviation as the sampling distribution of the mean.
                                   The blue curve is a density curve for the histogram. These two curves will
                                   tend to converge as sample size increases.",
                                   plotOutput("hplot")),
                          tabPanel("Q-Q Plot",br(),"In the normal quantile-quantile plot, deviations from a straight line 
                                    indicate deviations from normality. With all of the parent distributions
                                    except the normal, sampling distributions based on very small sample sizes will show large deviations from linearity.",
                                   plotOutput("qqplot")),
                          tabPanel("Parent Distributions",br(),
                                   plotOutput("unifParent"),
                                   plotOutput("bimodParent"),
                                   plotOutput("skewParent"),
                                   plotOutput("binomParent"),
                                   plotOutput("normParent")),
                          tabPanel("Details",details)
                      )
                  )
    )
))