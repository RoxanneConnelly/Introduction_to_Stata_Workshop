STOP
********************************************************************************
/*
					INTRODUCTION TO STATA WORKSHOP

							Lab Session 3

							Regression
																			
																			  */
********************************************************************************





********************************************************************************

*         	            O L S   R E G R E S S I O N                      	   *

********************************************************************************

* Open the 'ghs95.dta' data file.


	use "H:/Data/ghs95.dta", clear
	

* Examine three continuous variables.
	
	
	summarize thhy workhrs age

/* We will run an OLS regression with the outcome variable thhy (usual gross
	weekly household income) and two explanatory variables workhrs (hours
	usually worked per week) and age (age).
	
	The command used to run an OLS regression is 'regress' next you list you
	outcome variable, and then you list your explanatory variables.           */
	
	
	regress thhy workhrs age
	
/* We can see that workhrs are significantly associated with income, a one unit
	increase in work hours leads to an average increase of 3.74 units of income.
	
	Age is not significantly associated with income.
	
	There are 2243 observations in this model.
	
	The adjusted R-Squared value is 0.0164  
	
	
	Next we add the categorical variable sex to the model. This variable is 
	binary (it has two categories) so we don't need to tell Stata is it 
	categorical.                                                             */
	
	
	tab sex
	
	regress thhy workhrs age sex
	
/* The coefficient for sex is not significant.

	We now add the categorical variable of edlevhh2 (education level of the 
	head of household).
	
	This variable is categorical and has more than two categories. We need to
	tell Stata that this variable is categorical and we also want to specify 
	the reference category. We will specify the reference category as
	1 (degree).
	
	ib1. is placed before the name of the education variable to indicate that
	this variable is categorical and that we want to reference category to be 
	category 1.
	
	*/

	
	tab edlevhh2
	
	regress thhy workhrs age sex ib1.edlevhh2
	
/* If we want Stata to remind us in the output what the reference category is
	we can use the 'baselevel' option.   */

	
	regress thhy workhrs age sex ib1.edlevhh2, baselevel
	
/* We can see that compared to those with a degree, those with GCE A levels
	earn on average 132.2943 units less income (after the other variables in 
	the model have been take into account). Overall educational qualifications
	seem to be strongly associated with income.
	
	The coefficient for foreign qualifications is not significant, why might 
	this be?																
	
	If we want to change the reference category we can simply change the number
	after ib.
	
	Let's change the reference category to GCE A-Level (category 3).         */
	
	
	regress thhy workhrs age sex ib3.edlevhh2, baselevel
	
	
/* We might wish to explore an interaction between sex and education level. 
	We can do this using the code below.                                     */
	
	
	regress thhy workhrs age ib3.edlevhh2##sex, baselevel

	
/* There doesn't appear to be any obvious interaction between education level 
	and sex.	
	
	
	margins is a very useful command, especially when examining categorical data

	We can run it in tandem with marginsplot and visualise the interaction.

 
	It is a little bit advanced for an introductory course but you can read a 
	bit more about using margins to examine categorical  interactions here on 
	our blog:
	
	https://tinyurl.com/yxpa5wkt											*/

                                                               

	margin ib3.edlevhh2##sex

	marginsplot

 

/* There doesn't appear to be any obvious interaction between education level
	and sex (if we were presenting this graph in a paper we would clean up
	the labels a little!). 													*/
	
	
	
	
	
	

	
	
	
	
/*	Find another continuous variable in this data and practice specifying 
	your own OLS regression models.                                     	*/

	
	
	
	
	
/* You can also run a regression model on a subset of your sample using the 
	conditional terms you have seen before. Here we run a regression only 
	including those age between 21 and 45.                                   */
	
	
	regress thhy workhrs age sex ib3.edlevhh2 if ((age >= 21)&(age <= 45)), baselevel	
	

	
	
/* The line of code above gets a little long, we might want to split it between
		two lines. You can do this by adding three slashes /// This tells 
		Stata that the code continues on the next line (highlight the whole
		block when running this).                     						 */
		
	regress thhy workhrs age sex ib3.edlevhh2 if ///
	((age >= 21)&(age <= 45)), baselevel	
	

	
	
	
	
	
********************************************************************************

*         	         L O G I S T I C   R E G R E S S I O N                     *

********************************************************************************

/* Here we estimate a logistic regression model of whether the respondent has
	their own teeth (or not). 
	
	To run a logistic regression model in Stata we need to ensure the outcome
	variable is coded 1 and 0. 
	
	teeth is currently coded 1 and 2, so we will first recode this variable. */
	
	tab teeth
	
	capture drop teethnew
	gen teethnew = teeth
	recode teethnew (2=0)
	label variable teethnew "Respondent has own teeth"
	label define teethnewlabel 1 "Yes" 0 "No"
	label values teethnew teethnewlabel
	tab teethnew
	tab teethnew teeth
	
	
/* We run the logit model. We use the explanatory variables age, sex and 
	social class.  The reference category for social class is set as category
	2.                                                                        */
	
	tab1 sex soclase

	summarize age
	
	logit teethnew age sex ib2.soclase, baselevel
	
/* Older respodents, women and those from less disadvantaged social classes
	are less likely to have their own teeth.
	
	By defaul Stata provides logistic regression coefficients as log odds.
	
	If you are mad, and would prefer odds ratios you can do this in two ways.
	
	You can type logistic instead of logit
	
	or you can add the 'or' option.											*/
	
	
	logit teethnew age sex ib2.soclase, baselevel
	
	logistic teethnew age sex ib2.soclase, baselevel
	
	logit teethnew age sex ib2.soclase, baselevel or
	
	
/* You can also straightforwardly calculate predicted probabilities in Stata
	but we will not demonstrate this here.
	
	Further guidance is available here: https://tinyurl.com/y2km8fnf	     */
	
	
	

	
*	Let's investigate the iteraction between social class and sex.          
	
	
	logit teethnew age ib2.soclase##sex, baselevel


/* We can see there is no significant interaction here.

	Remember that interpreting interactions in logistic regressions are not as 
	straighforward as in OLS regression.
	
	More a short summary see these two blog posts:
	
	https://tinyurl.com/zeynezn
	
	https://tinyurl.com/y7vkgx6f                                             
	


	In this file we go on to demonstrate further regression analysis techniques,
	if you are not familiar with regression analysis beyond logistic 
	regression you may find it more productive to stop at this point and
	practice the skills so far.
	
	We suggest you open the Crime Survey for England and Wales, 2013-2014: 
	Unrestricted Access Teaching Dataset and practice undertaking your own
	regression analyses.                                                      */
	
	

	
	
	
	
	
********************************************************************************

*         	 O R D E R E D   L O G I S T I C   R E G R E S S I O N             *

********************************************************************************

/* Once you know how to run one type of regression in Stata, extending this
	is fairly straightforward. Here we run an ordered logistic regression with
	the outcome variable as social class, and the explanatory variables of
	education level, age and sex.											*/

	
	ologit soclase ib1.edlevhh2 age sex, baselevel

	
/* As we would expect more highly educated respondents are also likely to be
	in the more advantaged social class categories.							*/



	
	
	
	
	
********************************************************************************

*                M U L T I N O M I A L   R E G R E S S I O N                   *

********************************************************************************


/* Here we run a multinomial regression model with the outcome variable as
	education level, and the explanatory variables of age and sex.                                   
	
	We include the baseoutcome option to specify which category of the outcome
	variable is the reference for the mlogit comparisons. We set this as 
	category 1 (degree).                                                 	*/
	
	mlogit edlevhh2 age sex,  baseoutcome(1)
	


	
* Close the data and clear the screen	
	



/* Open the Crime Survey for England and Wales, 2013-2014: Unrestricted Access 
	Teaching Dataset and practice undertaking your own regression analyses.  */






	
	


********************************************************************************

*            E X T E N S I O N  -  W E I G H T I N G   D A T A                 *

********************************************************************************

/* In this section we demonstrate how to undertake analysis which adjust for
	the design of complex survey samples. If this is a new concept to you
	we suggest that you continue to practice regression analysis, and the 
	commands from the previous labs.                              
	
	Like most data analysis packages, Stata assumes by default that the data
	used come from a simple random sample. For most data resources this is 
	not the case. You will usually need to weight data (e.g. for selection
	effects or non-response) and / or adjust for sample design 
	(e.g. clustering or stratification).                                   	*/



** Weighting Data

/* Open the Crime Survey for England and Wales, 2013-2014: Unrestricted Access 
	Teaching Dataset.
	
	This dataset contains a weight to adjust for non-response.
	
	In the following code we undertake weighted and unweighted analyses of 
	these data.                                                         	
	
	We first tell Stata about the complex nature of our data (i.e. that we 
	need to weight) and then add the svy: suffix to commands we run.         */                                           */
	
	
* We tell Stata about the weight

	svyset [pweight=IndivWgtx]
	
* We tab the variable rural2 without weighting it

	tab rural2
	
* Now we ask svy to weight analysis

	svy: tab rural2
	
/* In the unweighted sample 23.61% of respondents live in rural areas. When
	we weight for non-response only 19.5% of respondents live in rural areas. 
	
	
	We can compare the weighted and unweighted mean of how long lived in this
	area.																	*/
	
	mean yrsarea
	
	svy: mean yrsarea
	
/* We can compare the weighted and unweighted logistic regression of whether 
	or not the respondent has been a victim of a crime in the last 12 months. */
	
	logit bcsvictim sex ib1.ethgrp2a
	
	svy: logit bcsvictim sex ib1.ethgrp2a

/* You can see also the different commands you can use with svy by reading the 
	svy help files.                                                          */
	
	help svy
	
	
	
	
	
	
	
** Including Survey Design Effects

/* We can also easily extent svy by including futher details of sample 
	design such as strata and clustering.     
	
	We open an online dataset 'nhanes2f' which contains health data.		*/

	webuse nhanes2f, clear
    
/* We next tell Stata about the design of this sample. The variable psuid
	indicates the primary sampling unit of the sample members, finalwgt is the
	weight variable, and stratid indicates the stratum which the survey members
	are in.																	*/
	
	svyset psuid [pweight=finalwgt], strata(stratid)
	
	
* We examine the mean value for zinc (unadjusted)

	mean zinc
	
* We examine the adjusted mean value for zinc
	
	svy: mean zinc
	
	
* We examine an unadjusted regression of zinc	

	regress zinc age weight female rural
	
	
* We examine an adjusted regression of zinc	
	
    svy: regress zinc age weight female rural





* Clear the data

	clear
	
* Clear your window

	cls




********************************************************************************
* END OF FILE
