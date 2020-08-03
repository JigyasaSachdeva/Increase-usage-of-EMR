HData1 <- FinalData5 %>% 
  select(occupationstatus, activedutyarmedforces, maritalstatus, education, hisp_cat, 
         race_cat2, childreninhh, incomeranges, freqgoprovider, otherdevtrackhealth, 
         confidentinfosafe, timesmoderateexercise, mostrecentcheckup2, 
         totalhousehold, agecat, ischronic, accessonlinerecord, seekinfointernet, Tech_savvy)

HData1$occupationstatus <- factor(HData1$occupationstatus)
HData1$activedutyarmedforces <- factor(HData1$activedutyarmedforces)
HData1$maritalstatus <- factor(HData1$maritalstatus)
HData1$education <- factor(HData1$education)
HData1$freqgoprovider <- factor(HData1$freqgoprovider)
HData1$otherdevtrackhealth <- factor(HData1$otherdevtrackhealth)
HData1$confidentinfosafe <- factor(HData1$confidentinfosafe)
HData1$ischronic <- factor(HData1$ischronic)
HData1$Tech_savvy <- factor(HData1$Tech_savvy)
HData1$accessonlinerecord <- factor(HData1$accessonlinerecord)
str(HData1)

HData1$Tech_savvy <- relevel(HData1$Tech_savvy, ref= '0')
HData1$activedutyarmedforces <- relevel(HData1$activedutyarmedforces, ref = '0')
HData1$maritalstatus <- relevel(HData1$maritalstatus, ref='6')
HData1$education <- relevel(HData1$education, ref = '1')
HData1$hisp_cat <- relevel(HData1$hisp_cat, ref = 'Not Hispanic')
HData1$race_cat2 <- relevel(HData1$race_cat2, ref= 'Black')
HData1$incomeranges <- relevel(HData1$incomeranges, ref= 'Low')
HData1$freqgoprovider <- relevel(HData1$freqgoprovider, ref= '0')
HData1$otherdevtrackhealth <- relevel(HData1$otherdevtrackhealth, ref= '0')
HData1$confidentinfosafe <- factor(HData1$confidentinfosafe, ordered = F)
HData1$confidentinfosafe <- relevel(HData1$confidentinfosafe, ref= '1')
HData1$timesmoderateexercise <- relevel(HData1$timesmoderateexercise, ref = 'None')
HData1$agecat <- relevel(HData1$agecat, ref = '60-75')
HData1$ischronic <- relevel(HData1$ischronic, ref = '0')
HData1$childreninhh <- relevel(HData1$childreninhh, ref = '0')
HData1$mostrecentcheckup2 <- relevel(HData1$mostrecentcheckup2, ref = '1')

options(scipen =99)
library(nnet)
log2 <- multinom(accessonlinerecord~., data = HData1)
z <- summary(log2)$coefficients/summary(log2)$standard.errors
# 2-tailed Wald z tests to test significance of coefficients
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p
#FInal dataframe with coefficients of each variable
c <- as.data.frame(summary(log2)$coefficients)
c <- t(c)
#FInal dataframe with p-values of each variable
a <- as.data.frame(t(p))
a

write.csv(c, "coef.csv")
write.csv(a, "pvalue.csv")



