#EMR Analytics to increase presence 

#Reading STATA data (.dat file) in R
library(haven)
hints_public <- read_dta("Desktop/Second Sem/Healthcare/EMR_Model/Data/HINTS-5_Cycle2_STATA/hints5_cycle2_public.dta")
View(hints_public)
h <- hints_public
rm(hints_public)
#Alias creation for shorter name

#Shortlisting variables in the data base on Technology Assessment Model
install.packages("dplyr")
library(dplyr)
h1 <- h %>% 
  select(age, 
         providermaintainemr2, 
         everofferedaccessrec, 
         occupationstatus, 
         activedutyarmedforces, 
         maritalstatus, 
         education, 
         hisp_cat, 
         race_cat2, 
         childreninhh, 
         incomeranges, 
         freqgoprovider, 
         medconditions_arthritis, 
         medconditions_depression, 
         medconditions_diabetes, 
         medconditions_heartcondition, 
         medconditions_highbp, 
         medconditions_lungdisease, 
         useinternet, 
         electronic_selfhealthinfo, 
         electronic_healthinfose, 
         electronic_buymedicine, 
         electronic_lookedassistance, 
         electronic_talkdoctor, 
         electronic_trackedhealthcosts, 
         electronic_testresults, 
         otherdevtrackhealth, 
         confidentinfosafe, 
         timesmoderateexercise, 
         accessonlinerecord,
         whereseekhealthinfo,
         mostrecentcheckup2,
         totalhousehold)
#There are 32 dependent variables and 1 independent variable in this dataset
rm(h)
#Removing Alias



#Screening Variables

#Screening variable 1- Providermaintainemr2: (D1)
#Removing observations where provider does not have an EMR
str(h1$providermaintainemr2)
h1$providermaintainemr2 <- factor(h1$providermaintainemr2)
h2<-h1[!(h1$providermaintainemr2==2),]
#91 rows deleted
table(h2$providermaintainemr2)
#-9: 41 obs, -5:1 obs, 3: 570 obs
#Putting -9 and -5 in '3': Missing and errored data in 'don't know'
h3 <- h2 %>% mutate(providermaintainemr2=recode(providermaintainemr2, '-9'="3", '-5'='3'))
table(h3$providermaintainemr2)
#3: 612 obs
rm(h1, h2)


#Screening Variable 2- UseInternet (B1)
#Removing observations where people don't use internet
#As they would predict not using EMR which reinvents common sense
str(h3$useinternet)
h3$useinternet <- factor(h3$useinternet)
h4<-h3[!(h3$useinternet==2),]
#Down to 2692 observations
table(h4$useinternet)
#-9: 1 obs, 1: 2691 obs
rm(h3)


#Screening Variable 3- Everofferedaccessrec (D4)
#Removing observations where online access was not offered to the patients
#Renaming -9 as 3: Missing data as don't know if provided access
str(h4$everofferedaccessrec)
h4$everofferedaccessrec <- factor(h4$everofferedaccessrec)
h5<-h4[!(h4$everofferedaccessrec==2),]
table(h5$everofferedaccessrec)
h6 <- h5 %>% mutate(everofferedaccessrec=recode(everofferedaccessrec, '-9'="3"))
table(h6$everofferedaccessrec)
rm(h4, h5)
#1894 observations



#Dependent Variables analysis

#Occupationstatus- O2
str(h6$occupationstatus)
h6$occupationstatus <- factor(h6$occupationstatus)
table(h6$occupationstatus)
#-9 has 16 obs, -5 has 18 obs, 91 has 11 observation
#91 refers to others: converting -9 and -5 to 91
h7 <- h6 %>% mutate(occupationstatus=recode(occupationstatus, '-9'="91", '-5'='91'))
table(h7$occupationstatus)
rm(h6)


#ActiveDutyArmedForces- O3
str(h7$activedutyarmedforces)
h7$activedutyarmedforces <- factor(h7$activedutyarmedforces)
table(h7$activedutyarmedforces)
#Combining 1-3 as 1 and 4-5 as 0
h8 <- h7 %>% mutate(activedutyarmedforces=recode(activedutyarmedforces, '1'="1", '2'="1", '3'= "1", '4'= "0", '5'="0"))
table(h8$activedutyarmedforces)
rm(h7)


#Marital Status: O5
str(h8$maritalstatus)
h8$maritalstatus <- factor(h8$maritalstatus)
table(h8$maritalstatus)
h9 <- h8 %>% mutate(maritalstatus=recode(maritalstatus, '-9'="0", '-5'="0"))
table(h9$maritalstatus)
rm(h8)


#Education- O6
str(h9$education)
h9$education <- factor(h9$education)
table(h9$education)
h10 <- h9 %>% mutate(education=recode(education, '-9'="0", '1'="1", '2'="1", '3'="2", '4'="3", '5'="4", '6'="5", '7'="6"))
table(h10$education)
rm(h9)


#Hisp-cat: O10
str(h10$hisp_cat)
h10$hisp_cat <- factor(h10$hisp_cat)
table(h10$hisp_cat)
h11 <- h10 %>% mutate(hisp_cat=recode(hisp_cat, '-9'="Unknown", '10'="Not Hispanic", '21'= "Mexican", '22'= "Puerto Rican", '23'="Cuban", '24'= "Other Hispanic", '25'= "Multiple Hispanic"))
table(h11$hisp_cat)
rm (h10)


#Race-cat2
str(h11$race_cat2)
h11$race_cat2 <- factor(h11$race_cat2)
table(h11$race_cat2)
h12 <- h11 %>% mutate(race_cat2 = recode(race_cat2, 
                                         '11' = "White", '12' = "Black", '14' = "American Indian", '16' = "Multiple races", '31' = "Asian Indian", '32'= "Chinese", '33'= "Filipino", '34'= "Japanese", '35'= "Korean", '36'= "Vietnamese", '37' = "Other Asian", '52'= "Guamanian or Chamorro", '54'= "Other Pacific Islander", '-9' = "Unknown"))

table(h12$race_cat2)
rm(h11)


#Childreninhh
str(h12$childreninhh)
h12$childreninhh <- factor(h12$childreninhh)
table(h12$childreninhh)
h14 <- h12 %>% mutate(childreninhh=recode(childreninhh, '1'="1+", '2'="1+", 
                                          '3'= "1+", '4'="1+", '5'="1+", '6'="1+", '7'="1+", '8'="1+"))
table(h14$childreninhh)
rm(h12)


#IncomeRanges
str(h14$incomeranges)
h14$incomeranges <- factor(h14$incomeranges)
table(h14$incomeranges)
#Combine: 1-4: low, 5-6: medium, 7-9: high
h15 <- h14 %>% mutate(incomeranges=recode(incomeranges, '-9'="Unknown", '1'="Low", '2'="Low", '3'="Low",
                                          '4'= "Low", '5'="Medium", '6'="Medium", '7'="High", 
                                          '8'="High", '9'= "High"))
table(h15$incomeranges)
rm(h14)


#TotalHousehold- O13
str(h15$totalhousehold)
h15$totalhousehold <- factor(h15$totalhousehold)
table(h15$totalhousehold)
h16 <- h15 %>% mutate(totalhousehold=recode(totalhousehold, '-9'="Unknown", '4'="4+", '5'="4+", '6'="4+", 
                                            '7'="4+", '8'="4+", '9'="4+", '14'="4+"))
table(h16$totalhousehold)
rm(h15)



#FreqGoProvider
str(h16$freqgoprovider)
h16$freqgoprovider <- factor(h16$freqgoprovider)
table(h16$freqgoprovider)
#Keeping it as it is 
#-9   0   1   2   3   4   5   6 
#17 176 271 398 318 237 312 165 


#MedConditions
str(h16$medconditions_arthritis)
h16$medconditions_arthritis <- factor(h16$medconditions_arthritis)
h16$medconditions_depression <- factor(h16$medconditions_depression)
h16$medconditions_diabetes <- factor(h16$medconditions_diabetes)
h16$medconditions_heartcondition <- factor(h16$medconditions_heartcondition)
h16$medconditions_highbp <- factor(h16$medconditions_highbp)
h16$medconditions_lungdisease <- factor(h16$medconditions_lungdisease)
h16$ischronic <- rep(1, nrow(h16))
h16$ischronic [h16$medconditions_arthritis==2 & h16$medconditions_depression==2 & h16$medconditions_diabetes==2 & h16$medconditions_heartcondition==2 & h16$medconditions_highbp==2 & h16$medconditions_lungdisease==2] <- 0
h16$ischronic [h16$medconditions_arthritis==-9 & h16$medconditions_depression==-9 & h16$medconditions_diabetes==-9 & h16$medconditions_heartcondition==-9 & h16$medconditions_highbp==-9 & h16$medconditions_lungdisease==-9] <- -9
str(h16$ischronic)
h16$ischronic <- factor(h16$ischronic)
table(h16$ischronic)
#-9    0    1 
#20  561 1313 


#otherdevtrackhealth
str(h16$otherdevtrackhealth)
h16$otherdevtrackhealth <- factor(h16$otherdevtrackhealth)
table(h16$otherdevtrackhealth)
h17 <- h16 %>% mutate(otherdevtrackhealth=recode(otherdevtrackhealth, '2'="0"))
table(h17$otherdevtrackhealth)
#-9    1    0 
#17  827 1050
rm(h16)

#confidentintosafe
str(h17$confidentinfosafe)
h17$confidentinfosafe <- factor(h17$confidentinfosafe)
table(h17$confidentinfosafe)
h18 <- h17 %>% mutate(confidentinfosafe=recode(confidentinfosafe, '1'="High", '2'="Somewhat", '3'= "Not", '-9'= "Unknown", '-5'= "Unknown"))
str(h18$confidentinfosafe)
table(h18$confidentinfosafe)
#Unknown     High Somewhat      Not 
#29      633      967      265 
rm(h17)


#timesmoderateexercise
str(h18$timesmoderateexercise)
h18$timesmoderateexercise <- factor(h18$timesmoderateexercise)
table(h18$timesmoderateexercise)
h19 <- h18 %>% mutate(timesmoderateexercise=recode(timesmoderateexercise, '-9'= "Unknown", '0'="None", '1'= "Less", '2'="Less", '3'= "Moderate", '4'= "Moderate", '5'= "High", '6'="High", '7'="High"))
table(h19$timesmoderateexercise)
#Unknown     None     Less Moderate     High 
#30      485      387      572      420
rm(h18)

#accessonlinerecord - Target- D6
str(h19$accessonlinerecord)
h19$accessonlinerecord <- factor(h19$accessonlinerecord)
table(h19$accessonlinerecord)
h20<-h19[!(h19$accessonlinerecord==-9 | h19$accessonlinerecord==-2 | h19$accessonlinerecord==-1),]
table(h20$accessonlinerecord)
#accessonlinerecord is the target with all levels
rm(h19)





#Dependent Variable
#binarytarget 
h20$binarytarget[h20$accessonlinerecord == 0] <- 0 
h20$binarytarget[h20$accessonlinerecord != 0] <- 1
str(h20$binarytarget)
h20$binarytarget <- factor(h20$binarytarget)
table(h20$binarytarget)

#ordinaltarget
h20$ordinaltarget <- rep("6+ times", nrow(h20))
h20$ordinaltarget[h20$accessonlinerecord == '1' | h20$accessonlinerecord == '2'] <- "1-5 times"
h20$ordinaltarget[h20$accessonlinerecord == '0'] <- "0"
table(h20$ordinaltarget)
#0 1-5 times  6+ times 
#593       844       215





#Other Independent Variables: 
#With specific consideration, cleaned further

#whereseekhealthinfo- A2
str(h20$whereseekhealthinfo)
h20$whereseekhealthinfo <- factor(h20$whereseekhealthinfo)
table(h20$whereseekhealthinfo)
h20$seekinfointernet <- rep("Not internet", nrow(h20))
h20$seekinfointernet[h20$whereseekhealthinfo== '7'] <- "Uses internet"
h20$seekinfointernet[h20$whereseekhealthinfo== '-9' | h20$whereseekhealthinfo== '-6' | h20$whereseekhealthinfo== '-5' | h20$whereseekhealthinfo== '-2' | h20$whereseekhealthinfo== '-1'] <- "Unknown"
table(h20$seekinfointernet)
#Not internet       Unknown     Uses internet 
#264                362          1026


#Mostrecentcheckup2- C2
str(h20$mostrecentcheckup2) 
h20$mostrecentcheckup2 <- factor(h20$mostrecentcheckup2)
table(h20$mostrecentcheckup2)
h21 <- h20 %>% mutate(mostrecentcheckup2=recode(mostrecentcheckup2, '-9'="6", '-5'="6", '3'= "3+", '4'= "3+", '5'= "3+"))
table(h21$mostrecentcheckup2)
#6    1    2   3+ 
#30 1281  229  112 
rm(h20)


#Age- O1
str(h21$age)
a <- h21$age
a1 <- a[!a == -9]
median(a1)
#median = 55      #done before treating D6
#substituting 55 with null values in age
h21$age[h21$age == -9] <- 55
plot(density(h21$age))

#Categorizing age into buckets
h21$agecat <- rep('less than 30', nrow(h21))
h21$agecat[h21$age >=30 & h21$age <45] <- '30-45'
h21$agecat[h21$age >=45 & h21$age < 60] <- '45-60'
h21$agecat[h21$age >=60 ] <- '60-75'
table(h21$age)
table(h21$agecat)
#30-45        45-60        60-75        less than 30 
#542          526          119          465 
h21$agecat <- factor(h21$agecat)
rm(a,a1)


#Clubbing levels in Hispanic category because less data at some levels for analysis
table(h21$hisp_cat)
h22 <- h21 %>% mutate(hisp_cat=recode(hisp_cat, 'Mexican' = "Hispanic", 'Puerto Rican'= "Hispanic", 
                                      'Cuban'= "Hispanic", 'Other Hispanic'= "Hispanic", 'Multiple Hispanic'= "Hispanic") )
rm(h21)
table(h22$hisp_cat)

#Clubbing levels in Hispanic category because less data at some levels for analysis
table(h22$race_cat2)
h23 <- h22 %>% mutate(race_cat2=recode(race_cat2, 'American Indian' = "Others", 'Multiple races' = "Others", 
                                       'Asian Indian' = "Others", 'Chinese' = "Others", 'Filipino' = "Others", 
                                       'Japanese' = "Others", 'Vietnamese' = "Others", 'Other Asian' = "Others",
                                       'Guamanian or Chamorro' = "Others", 'Other Pacific Islander' = "Others"))
table(h23$race_cat2)
rm(h22)

#Analysing distribution of other variables
table(h23$incomeranges)
table(h23$freqgoprovider)
table(h23$ischronic)
#All good

#Renaming levels for confident into safe variable 
h24 <- h23 %>% mutate(confidentinfosafe= recode(confidentinfosafe, 'High' = "3", 'Somewhat'= "2", 'Not'= "1", 'Unknown'= "0"))
table(h24$confidentinfosafe)
table(h23$confidentinfosafe)
rm(h23)

#Factor conversions
h24$ordinaltarget <- factor(h24$ordinaltarget)
h24$seekinfointernet <- factor(h24$seekinfointernet)


write.csv(h24, "EMR_FinalData.csv")
#The data has been cleaned and saved into a csv file called 'EMR_FinalData.csv' 
#--------------------------------------------------------------------------














