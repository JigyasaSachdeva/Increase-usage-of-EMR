# Increase-usage-of-EMR
Analytics of a trends survey to derive KPIs essential for targeting patients to enhance the use of EMR

Project Scope: To increase EMR presence using NIH generic survey applicable to target audience

Folders in the repository: 

- Given Files: 
	1. 'HINTS_5_Cycle2_STATA': STATA suitable data used in R;
	2. 'HINTS5C5 Trimmed.pdf': NIH Survey Questionnaire, all questions are variables with answers being categories of the variable in the dataset

- Conceptual Model: 
	1. 'Technology Assesment Model.xlsx': Variable treatment in Excel file based on conceptual model
	2. Reference: 'EMR.pptx' (Slide 2: Slide for selecting the variables in the dataset)

- R Files: 
	1. 'EMR_Analytics.R': Data Reading, Pre-Processing, Cleaning
	2. 'Binary_EMR.R': Binary Logistic Regression Model application 
	3. 'Ordinal_EMR.R': Ordinal Logistic Regression Model application 
	4. 'Multinomial_EMR.R': Multinomial Logistic Regression Model application 

- Final Output: 
	1. 'EMR.pptx': Entire presentation explaining the workflow; Final slide indiciating KPIs observed and to be targeted 
	2. 'FinalData5.csv': Data created after pre-processing and cleaning
	3. 'Multinomial Logistic Regression Output.xlsx': Combined coef.csv and pvalue.csv in a readable format to highlight KPIs of the data
	4. 'coef.csv': Coefficients of variables retrieved from multinomial logistic regression model output
	5. 'pvalue.csv': p-value of variables retrieved from multinomial logistic regression model output
