STOP
********************************************************************************
/*
					INTRODUCTION TO STATA WORKSHOP

							Lab Session 2

							 Data Management
																			
																			  */
********************************************************************************





********************************************************************************

*         	        M A N A G I N G   V A R I A B L E S                 	   *

********************************************************************************

* Open the 'ghs95.dta' data file (write your code below)





* Add value labels

	numlabel _all, add




**** Dealing with Missing Values

/* Take a look at the variable 'ccmainm1' - main contraceptive methods.

	You see that the value -8 is given if this question is not applicable 'NA'
	and there is also a value of -9 given to a number of respondents.

	-8 and -9 are missing values and therefore we ignore these cases in any
	analysis using these variables. To tell Stata this we use the mvdecode 
	command.   */

	
	tab ccmainm1
	
	mvdecode ccmainm1, mv(-8 = . \ -9 = .)
	
	tab ccmainm1
	
	tab ccmainm1, missing
	
	tab ccmainm1, mi
	
	
/* Above we replaced all missing values with a . which Stata knows means
	missing. We might however want Stata to know a value is missing but
	also be able to differentiate missing for different reasons (e.g. refusal,
	don't know).
	
	Take a look at the dntstwhn variable. It has two missing values also. 
	We replace the missing value -9 with the code .a and the missing value -8
	with the code .b 
	
	Stata knows these values mean missing, but we can also differentiate that
	these values are missing for different reasons (which might potentially
	be important in an analysis).   */
	
	
	tab dntstwhn
	
	mvdecode dntstwhn, mv(-8 = .b \ -9 = .a)
	
	tab dntstwhn
	
	tab dntstwhn, mi
	

	
	
	
	
/* The variable edlev also has missing values -99

	Please code these values as missing (i.e. tell Stata they are missing).  */


	tab edlev
	
	
	


/*  Of course once you have identified your missing variables you should
	also consider if there are further analytical steps you need to take
	to adjust your analyses for this missingness (e.g. multiple imputation). 
	
	We will not cover these methods in this introductory workshop but relevant
	further resources are highlighted below. 

	https://stats.idre.ucla.edu/stata/seminars/mi_in_stata_pt1_new/
	https://www.stata.com/manuals13/mi.pdf
	https://missingdata.lshtm.ac.uk/                                    	*/

	
	
	
	
	

*** Dropping Cases	
	
	
/* If we are undertaking an analysis of educational attainment, we might wish
	to drop all cases from our analysis who have missing data for education.
	
	We can do this using the code below.   */
	
	
	tab edlev, mi
	
	drop if (edlev==.)

	tab edlev, mi
	
	
* We might wish to drop only those age under 21.


	tab age, mi
	
	drop if (age<21)
	
	
* We might wish to only keep sample members who have no qualifications


	tab edlev, mi
	
	keep if (edlev==17)
	
	tab edlev, mi
	
	
/* You will have seen that our sample size has gradually reduced as we are
	dropping many sections of the sample. You might prefer to drop a selection
	of the sample temporarily, and then restore it again. 
	
	Here we preserve our current sample.
	
	Select only those age 30.
	
	Undertake some descriptive statistics.
	
	The restore the sample at the preserve point.  
	
	Note you must run this as one block from the preserve to the restore. */
	
	
	preserve
	
	tab age, mi
	
	keep if (age==30)
	
	tab age, mi
	
	summarize workhrs
	
	restore, preserve
	
	
	
	
* Clear the current data from Stata.

	clear
	

	
	

	
	
**** Variable Names and Labels	

* Open the 'wemp.dta' data file and explore this data set. Write your code below.



/* This is a survey of women's employment. But that is not at all clear as 
	none of the variables have meaningful names and they are not labelled.  */


	
	

** Add variable labels

/* Take a look on the right hand side of the Stata window. You can see that 
	none of the variables have labels (just names). Take a look back at the 
	right hand corner of the window to see what these commands do.  */

	tab femp  
	
	label variable femp "Wife's employment status" 
	
	tab femp


	tab mune
	
	label variable mune "Husband's employment status"
	
	tab mune
	
	
/* 	Please add a label to the age variable indicating that this is age in years.

	Please add a label to the time variable indicating that this is hours of 
	work per day.
	
	Write your code below.     */
	
	



 
** Add value labels

/* If we look at the femp variable we know that responses take on two values
	1 and 0 but we don't know what these numbers mean. We need to add value
	labels.
	
	Here we create a label which says that 0 means 'Not Working' and 1 means
	'employed'. The label is called femplabel (but we could call it whatever 
	we want).
	
	We then stick this label to the femp variable.   */

	tab femp

	label define femplabel 0 "Not working" 1 "Employed" 
	
	label values femp femplabel
	
	tab femp
	
	
/* Please repeat this process for the mune variable. This time we want 0 to
	indicate 'employed' and 1 to indicate 'unemployed' .  */
	
	

	
** Renaming Variables

/* If we want to change the name of the 'age' variable to 'ageyrs' we use the
	code below.  */
	
	rename age ageyrs
	
	
* Let's change it back.

	rename ageyrs age

	



	
** Recoding Variables


/* The simplest way to recode a variable is with the recode command. However,
	this is problematic as we never want to overwrite our original data, so it
	is almost always best practice to create a new variable based on the 
	original variable, then recode it leaving your original variable untouched.
	
	Here we create a new variable called 'fempnew' which is exactly the same 
	as the 'femp' variable. 
	
	We then change the value 0 to 2 and 1 to 3  */
	
	tab femp
	
	gen fempnew = femp
	
	recode fempnew (0 = 2) (1 = 3)
	
* Notice we use one = as we are saying '0 becomes 2'


	tab fempnew
	
* We will have to add new value labels

	label define fempnewlabel 2 "Not Working" 3 "Employed"
	
	label values fempnew fempnewlabel
	
	tab fempnew
	
* We should also give this new variable a label

	label variable fempnew "New wife's employment variable"
	
	tab fempnew

	
	
* To avoid confusion lets get rid of this new variable.	
	
	drop fempnew
	
	

	
	
** Recoding a Continuous Variables to a Categorical Variable


* Here we create a new variable which categories age into four categories

	summ age

* We first create a new variable 'agecat' which is the same the 'age' variable	
	
	gen agecat = age
	
	
* We put ages 18 to 30 in category 1, 31 to 40 in category 2 and so on.
	
	recode agecat (18/30=1) (31/40=2) (41/50=3) (51/60=4)
	
* We add a value label.
	
	label define agecatlabel 1 "18-30 yrs" 2 "31-40 yrs" 3 "41-50 yrs" 4 "51+ yrs" 

	label values agecat agecatlabel
	
* We give the variable a label

	label variable agecat "Age Categorised"
	
* You have now recoded age into four categories of age.

	tab agecat
	
	
/* Repeat the process above to create a variable called 'age5cat' which 
	categorises age into the following 5 categories.
	
	1 - respondents age 21 and under
	2 - respodents age 22 to 35
	3 - respondents age 36 to 46
	4 - respondents age 47 to 59
	5 - respondents age 60 only                                           
	
	Write your code below.                                                   */
	

	

	
	
	
	
	



**  Computing Variables


* We want a new variable called 'age2' to indicate age squared.

	summ age
	capture drop age2
	gen age2 = (age^2)
	summ age2
	
/* The capture drop command is useful for keeping an organised workflow.

	If we used the command 'drop age2' this would be asking Stata to drop a 
	variable called age2. We would want to do this if we are creating a
	variable called age2.
	
	However there may or may not be a variable called this in the data set.
	
	If we ask Stata to drop age2 but there is no variable of this name it will
	stop and give you an error message.
	
	Starting this command with 'capture' tells Stata, if there is a variable
	called age2 please drop it, but if there isn't don't worry about that 
	and just carry on.
	
	This is useful when you are developing a file.  */
	
	
* Here we create a variable for ageplus which is age plus 10.

	summ age
	capture drop ageplus
	gen ageplus = age + 10
	summ ageplus

* You can also use * multiply or / divide when producing new variables.






/* The 'gen' command we have used above is useful for many basic functions.

	For computing more complex variables we can use the egen command (this 
	stands for 'extensions to generate').  
	
	Here is a more complex example of computing a new variable using egen:
	
	
	In this data set the same individuals appear multiple times.
	
	We can see this by looking at the case variable which is the personal
	identifier number. 
	
	Many people are interviewed  14 times.       */
	
	
	
	tab case
	
/* We want to create a variable which indicates each respondent's average work
	hours over all the times we have observed them. */

	capture drop averagehours
	
	egen averagehours = mean(time), by(case)
	
	label variable averagehours "Average Work Hours"
	
	tab averagehours
	
	list case time averagehours in 1/25
	

	
	
/* Here we create a variable which indicates the minimum age the respondent
	was when we started interviewing them.   */
	
	capture drop minage
	
	egen minage = min(age), by(case)
	
	label variable minage "Minimum Age"
	
	tab minage
	
	list case age minage in 1/25
	
	
	
	
	
/* Here we create a variable which indicates whether the respondent's 
	husbands were unemployed at any of times we observed them.   */
	
	capture drop husunemployed 
	
	egen husunemployed = max(mune), by(case)
	
	label variable husunemployed "Husband Ever Employed"
	
	label define husunemployedlabel 0 "Never Unemployed" 1 "Yes"
	label values husunemployed husunemployedlabel
	
	tab husunemployed
	
	list case mune husunemployed in 46/76
	
	
	
* Clear the data from memory

	clear
		
* Clear the screen

	cls
	

	
/* 	Download the Crime Survey for England and Wales, 2013-2014: Unrestricted 
	Access Teaching Dataset (SN8011) from the UK Data Archive. Here:
	
	https://tinyurl.com/yy8bpxhb
	
	You will be able to download this data set without registering.
	
	Make sure you download the Stata version of this file.
	
	
	Please undertake the following activities:
	
	(1) Recode the agegrp7 variable to 4 age categories
	
		1 = 16-34
		2 = 35-54
		3 = 55-74
		4 = 75+
		
		Ensure you don't overwrite the original variable.
		Make sure this variable and its values are properly labelled.
		
	(2) Create a variable which indicates whether the respondent has a
		has a degree (1) or not (0).
		
		Ensure you don't overwrite the original variable.
		Make sure this variable and it's values are properly labelled.
		
	(4) Recode the variable indicating how safe respondent's feel walking
		alone after dark so the 'don't know' response is coded as missing.
		
	(3) Create a contingency table of sex and how safe respondents feel
		walking alone after dark (with your new variable).
		
	(4) Undertake a chi-square test and estimate Cramer's V for this table. 
	
	(5) Spend a little time practicing analysis of this data set using the 
		commands we have covered so far.                                     */
	

	
	
	
	
	
	





********************************************************************************

*         	               M A N A G I N G   F I L E S                  	   *

********************************************************************************



** Appending Files

/* Sometimes we have data files which contain the same information but for
	different groups of participants. For example a group of researchers 
	undertaking surveys in England, Scotland and Wales may have separate files
	for each territory. 
	
	Each file will contain the same variables, but will contain responses from
	different respondents.
	
	To add these cases together into one file we want to 'append' the files. 

	Open the 'ghs95male.dta' file and the 'ghs95female.dta' file and spend a 
	little time exploring them.
	
	These files contain the same information but one only contains data for
	male respondents and one only contains data for female respondents.
	
	The code below adds these two files together.                         
	
	Remember you will need to change the locations to match the locations of 
	these datasets on your machine.											*/
	
	
	use "H:\Data\ghs95male.dta", clear
	
	tab sex
	
	count
	

	use "H:\Data\ghs95female.dta", clear
	
	tab sex
	
	count
	
	
* Open the male respondent's file


	use "H:\Data\ghs95male.dta", clear
	
	
* Append the female respondent's file 

	append using "H:\Data\ghs95female.dta"

	
* We have now added these two files togeher

	tab sex
	
	count


/* If we wanted to use this file again we would save it now (with a new name).
	But we will clear these data from Stata.                                */


	clear	
	
	cls
	
	
	
** Merging Files

* One to one matching

/* The workshop materials contain three datasets called 'merge1' 'merge2' and
	'merge3'.
	
	Open each of these files in turn and spend a little time exploring their
	contents.
	
	You will see that each data set shares a common variable 'id' this is 
	a unique identifier that identifies each respondent.
	
	In addition to this variable each data set contains a different selection
	of information.															*/
	
	
	use "H:/Data/merge1.dta", clear
	
	
	use "H:/Data/merge2.dta", clear
	
	
	use "H:/Data/merge3.dta", clear
	
	
/* 	We want the data from each of these three files to appear in the same
	data set. We do this by merging the files together. We can link data 
	from each data set using the id variable. Each id variable refers to one
	respondent only so this is called one to one (1:1) matching.        
	
	First we link the first data set to the second data set. 				*/
	
	
	use "H:/Data/merge1.dta", clear
	
	merge 1:1 id using "H:/Data/merge2.dta"
		
	
/*  Stata automatically creates a new variable when it merges files, called
	_merge and it automatically tabs this for us. We can see that all cases
	are matched between these two files.     
	
	We are now going to merge with the third data set. 
	
	Before we do this we will drop the _merge variable. Stata will create 
	a new _merge variable when we merge again.                               */
	
	capture drop _merge
	
	merge 1:1 id using "H:/Data/merge3.dta" 
	
/* Again we see that all cases have merged (i.e. all cases are present in both
	datasets.      
	
	We drop _merge                                                         */
	
	drop _merge

/* Take a look at the data, all variables from the three files are now in one
	data set.                                                             
	
	If we wanted to keep this file we would save it now. But we don't require 
	these data again so we clear Stata.                                    	*/
	

	clear
	
	cls
	
	

	
	
/* 	Here is a slightly more complex example. Take a look at the 'merge1miss'
	and 'merge2miss" files. These files are similar to the files above, each has
	the unique identifier 'id'. But not all cases appear in both of these
	files. Open the files and explore them.    
	
	We can count the number of people in each file using the 'count' command. */
	
	
	use "H:/Data/merge1miss.dta", clear
	
	count
	
	
	use "H:/Data/merge2miss.dta", clear	
	
	count
	
/* There are 196 cases in the first file and 197 in the second. We merge
	them together. It is a one to one merge using the id variable.           */
	
	
	use "H:/Data/merge1miss.dta", clear
	
	merge 1:1 id using "H:/Data/merge2miss.dta"	
	
	
/* This time the table of the _merge variable is a little more complex. We can
	see that 194 cases were matched and 5 were not matched. Of those that 
	were not matched 2 cases appear in the master data file only (i.e. the one
	we opened first, merge1miss) and 3 appear in the using file only (i.e. the
	second file).
	
	We might decide to keep only those cases that appear in both files.      */
	
	tab _merge
	
	keep if _merge == 3
	
	capture drop _merge

	
* We clear Stata.

	clear
	
	
	
	
	

* Many to one matching

/* Sometimes we don't match information between unique cases. Sometimes we
	match many rows in one file to one row in another file. For example we
	might have a variable for region in our master data file, and many 
	respondents live in the same region. In out second file we have economic
	variables describing a region (e.g. unemployment rate). We would want to
	add the same region level variables to everyone in the same region. This
	is called a many to one merge (or if the files are in the other order, a 
	one to many merge).                             
	
	
	Here we use two practice data set from the web.
	
	The sforce data set provides a list of US regions and the names of sales 
	people who work in those regions. More than on person works in each
	region.
	
	The dollars data set provides data on sales and costs for each region.
	
	Spend a little time examining these data sets.                           */

	
	webuse sforce, clear	

	webuse dollars, clear

	
/* Here we merge together these two datasets by region. We merge many to one 
	(m:1) as there are multiple observations in each region.

*/
	
	merge m:1 region using http://www.stata-press.com/data/r15/dollars

	tab _merge
	
	drop _merge
	
	
/* If you examine the new data set you will see that the region level data
	has been added to each observation in that region.                       */






/* 	There are more complex operations that can be undertaken which involve
	merging files. This is particularly relevant when dealing with complex
	household panel studies or longitudinal studies. You may need to merge
	data between household members, or over time. You may also need to merge
	information from auxillary data resources (e.g. to code social class 
	measures using occupational codes and employment status information).
	
	ISER at the University of Essex provides a useful introduction to using the 
	complex UKHLS and BHPS data sets using Stata. This provides more
	advanced training in managing complex files. This resource is available
	here: 
	
	https://moodlex.essex.ac.uk/                                             */




* Clear data from Stata's memory.

	clear
	
* Clear your screen.

	cls





********************************************************************************
* END OF FILE
