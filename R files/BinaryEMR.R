HData <- FinalData5 %>% 
  select(occupationstatus, activedutyarmedforces, maritalstatus, education, hisp_cat, 
         race_cat2, childreninhh, incomeranges, freqgoprovider, otherdevtrackhealth, 
         confidentinfosafe, timesmoderateexercise, mostrecentcheckup2, 
         totalhousehold, agecat, ischronic, binarytarget, seekinfointernet, Tech_savvy)


str(HData)
HData$occupationstatus <- factor(HData$occupationstatus)
HData$activedutyarmedforces <- factor(HData$activedutyarmedforces)
HData$maritalstatus <- factor(HData$maritalstatus)
HData$education <- factor(HData$education)
HData$freqgoprovider <- factor(HData$freqgoprovider)
HData$otherdevtrackhealth <- factor(HData$otherdevtrackhealth)
HData$confidentinfosafe <- factor(HData$confidentinfosafe)
HData$ischronic <- factor(HData$ischronic)
HData$binarytarget <- factor(HData$binarytarget)
HData$Tech_savvy <- factor(HData$Tech_savvy)
str(HData)


HData$Tech_savvy <- relevel(HData$Tech_savvy, ref= '0')
#Tech_savvy1                     0.56266    0.37105   1.516  0.12942    
#Tech_savvy2                     1.12709    0.34964   3.224  0.00127 ** 
#Tech_savvy3                     1.97556    0.35257   5.603 2.10e-08 ***
#Tech_savvy4                     3.20274    0.36461   8.784  < 2e-16 ***
#Tech_savvy5                     3.83389    0.38542   9.947  < 2e-16 ***
#Tech_savvy6                     3.72819    0.39461   9.448  < 2e-16 ***
#Tech_savvy7                     4.69926    0.58780   7.995 1.30e-15 ***
HData$activedutyarmedforces <- relevel(HData$activedutyarmedforces, ref = '0')
HData$maritalstatus <- relevel(HData$maritalstatus, ref='6')
#maritalstatus5                 -1.53089    0.52561  -2.913  0.00358 ** 

HData$education <- relevel(HData$education, ref = '1')
HData$hisp_cat <- relevel(HData$hisp_cat, ref = 'Not Hispanic')
#hisp_catUnknown                 0.63593    0.34532   1.842  0.06554 . 

HData$race_cat2 <- relevel(HData$race_cat2, ref= 'Black')
HData$incomeranges <- relevel(HData$incomeranges, ref= 'Low')
#incomerangesHigh                0.60251    0.22407   2.689  0.00717 ** 
#incomerangesMedium              0.28787    0.20534   1.402  0.16094    
#incomerangesUnknown             0.83013    0.30182   2.750  0.00595 ** 

HData$freqgoprovider <- relevel(HData$freqgoprovider, ref= '0')
#freqgoprovider3                 0.38239    0.29213   1.309  0.19054    
#freqgoprovider4                 0.71934    0.30779   2.337  0.01943 *  
#freqgoprovider5                 0.67197    0.30168   2.227  0.02592 *  
#freqgoprovider6                 0.32283    0.32447   0.995  0.31976  

HData$otherdevtrackhealth <- relevel(HData$otherdevtrackhealth, ref= '0')
HData$confidentinfosafe <- relevel(HData$confidentinfosafe, ref= '1')
#confidentinfosafe2              0.39986    0.19307   2.071  0.03835 *  
#confidentinfosafe3              0.63149    0.20319   3.108  0.00188 ** 

HData$timesmoderateexercise <- relevel(HData$timesmoderateexercise, ref = 'None')
HData$agecat <- relevel(HData$agecat, ref = '60-75')
#agecat30-45                     0.32071    0.31558   1.016  0.30951    
#agecat45-60                     0.51531    0.26937   1.913  0.05574 .  
#agecatless than 30              0.34670    0.34775   0.997  0.31877    

HData$ischronic <- relevel(HData$ischronic, ref = '0')
HData$childreninhh <- relevel(HData$childreninhh, ref = '0')
HData$mostrecentcheckup2 <- relevel(HData$mostrecentcheckup2, ref = '1')
#mostrecentcheckup22            -0.29077    0.18951  -1.534  0.12495    
#mostrecentcheckup23+           -0.43580    0.26086  -1.671  0.09479 .  
#mostrecentcheckup26            -0.55693    0.61192  -0.910  0.36275    

log <- glm(binarytarget~., data = HData, family = "binomial" )
summary(log)
#AIC: 1712.7


