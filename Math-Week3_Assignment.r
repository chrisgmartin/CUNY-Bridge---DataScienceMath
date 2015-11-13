CHAPTER 7 QUESTIONS 1-10
1. If scores are normally distributed with a mean of 35 and a standard deviation of 10, what percent of scores is:
  a. greater than 34?
  b. smaller than 42?
  c. between 28 and 34?
#a greater than 34 (pnorm is =< 35)
1 - pnorm(34, mean=35, sd=10)

#b smaller than 42
pnorm(42, mean=35, sd=10)

#c between 28 and 34
pnorm(34, mean=35, sd=10) - pnorm(28, mean=35, sd=10)



2. What are the mean and standard deviation of the standard normal distribution?
(b) What would be the mean and standard deviation of a distribution created by
multiplying the standard normal distribution by 8 and then adding 75?
#a mean and standard devation
mean = E[x] = the expected value of a probabilty function
mean = sum of all expectations weighted by their probabilities = x(n)*p(n)
standard deviation = the square-root of the variance of the distribution = sqrt(variance)
standard deviation = sqrt(sum(x(n)-mean)^2/n)

#b mean and standard distribution created by multiplying the standard normal distribution by 8 and adding 75
Multiplying the distribution would cause an expansion of the distribution by 8 times and increased standard deviation of the mean by 8 times.
Adding 75 would simply shift the distribution by 75 to the right (so a mean of 5 would then be a mean of 40 (5*8) and then a mean of 115 (40+75)).



3. The normal distribution is defied by two parameters. What are they?
#Q3
Mean and standard deviation



4. What proportion of a normal distribution is within one standard deviation of the
mean? (b) What proportion is more than 2.0 standard deviations from the mean?
(c) What proportion is between 1.25 and 2.1 standard deviations above the mean?
#a
68% of the distribution is within one standard devation from the mean.

#b
95.4% of the distribution is within two standard devations from the mean.

#c
8.78% of the distribution is within two standard devations from the mean.
(source: http://onlinestatbook.com/2/calculators/normal.html)



5. A test is normally distributed with a mean of 70 and a standard deviation of 8.
(a) What score would be needed to be in the 85th percentile? (b) What score
would be needed to be in the 22nd percentile?
x <- rnorm(100, mean=70,sd=8)
#a
quantile(x, probs = c(85)/100)
# 78.92112

#b
quantile(x, probs = c(85)/100)
#64.4845



6. Assume a normal distribution with a mean of 70 and a standard deviation of 12.
What limits would include the middle 65% of the cases?
#Q6
(100-65)/2 = 17.5
100-17.5 = 82.5
x <- rnorm(100, mean=70,sd=12)
limits <- (quantile(x, probs = c(82.5)/100) - quantile(x, probs = c(17.5)/100))/100
c(70-(12*(1+limits)),70+(12*(1+limits)))
#55.15919, 84.84081



7. A normal distribution has a mean of 20 and a standard deviation of 4. Find the Z
scores for the following numbers: (a) 28 (b) 18 (c) 10 (d) 23
#a
(28-20)/4

#b
(18-20)/4

#c
(10-20)/4

#d
(23-20)/4



8. Assume the speed of vehicles along a stretch of I-10 has an approximately
normal distribution with a mean of 71 mph and a standard deviation of 8 mph.
a. The current speed limit is 65 mph. What is the proportion of vehicles less than
or equal to the speed limit?
b. What proportion of the vehicles would be going less than 50 mph?
c. A new speed limit will be initiated such that approximately 10% of vehicles
will be over the speed limit. What is the new speed limit based on this criterion?
d. In what way do you think the actual distribution of speeds differs from a
normal distribution?
#a
pnorm(65, mean = 71, sd = 8)

#b
pnorm(50, mean = 71, sd = 8)

#c
qnorm(.90, mean = 71, sd = 8)

#d
From observation, I believe the actual distribution of speeds is negatively skewed and with a high kurtosis,
in that the mean is lower than the median and the distribution is more concentrated in the center.
I think more people are speeding than not (negatively skewed) and the speed will be tightly concentrated (higher peaked, low standard deviation).



9. A variable is normally distributed with a mean of 120 and a standard deviation
of 5. One score is randomly sampled. What is the probability it is above 127?
1 - pnorm(127, mean = 120, sd = 5)


10. You want to use the normal distribution to approximate the binomial
distribution. Explain what you need to do to find the probability of obtaining
exactly 7 heads out of 12 flips.
Since P(x=7)=0, you would need to find P(6.5<x<7.5)
pbinom(7.5,size=12,prob=0.5) - pbinom(6.5,size=12,prob=0.5) = dbinom(7, size = 12, prob = 0.5)





CHAPTER 9 QUESTIONS 6-15
6. If the correlation between reading achievement and math achievement in the
population of fifth graders were 0.60, what would be the probability that in a
sample of 28 students, the sample correlation coefficient would be greater than
0.65?
#calculate z value
zprimes1 <- (.5*(log((1+.6)/(1-.60))))
zprimes2 <- (.5*(log((1+.65)/(1-.65))))
z <- (zprimes1 - zprimes2)/(1/sqrt(28-3))
pnorm(z)
#0.3406251



7. If numerous samples of N = 15 are taken from a uniform distribution and a
relative frequency distribution of the means is drawn, what would be the shape of
the frequency distribution?
#Q7
The shape will approach a normal distribution curve.



8. A normal distribution has a mean of 20 and a standard deviation of 10. Two
scores are sampled randomly from the distribution and the second score is
subtracted from the first. What is the probability that the difference score will be
greater than 5? Hint: Read the Variance Sum Law section of Chapter 3.
#Q8
stderror <- sqrt((10^2)/2)
pnorm(5, mean = 0, sd = stderror, lower.tail = FALSE) + pnorm(-5, mean = 0, sd = stderror)
#.4795001



9. What is the shape of the sampling distribution of r? In what way does the shape
depend on the size of the population correlation?
#Q9
The sampling distribution of r is slightly negatively skewed.
With higher population correlation, the skew increases.



10. If you sample one number from a standard normal distribution, what is the
probability it will be 0.5?
#Q10
mean <- 0
std <- 1
stderror <- sqrt((1^2)/1)
dnorm(0.5, mean = mean, sd = std)
#0.3520653



11. A variable is normally distributed with a mean of 120 and a standard deviation
of 5. Four scores are randomly sampled. What is the probability that the mean
of the four scores is above 127?
#Q11
stderror <- sqrt((5^2)/4)
pnorm(127, mean = 120, sd = stderror, lower.tail = FALSE)
#0.00255513



12. The correlation between self-esteem and extraversion is .30. A sample of 84 is
taken. a. What is the probability that the correlation will be less than 0.10? b.
What is the probability that the correlation will be greater than 0.25?
#12
corr1 <- .3
zvalue1 <- .5 * log((1+.3)/(1-.3))
stderror <- 1 / sqrt(84-3)
#a
corr2 <- .1
zvalue2 <- .5 * log((1+.1)/(1-.1))
pnorm(zvalue2, mean = zvalue1, sd = stderror)
#0.02987334

#b
corr3 <- .25
zvalue3 <- .5 * log((1+.25)/(1-.25))
pnorm(zvalue3, mean = zvalue1, sd = stderror, lower.tail = FALSE)
#0.6868571



13. The mean GPA for students in School A is 3.0; the mean GPA for students in
School B is 2.8. The standard deviation in both schools is 0.25. The GPAs of
both schools are normally distributed. If 9 students are randomly sampled from
each school, what is the probability that:
  a. the sample mean for School A will exceed that of School B by 0.5 or more?
b. the sample mean for School B will be greater than the sample mean for
School A?
#Q13
meanA <- 3
meanB <- 2.8
meandiff <- meanA - meanB
stddev <- .25
stderror <- sqrt(2 * ((.25^2)/9))
#a
pnorm(.5, mean = meandiff, sd = stderror, lower.tail = FALSE)
#0.005454749

#b
pnorm(0, mean = meandiff, sd = stderror, lower.tail = FALSE)
#0.955157



14. In a city, 70% of the people prefer Candidate A. Suppose 30 people from this
city were sampled.
a. What is the mean of the sampling distribution of p?
b. What is the standard error of p?
c. What is the probability that 80% or more of this sample will prefer
Candidate A?
#a
mean <- .7

#b
stderror <- sqrt((.7 * sqrt(1-.7)/30))
#0.1130495

#c
pnorm(0.8, mean = .7, sd = stderror, lower.tail = FALSE)
#0.1881948



15. When solving problems where you need the sampling distribution of r, what is
the reason for converting from r to z'?
#Q15
Using "z'" changes the negative skew of the distribution of r to a normal distribution.





CHAPTER 10 QUESTIONS 10-18
10. The effectiveness of a blood-pressure drug is being investigated. How might an
experimenter demonstrate that, on average, the reduction in systolic blood
pressure is 20 or more?
The experimenter would likely measure two groups of individuals, a sample group and a control group.
They would create a baseline by measuring blood pressure often before giving the drug to the sample group
but also make sure the two groups are seperated so that the results of the initial blood
pressure exams were as close to normal as possible (creating fairness of the results, removing
any potential bias such as a group of obese patients in one group or the other).
After the drug is administered and a reasonable amount of time passed for the drug to run its course,
the experimenter would re-examine both groups, analyse with an appropriate confidence interval (i.e. 95%)
and evaluate the results against their initial hypothesis.



11. A population is known to be normally distributed with a standard deviation of
2.8. (a) Compute the 95% confidence interval on the mean based on the
following sample of nine: 8, 9, 10, 13, 14, 16, 17, 20, 21. (b) Now compute the
99% confidence interval using the same data.
stddev <- 2.8
sample <- c(8, 9, 10, 13, 14, 16, 17, 20, 21)
#a
samplemean <- sum(sample)/length(sample)
#mean = 14.2222
stderror <- 2.8/sqrt(length(sample))
#stderror = 0.9333
confidence <- ((samplemean - (1.96 * stderror)) - (samplemean + (1.96 * stderror)))/2
#95% confidence range is between +- 1.82933 of the mean
crange <- c(samplemean+confidence, samplemean-confidence)
#confidence range = 12.39289, 16.05156

#b
confidence2 <- ((samplemean - (2.58 * stderror)) - (samplemean + (2.58 * stderror)))/2
#99% confidence range is between +- 2.408 of the mean
crange <- c(samplemean+confidence2, samplemean-confidence2)
crange
#confidence range = 11.81422 16.63022



12. A person claims to be able to predict the outcome of flipping a coin. This
person is correct 16/25 times. Compute the 95% confidence interval on the
proportion of times this person can predict coin flips correctly. What
conclusion can you draw about this test of his ability to predict the future?
#Q12
samplemean <- 16/25
#samplemean = 0.64
stderror <- sqrt((samplemean * (1-samplemean))/25)
#stddev = 0.096
confidence <- ((samplemean - (1.96 * stderror)) - (samplemean + (1.96 * stderror)))/2
crange <- c(samplemean+confidence, samplemean-confidence)
#confidence range = 0.45184 0.82816
Since this person can predict future of coin flips, with 95% confidence,
between '45.184%' and '82.816%' of the time, and the binomial prediction would be '50%',
the person most likely has a better than average ability.



13. What does it mean that the variance (computed by dividing by N) is a biased
statistic?
#Q13
The variance is biased because, in a sample, the variance would be underestimated.
Subtracting 1 from N would resolve this underestimation.



14. A confidence interval for the population mean computed from an N of 16
ranges from 12 to 28. A new sample of 36 observations is going to be taken.
You can't know in advance exactly what the confidence interval will be
because it depends on the random sample. Even so, you should have some idea
of what it will be. Give your best estimation.
#Q14
xconfidencediff <- (28-12)/2
#confidence of y% is a range of +- 8*y from the mean
Since we do not know the range, we cannot compute the stddev/error. It can be assumed that
with N observations, the mean will be 'x' with a confidence range (y) of +- '8*y' since
the higher number of observations, the closer the sample should move toward the population mean.



15. You take a sample of 22 from a population of test scores, and the mean of your
sample is 60. (a) You know the standard deviation of the population is 10.
What is the 99% confidence interval on the population mean. (b) Now assume
that you do not know the population standard deviation, but the standard
deviation in your sample is 10. What is the 99% confidence interval on the
mean now?
popN <- 22
samplemean <- 60
#a
popstd <- 10
stderror <- 10/sqrt(popN)
confidence <- ((samplemean - (2.58 * stderror)) - (samplemean + (2.58 * stderror)))/2
crange <- c(samplemean+confidence, samplemean-confidence)
crange
#confidence range = 54.49942 65.50058

#b
sstddev <- 10
stderror <- 10/sqrt(popN-1)
confidence <- ((samplemean - (2.58 * stderror)) - (samplemean + (2.58 * stderror)))/2
crange <- c(samplemean+confidence, samplemean-confidence)
crange
#confidence range = 54.36998 65.63002



16. You read about a survey in a newspaper and find that 70% of the 250 people
sampled prefer Candidate A. You are surprised by this survey because you
thought that more like 50% of the population preferred this candidate. Based
on this sample, is 50% a possible population proportion? Compute the 95%
  confidence interval to be sure.
#60
samplemean <- .7
stderror <- .7/ sqrt(250)
confidence <- ((samplemean - (1.96 * stderror)) - (samplemean + (1.96 * stderror)))/2
crange <- c(samplemean+confidence, samplemean-confidence)
crange
#confidence range = 0.6132271 0.7867729
No, '50%' is not a possible population propotion with '95%' confidence.



17. Heights for teenage boys and girls were calculated. The mean height for the
sample of 12 boys was 174 cm and the variance was 62. For the sample of 12
girls, the mean was 166 cm and the variance was 65. Assuming equal variances
and normal distributions in the population, (a) What is the 95% confidence
interval on the difference between population means? (b) What is the 99%
confidence interval on the difference between population means? (c) Do you
think it is very unlikely that the mean difference in the population is about 5?
Why or why not?
boymean <- 174
girlmean <- 166
diffofmean <- boymean - girlmean
MSE <- (62+65)/2
stderror <- sqrt((2 * MSE) / 12)
#a
dof <- (12-1)+(12-1)
t <- 2.074
#t score with 95% confidence at 22 dof = 2.074
confidence <- ((diffofmean - (t * stderror)) - (diffofmean + (t * stderror)))/2
crange <- c(samplemean+confidence, samplemean-confidence)
crange
#With 95% confidence, the difference between population means is -6.047144  7.447144.

#b
t2 <- 2.819
#t score with 99% confidence at 22 dof = 2.819
confidence <- ((diffofmean - (t2 * stderror)) - (diffofmean + (t2 * stderror)))/2
crange <- c(samplemean+confidence, samplemean-confidence)
crange
#With 99% confidence, the difference between population means is -8.470781  9.870781.

#c
No it is not unlikely because a difference in populations means of 5 is well within
the confidence intervals for '95%' and '99%'



18. You were interested in how long the average psychology major at your college
studies per night, so you asked 10 psychology majors to tell you the amount
they study. They told you the following times: 2, 1.5, 3, 2, 3.5, 1, 0.5, 3, 2, 4.
(a) Find the 95% confidence interval on the population mean. (b) Find the 90%
  confidence interval on the population mean.
population <- c(2, 1.5, 3, 2, 3.5, 1, 0.5, 3, 2, 4)
popmean <- sum(population)/length(population)
popvar <- var(population)
stddev <- sqrt(popvar)
stderror <- stddev/sqrt(length(population))
#a
t1 <- 2.262
#tscore with 95% confidence at (10-1)=9 degrees of freedom = 2.262
confidence <- ((popmean - (t1 * stderror)) - (popmean + (t1 * stderror)))/2
crange <- c(popmean+confidence, popmean-confidence)
crange
#The 95% confidence range is between 1.454718 3.045282

#b
t2 <- 1.833
#tscore with 90% confidence at (10-1)=9 degrees of freedom = 1.833
confidence <- ((popmean - (t2 * stderror)) - (popmean + (t2 * stderror)))/2
crange <- c(popmean+confidence, popmean-confidence)
crange
#The 90% confidence range is between 1.605547 2.894453