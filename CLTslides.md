Demonstration of the Central Limit Theorem
========================================================
author: KJB
date: February, 2016

Description
========================================================

The Central Limit Theorem (CLT) in statistics tells us that as sample size increases, the sampling distribution of the mean will approach the normal distribution. This is true even when sampling from populations whose distributions deviate markedly from normality.
 
The workings and implications of the CLT are often difficult for learners of statistics to understand. This application allows users to sample from distributions of various shapes, manipulate sample size, and observe how sample size affects the sampling distribution of the mean. 

Distributions and Sample Size
========================================================

Five very different distributions from which to sample are offered as options: 
- uniform
- bimodal
- skewed
- binomial
- normal 

The user may also specify any sample size from 1 to 50.

Histogram and Normal QQ-Plot
========================================================

A histogram of the sampling distribution of the mean for the selected distribution and sample size is constructed. In addition, a normal curve and a density curve for the histogram are superimposed on the graph. A normal quantile-quantile plot is also constructed to give a sense of how much the distribution deviates from normality.

![plot of chunk unnamed-chunk-1](CLTslides-figure/unnamed-chunk-1-1.png)

Try out the application now
========================================================

See the application in action at http://kbiolsi.shinyapps.io/CentralLimitTheorem/

The ui.R and server.R files may be found at http://github.com/kbiolsi/CLT
