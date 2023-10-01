
## Existing cross-over power calculation

# Old calculation - paired   (suggests 28 individuals needed to complete)
ceiling(power.t.test(n=NULL, delta = 0.22 , sd= 0.34 , power=0.9, type = "paired")$n)
# Old calculation - parallel (suggests 52 per group to complete)
ceiling(power.t.test(n=NULL, delta = 0.22 , sd= 0.34 , power=0.9)$n)

#* # Real data

#* Using the data from Barthow et al:
#* They reported a difference of 
#*  -0.83 (95% CI = -1.93 to 0.27) mmol/mol
#*  -0.17 (95% CI = -1.28 to 0.94) mmol/mol
#*  Between groups.  N=65 per group in both cases.
#*  The 95% confidence intervals have a width of 
CIwidth1 = 0.27 - (-1.93)
CIwidth2 = 0.94 - (-1.28)
mean(CIwidth1, CIwidth2)
#* Average width = 2.2 mmol/mol
#* This corresponds to a standard error of approx 
2.22/4

#* This corresponds to an effective 'standard deviation' of:
s <- function(se,n) se / sqrt(2/n)
s(2.22.4,65)
#* 3.16 mmol/mol

#* Based on this, a parallel groups trial to test a difference of 2.5 mmol/mol requires:
ceiling(power.t.test(n=NULL, delta = 2.5 , sd= 3.16 , power=0.9)$n)
#* 35 per group to complete.

#* This is different to the calculation Barthow made, which assumed sd would be 6.0mmol/mol
#* In reality it was 4.4, with much of this explained by baseline.
#* 
#* Mcleod et al assumed the SD of 5.5 mmol/mol, led to sample size of 152 (assume power of 0.8)
ceiling(2*power.t.test(n=NULL, delta = 2.5 , sd= 5.5 , power=0.8)$n)

#* McLeod - https://link.springer.com/content/pdf/10.1007/s00125-020-05261-x.pdf
#* Suggests a standard deviation of 3 when adjusted for baseline values

#* Ben-Yacov - https://link.springer.com/content/pdf/10.1007/s00125-020-05261-x.pdf
#* Suggests a standard deviation of 2.47 for change score! (and very small baseline SD for 225 participants)
#* CI width = 0.12%
#* CI width 1.32 - 112 participants per group
#* se=0.33

# 



standard deviation at baseline = 0.47
standard deviation at follow up = 0.60
standard deviation of the difference = 0.36
sd(X) = 0.47
sd(Y) = 0.6
sd(X-Y) = 0.36

var(X-Y)=var(X)+var(Y)+
  
  
  
  
library(cowsay)