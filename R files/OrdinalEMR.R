HData2 <- FinalData5 %>% 
  select(occupationstatus, activedutyarmedforces, maritalstatus, education, hisp_cat, 
         race_cat2, childreninhh, incomeranges, freqgoprovider, otherdevtrackhealth, 
         confidentinfosafe, timesmoderateexercise, mostrecentcheckup2, 
         totalhousehold, agecat, ischronic, ordinaltarget, seekinfointernet, Tech_savvy)

HData2$occupationstatus <- factor(HData2$occupationstatus)
HData2$activedutyarmedforces <- factor(HData2$activedutyarmedforces)
HData2$maritalstatus <- factor(HData2$maritalstatus)
HData2$education <- factor(HData2$education)
HData2$freqgoprovider <- factor(HData2$freqgoprovider)
HData2$otherdevtrackhealth <- factor(HData2$otherdevtrackhealth)
HData2$confidentinfosafe <- factor(HData2$confidentinfosafe)
HData2$ischronic <- factor(HData2$ischronic)
HData2$ordinaltarget <- as.ordered(HData2$ordinaltarget)
HData2$Tech_savvy <- factor(HData2$Tech_savvy)
str(HData2)

HData2$Tech_savvy <- relevel(HData2$Tech_savvy, ref= '0')
HData2$activedutyarmedforces <- relevel(HData2$activedutyarmedforces, ref = '0')
HData2$maritalstatus <- relevel(HData2$maritalstatus, ref='6')
HData2$education <- relevel(HData2$education, ref = '1')
HData2$hisp_cat <- relevel(HData2$hisp_cat, ref = 'Not Hispanic')
HData2$race_cat2 <- relevel(HData2$race_cat2, ref= 'Black')
HData2$incomeranges <- relevel(HData2$incomeranges, ref= 'Low')
HData2$freqgoprovider <- relevel(HData2$freqgoprovider, ref= '0')
HData2$otherdevtrackhealth <- relevel(HData2$otherdevtrackhealth, ref= '0')
HData2$confidentinfosafe <- factor(HData2$confidentinfosafe, ordered = F)
HData2$confidentinfosafe <- relevel(HData2$confidentinfosafe, ref= '1')
HData2$timesmoderateexercise <- relevel(HData2$timesmoderateexercise, ref = 'None')
HData2$agecat <- relevel(HData2$agecat, ref = '60-75')
HData2$ischronic <- relevel(HData2$ischronic, ref = '0')
HData2$childreninhh <- relevel(HData2$childreninhh, ref = '0')
HData2$mostrecentcheckup2 <- relevel(HData2$mostrecentcheckup2, ref = '1')

library(MASS)
ord <- polr(ordinaltarget~ occupationstatus+ activedutyarmedforces+ maritalstatus+ education+ hisp_cat+ 
            race_cat2+ childreninhh+ incomeranges+ freqgoprovider+ otherdevtrackhealth+ 
            confidentinfosafe+ timesmoderateexercise+ mostrecentcheckup2+ 
            totalhousehold+ agecat+ ischronic+ seekinfointernet+ Tech_savvy, data = HData2)
ctable <- coef(summary(ord))

ctable
p <- pnorm(abs(ctable[, 't value']), lower.tail = FALSE) * 2

ctable <- cbind(ctable, "p value" = p)

