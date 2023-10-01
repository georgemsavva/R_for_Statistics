
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
s(0.555,65)
#* 3.16 mmol/mol

#* Based on this, a parallel groups trial to test a difference of 2.5 mmol/mol requires:
ceiling(power.t.test(n=NULL, delta = 2.5 , sd= 3.16 , power=0.9)$n)
#* 35 per group to complete.

#* This is different to the calculation Barthow made, which assumed sd would be 6.0mmol/mol
#* In reality it was 4.4, with much of this explained by baseline.
#* 
#* Mcleod et al assumed the SD of 5.5 mmol/mol, led to sample size of 152 (assume power of 0.8)
ceiling(2*power.t.test(n=NULL, delta = 2.5 , sd= 5.5 , power=0.8)$n)


McLeod - https://link.springer.com/content/pdf/10.1007/s00125-020-05261-x.pdf
## Suggests a standard deviation of 3 when adjusted for baseline values


# Old numbers - parallel
ceiling(power.t.test(n=NULL, delta = 0.22 , sd= 0.34 , power=0.9)$n)

# Old numbers - parallel - better sd:
ceiling(power.t.test(n=NULL, delta = 0.22 , sd= 3.16 / 11 , power=0.9)$n/.8)



#https://trialsjournal.biomedcentral.com/articles/10.1186/s13063-020-05001-x
#* Targets 150 participants  
#* Low-carbohydrate dietary pattern on glycemic outcomes trial (ADEPT) among individuals with elevated hemoglobin A1c: study protocol for a randomized controlled trial
#*  Kirsten S. Dorans, Lydia A. Bazzano, Lu Qi, Hua He, Lawrence J. Appel, Jonathan M. Samet, Jing Chen, Katherine T. Mills, Bernadette T. Nguyen, Matthew J. O’Brien, Gabriel I. Uwaifo & Jiang He 
#*  Based on power calculations that assume 95% follow-up (96% follow-up to-date), 
#* we estimate 80% power to detect a difference in change of HbA1c of 0.17%.
#*  In a follow-up analysis of the DPP, a 0.17% decrement in HbA1c at 6 months 
#*  was associated with a 17% lower risk of incident T2DM [44].  
#*  The primary outcome will be the difference in the change 
#*  of HbA1c between the intervention and usual diet groups. 
#*  Pilot data from our group suggests that the standard deviation (SD) 
#*  of 6-month change in HbA1c is 0.35%, with 6-month follow-up > 95% 
#*  (follow-up rate to-date is 96%). Based on an estimated standard deviation of 
#*  change in HbA1c of 0.35% and 95% follow-up, we would need a total of 150 participants 
#*  (142 participants with follow-up data) to have 80% power to detect a difference 
#*  in the change in HbA1c from baseline to 6 months of 0.17% between the 
#*  intervention and usual diet groups (unpaired t tests, two-sided alpha of 0.05).
#*  
#*  https://academic.oup.com/ajcn/advance-article/doi/10.1093/ajcn/nqac154/6596279
#*  cross-over N=33
#*  Effect of a Ketogenic Diet versus Mediterranean Diet on HbA1c in Individuals with Prediabetes and Type 2 Diabetes Mellitus: the Interventional Keto-Med Randomized Crossover Trial 
#*  
#*  https://link.springer.com/article/10.1007/s00394-020-02379-x. Parallel n=150, pre-diabetes or diabetes.
#*  
#*  https://diabetesjournals.org/care/article-abstract/44/9/1980/138839/Personalized-Postprandial-Glucose-Response
#*  225 participants with pre-diabetes.  The trial was designed with a target sam-
#* ple size of 234 participants assigned equally to PPT and MED groups on the basis of hypothesized difference of at 
#* least 0.1% (1.1 mmol/mol) in the reduc-tion of HbA1c levels (at 6 months) between the two diet groups, an esti-
#*  mated SD of 0.26 in HbA1c reduction (38), two-sided a of 0.05, a power of 0.80, and an estimated withdrawal rate of 10%. 
#*  
#*  https://bmccomplementmedtherapies.biomedcentral.com/articles/10.1186/s12906-020-03005-3
#*  N = 30 cross-over.  All statistical analyses were conducted using SAS version 9.4 (SAS Institute, Charlotte, NC, USA). Sample size was calculated to detect a 1.0 mg/dL (SD = 2.3 mg/dL) based on a power of 0.8 and an α levels of 0.05 [11]. 
#*  
#*  https://link.springer.com/article/10.1007/s00125-020-05261-x
#*  Impact of a comprehensive digital health programme on HbA1c and weight after 12 months for people with diabetes and prediabetes: 
#*  a randomised controlled trial
#*  n = 152 for prediabetes-range participants
#*  McLeod
#*  Impact of a comprehensive digital health programme on HbA1c and weight after 12 months for people with diabetes and prediabetes: a randomised controlled tria
#*  
#*  Glucoregulatory markers Mean (SD) Mean (SD) Mean (SD) Mean (SD)
#*HbA1c, mmol/mol 46.8 (4.4) 45.3 (3.9) n=36 45.9 (3.5) n=37 45.8 (4.2) n=33
#* HbA1c, % 6.4 (0.4) 6.3 (0.4) n=36 6.3 (0.3) n=37 6.3 (0.4) n=33
#* 
#* CI = -0.83 (-1.93 to 0.27) mmol/mol
#* 
#* CI = -0.17 (-1.28 to 0.94) mmol/mol
#* 
CIwidth1 = 0.27 - (-1.93) # (this means @ 1mmol/mol effect size power about 50%)
CIwidth2 = 0.94 - (-1.28)

CIwidth1  
CIwidth2

## So CI width = 2.22.

se = 2.22 / 4 (mean difference, two groups of N=65)
se <- function(s,n) sqrt(2*s*s/n) # = sqrt(2/n)*s
s <- function(se,n) se / sqrt(2/n)

s(2.22/4,65)

## Suggests a standard deviation of 3 when adjusted for baseline values

ceiling(power.t.test(n=NULL, delta = 2.5 , sd= 3.16 , power=0.9)$n)
ceiling(power.t.test(n=NULL, delta = 2.2*1.1 , sd= 3.74 , power=0.9)$n)

# Old calculation - paired
ceiling(power.t.test(n=NULL, delta = 0.22 , sd= 0.34 , power=0.9, type = "paired")$n)

# Old numbers - parallel
ceiling(power.t.test(n=NULL, delta = 0.22 , sd= 0.34 , power=0.9)$n)

# Old numbers - parallel - better sd:
ceiling(power.t.test(n=NULL, delta = 0.22 , sd= 3.16 / 11 , power=0.9)$n/.8)

# Old numbers - parallel - better sd:
power.t.test(n=40*.8, delta = 0.22 , sd= 3.16 / 11 , power=NULL)
power.t.test(n=40*.8, delta = NULL , sd= 3.16 / 11 , power=0.9)

2*ceiling(power.t.test(n=NULL, delta = 2.5 , sd= .34*11 , power=0.9)$n/.8)
2*ceiling(power.t.test(n=NULL, delta = 0.22 , sd= .34 , power=0.9)$n/.8)

power.t.test(n=65, delta = 1 , sd= 3.16 , power=NULL)$power

2*ceiling(power.t.test(n=NULL, delta = 2.5 , sd= 4 , power=0.9)$n / 0.75)

#### With of CI = -3.1, 0.5  -2.9, 1.1, 
## Average width of CI = 3.8

s(2/4,100)

## 
s(3.8/4,65)

.34*11

## We will aim to recruit 34 participants with the expectation ≥30 participants 
## will complete the study. This will give us a 90% power to detect a difference in 0.22% 
## in HbA1c.Within person standard deviation estimated using a mixed model was 0.24%,
## therefore the difference between two HbA1c measurements in the same individual 
## is likely to have standard deviation of √(2)*0.24% = 0.34%, and so the
## estimate of treatment effect will have an expected standard error of 0.058%,
## and the 95% confidence interval for treatment effect will have an expected total width of 0.232%. 

## Conversion between 0.22% and mmol/mol

percToMMOLMOL <- function(p) 10.929 * (p - 2.15)
MMOLMOLtoPerc <- function(m) (m / 10.929) + 2.15

percToMMOLMOL(2.9)




# A1C(mmol/mol) = 10.929 * (A1C(%) - 2.15)

Bar0, 48.98016997167139
Bar1, 47.98866855524079
Bar2, 46.9971671388102
Bar3, 45.94900849858357
Bar4, 44.98583569405099
Bar5, 43.994334277620396
Bar6, 43.0028328611898
Bar7, 42.01133144475921
Bar8, 41.01983002832861

sd(c(rep(49,8),
rep(48,6),
rep(47,17),
rep(46,17),
rep(45,16),
rep(44,13),
rep(43,16),
rep(42,22),
rep(41,18)))

5.9 +- 0.2
CI = -0.14 to -0.02 = 0.12 in 

CI width = 0.12%
1.32 - 112 participants per group
se=0.33
s(0.33,112)


