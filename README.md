# Increase-usage-of-EMR
Analytics of a trends survey to derive KPIs essential for targeting patients to enhance the use of EMR

Project Scope: To increase EMR presence using NIH generic survey applicable to target audience

Folders in the repository: 

- Given Files: Constitutes of 'HINTS_5_Cycle2_STATA': STATA suitable data used in R;
		'HINTS5C5 Trimmed.pdf': NIH Survey Questionnaire, all questions are variables with answers being categories of the variable in the dataset

- Conceptual Model: Constitues of 'Technology Assesment Model.xlsx': Variable treatment in Excel file based on conceptual model
		    Reference: 'EMR.pptx' (Slide 2: Slide for selecting the variables in the dataset)

- R Files: Constitutes of 'EMR_Analytics.R': Data Reading, Pre-Processing, Cleaning
	   'Binary_EMR.R': Binary Logistic Regression Model application 
	   'Ordinal_EMR.R': Ordinal Logistic Regression Model application 
	   'Multinomial_EMR.R': Multinomial Logistic Regression Model application 

- Final Output: Constitutes of 'EMR.pptx': Entire presentation explaining the workflow; Final slide indiciating KPIs observed and to be targeted 
		'FinalData5.csv': Data created after pre-processing and cleaning
		'Multinomial Logistic Regression Output.xlsx': Combined coef.csv and pvalue.csv in a readable format to highlight KPIs of the data
		'coef.csv': Coefficients of variables retrieved from multinomial logistic regression model output
		'pvalue.csv': p-value of variables retrieved from multinomial logistic regression model output
