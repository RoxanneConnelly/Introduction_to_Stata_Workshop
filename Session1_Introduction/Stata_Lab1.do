STOP
********************************************************************************
/*
					INTRODUCTION TO STATA WORKSHOP

							Lab Session 1

				Introduction to the Stata Environment
																			
																			  */
********************************************************************************




********************************************************************************

*         	       		G E T T I N G   S T A R T E D                    	   *

********************************************************************************
	

/*	This is your Stata .do file
	
	This is where you tell Stata what to do
	
	You will write commands in Stata language (i.e. Stata code)
	
	The files provided to you in this workshop will talk you through how
	to undertake various operations in Stata. By the end of this workshop
	you should be familiar with Stata, and will be able to carry out many
	basic operations using this software.
	
	If you run this file straight through it will not take much time, and you
	will probably learn very little. We encourage you to take your time, and to
	practice the commands shown in this file.
	
	We will be on hand for discussion and to answer any questions. Please feel
	free to ask any questions. The only silly question is the one you didn't
	ask.
	
	Have fun!																  */





**** COMMENTS

* You will notice that this text is green

* Green text is not telling Stata to do anything, it is comment

* To write a short comment you should start the line with a *

* Practice writing a comment below.
* Try writing without the * 
* You will see this appears in colour, as Stata doesn't know it is a comment.



/* If you want to write a long comment spanning many lines of your .do file you 
	can start with a forward slash and and * this tells Stata that this is a 
	comment until you tell Stata you have ended your comment like this. */
	

	
/* Comments are written for humans to help us understand what the Stata code 
	is doing. Well written .do files will contain lots of comments. This is
	useful when learning Stata, but also when you are carrying out a project
	as you will want to remember what you have done and why. You will also 
	want other people to be able to easily understand your analysis when you
	share your .do file with them. It is good practice to make your .do file 
	available when you publish research. */
	
	
/* We recommend that you make your own comments throughout this file to remind
	yourself what the commands you are introduced to do. You can save
	your .do file by clicking on the floppy disk above, or by pressing Ctrl and s
	We recommend that you save your .do file regularly. */
	
	
	
	
	
***** COMMANDS	

* Learning Stata is like learning a new language.
* You need to tell Stata what to do in 'Stata language'.
* One of the benefits of Stata is that it's language is relatively intuitive.

* For example we might ask Stata to display something on its screen.
* Below we ask Stata to display the word "hi" on it's screen.
* You will see the required code highlighted in blue and red below.
* To run this code, highlight it and press Ctrl and d


	display "hi"
	
	

/* Take a look in the Stata window and you will see Stata has printed this code
	as well as the word "hi" below. */
	
	
	
* You can also use the display command to undertake calculations.

* Try running each line of code below and note what they do.
* Highlight each line individually, and press Ctrl and d.
* Then take a look at the Stata window to see what has been done.



	display 4 + 1

	display 2 * 12

	display 100/20
	
	
	
	
/* Take a look back up at the very top of this file. You will notice that 
	line 1 of the file contains a command 'STOP' (you can tell it is a 
	command and not a comment because it isn't green). 
	
	Try running this command.
	
	You will see that Stata tells you this command is unrecognised.
	
	This is not a mistake.
	
	To run a command in Stata you press Ctrl and d but if you press Ctrl and r 
	accidently Stata will run the .do file through from the start to the end. 
	This can be a little distruptive if not intentional. Including this 'fake' 
	command at the top of your file ensures Stata will trip up on line 1 and 
	stop if you were to accidently press Ctrl and r        */


* Lets clear the screen (run the command below)

	cls
	

	
* Save your do file (press ctrl and s)	
* Remember to add your own comments to this file and save it regularly.

	




**** OPENING DATA

/*	Now that you have a feel for Stata lets open some data.

	There are many ways you can open data in Stata:
	
	- You can open example data files for practice / learning which are 
		stored in the Stata programme.
		
	- You can open data stored on websites from directly within Stata.
	
	- You can open data from a file on your computer.  */



*** Opening practice data.


* Run the code below to open a practice data set called 'auto'.


	sysuse auto 


/*	Auto is one of the practice data sets stored within Stata.

	This is a data set continaing information about cars.
	
	Take a look at the right hand side of the Stata window. You can see a 
	list of all the variables included in the data set, and a short description
	of this variable (i.e. their label).
	
	We can see that there is a variable called 'make' which contains information
	about the make and model of the car.
	
	We can make a table summarising the 'make' variable using the code
	below.             */

	table make
	
	
/*	Take a look at the Stata output window to see the makes of cars in this 
	data set. */



/*	We can make a table that summarises the miles per gallon of the cars in 
	this data set using the 'mpg' variable.  */	
	
	table mpg
	
*	We can see that 9 cars get 18 miles to the gallon, and 1 gets 41.





/*	We can actually shorten this code. If you didn't want to write out the
	full word 'table' you can just write 'tab' and it will work the same. */

	tab mpg
	
* You might here people say 'tab a variable', this is what they mean.



/* Whenever you are unsure of how to do something in Stata a simple way
	to find help is to ask Stata. Stata has very rich help files which
	tell you how to use commands and provide examples. If we required help
	with the tabulate command we could ask for help using the code below.  */

	help tabulate

	
	
	
/* In the pop up window click on tabulate oneway (the simplest usage).
	
  Stata will now open a page which tells you all about the tabulate command. 

  Near the bottom of this page there will be examples of the use of tabulate. 
  
  Close the help file window.                                              */



/* If you want to tabulate several variables at once you can use the tab1 
	command followed by the names of the variables you want to tab.	
	
	Stata will produce a separate table for each variable listed.   */
	
	
	tab1 make mpg foreign





*** Browsing the Data


/*	You have the auto data set open, but you might be thinking to yourself
	'but where is the data?' can't I see it?
	
	Yes, you can take a look at the spreadsheet which contains all the 
	numbers. Just above the Stata window, on the lefthand side, you will see
	a series of icons. There is one that shows a table with a magnifying 
	glass. Click on this, this will allow you to view your data in its 'raw'
	state. Close the data window after you have looked at your data (if you 
	fail to close the window this might prevent you from running commands).
	
	Next to this icon you will see an icon showing a table with a pencil this
	window also opens the data (try it) but it will also allow you to enter 
	and change numbers. We recommend that you never do this, and you should
	never need to open a window that allows you to manually edit values. When
	you enter data, and edit your data you should always do this via code
	which provides a paper trail of everything you have done.
	
	If you need to look at the data make sure you click on the icon that only
	allows you to browse the data (magnifying glass) and not edit the data
	(pencil).
	
	
	You can also open the data set in browse mode using the command 'browse',
	make sure to close the data window after you have used it.   */

	browse




	
	
	

*** Accessing Data from the Web


/*	Accessing these practice data sets are useful when you want to practice
	how to complete a given task. There are further Stata data sets that 
	can be accessed from the web. To open these data sets we use the command
	'webuse'.
	
	Here we access a data set on life expectancy from a website.   */

	
	use "http://www.stata-press.com/data/r13/lifeexp"
	
	
	
	
/*	Take a look at the right hand side of the data window and you will see the 
	the variables in this data set. 
	
	Take a look at the data view window to see the spreadsheet containing
	these data (remember to close it after you are done).
	
	Explore these variables using the 'table' command. 
	
	Write your code below.  */











*** Opening Data from Your Computer

/* You can open a Stata data file that is stored on your computer. In order
	to do this you will need to tell Stata the location of this file. The
	location you give will needs to match exactly the location where the file
	is stored, or Stata will not be able to find it.
	
	For example if your data file is stored on your H: Drive in a folder called
	Data, and the file was called 'surveydata' it's location would be:
	
	H:/Data/surveydata.dta
	
	If you gave the location as:
	
	H:/DATA/surveydata.dta
	
	Stata would not be able to find your file as it is looking for a folder
	on your H: Drive called DATA not data (i.e. it needs to be exact).
	
	We have recommended that you save the workshop materials on a memory stick 
	or on your 	H: Drive. Navigate to where you have stored your files to 
	check their location. Make a note of this location.
	
	YOU WILL NEED TO CHANGE THE LOCATIONS GIVEN IN THE CODE BELOW TO MATCH THE 
	LOCATION WHERE YOUR FILE IS STORED ON YOUR COMPUTER.  */


	
	
	

/*  We open the 'present.dta' data file using the 'use' command, followed by 
	the location of the file. After the location we add a comma and the word
	'clear'. This tells Stata that if there is already a data file open, we
	want to close it (or clear it from Stata).  */

	use H:/Data/present.dta, clear

	
	
	
/* If your file doesn't open, it most likely reason is that your file location
	is incorrect.
	
	Now that you have the 'present.dta' data set open have a look at the data
	using the 'browse' command.   */

	
	browse
	
	
	
* Another way to examine a data set is to ask Stata to show you its 'codebook'.

	codebook
	
* You can also ask for a shortened 'codebook' by adding the 'compact' option

	codebook, compact
	

	
	
/* Examine the variables in the dataset using the tabulate command.
	
   Note that Stata is case senstitive. If the variable is called Age and 
	you refer to it as age, Stata will give you an error message.
	
   Write your code below.   */
	

	

	
	

	
	
* Close this data set using the 'clear' command.

	clear
	
	
* Open the data set again (try to do this from memory). Write your code below.
	
	
	

	
	
/* The variables in this data set are not categorical so it would make sense
	to explore these variables using descriptive statistics such as mean,
	median.  */




* The 'summarize' command gives you a range of information:

	summarize Age

	
* Alternatively you can use the 'tabstat' command:	
	
	tabstat Age
	
* On its own 'tabstat' only tells us the mean.
* But we tell Stata to add to this.
* Here we add the count (total n), the range of values and the median.
	
	tabstat Age, stat(count range median)
	
	
	

	
	


**** SAVING DATA

/*  You should have the 'present.dta' data set open. If you were working on
	your own data analysis project you might have created new variables or
	recoded variables and you would want to save a new version of this file.
	
	Note, you should never overwrite your original data file.
	
	We will save a new version of the file 'present' called 'present_v1' using
	the code below.
	
	Remember to change this location to the location where you have saved your
	files.  */

	
	save H:/Data/present_v1.dta, replace
	

* Check the location where you asked this file to be saved and you will see it.




	

**** DELETING DATA

/* Sometimes we have saved data files which we no longer require. We can 
	erase data files using the 'erase' command.  */

	
	erase H:/Data/present_v1.dta
	
	
* Check the location and you will see this file is gone.






**** ENTERING DATA

/* Here we demonstrate how to enter a simple piece of data into Stata.
	
	We start by clearing any data that is currently open.	*/


	clear
	

/* In the next piece of code we tell Stata the two variables we are going to
   input. We then add the values. We tell Stata we are finished by adding 'end'.
	
   You will notice that Stata adds a little bar along the left hand side of
   this chunk of code. This tell you that you need to highlight this whole
   block of code to run it.
	
   Here we enter the ages of ten sets of married couples. We have two 
   variables 'wifeage' and 'husbandage'.
	
   Highlight from input down to end and press Ctrl and d to enter these data. */
   
   
	
	input wifeage husbandage
	32 33
	26 67
	34 40
	39 39
	29 28
	22 25
	21 22
	21 21
	34 35
	36 38
	end
	
	
	
* Take a look at your data. Close this window after you have looked.

	browse
	
	
	
/* Take a look at the right had side of the Stata window.
	
   You will notice that we have entered the data but our variables are not 
   labelled. 
	
   Here we will add labels to these two variables. This gives us a little
   more information about what information this variable contains.   */

   
	label variable wifeage "Wife's Age in Years"
	
	label variable husbandage "Husband's Age in Years"
	
	
* You will see these labels have been added.




* Explore these two variables using the table, summarize, and tabstat commands.
* On average, are the wives older or younger than the husbands?







* Save this file using a filename of your choice. Write your code below.








* Actually we won't need this file again.
* Delete this file. Write your code below.








/*  Note: you would not want to input the data from a large data set using 
	this method.
	
	In daily practice we rarely input data directly in to Stata. Most often
	we undertake research using existing data resources.
	
	If you collected data you can enter it manually by opening the data edit
	window and typing in the data (very carefully). You can open this window 
	using the 'edit' command. Close this window after you have explored this
	window. */

	edit


/*
	If you collected data online, or have existing data in another file
	format, Stata is capable is reading in a range of data file types
	including Excel Files, SPSS Files and Tab Delimited Files. 
	
	We will not cover these scenarios in this lab, but there are a number of 
	online help resources which talk you through the process of importing
	various file formats into Stata.
	
	Excel: https://tinyurl.com/yybpynjp
	
	SPSS: https://tinyurl.com/yyjpdwkr                              */
	


* Clear any data from Stata's memory

	clear


* Clear the screen

	cls



********************************************************************************

*         	        B A S I C   D A T A   A N A L Y S I S                	   *

********************************************************************************


/*  You will already be getting a feel of the Stata environment and you have
	already produced some basic descriptive statistics. Here we demonstrate how
	to produce some basic univariate and bivariate statistics (most of this
	should be familiar to you).

	First open the data file 'ghs95.dta'. This is an extract of an a 'general
	household survey'.   */
	

	
* Write the code to open the 'ghs.dta' file below.

 


 
 

*** UNIVARIATE TECHNIQUES



** Categorical Variables


	tabulate sex
	
	tab sex
	
	
	
/* You have seem the tabulate command before. You will notice you can see the
	labels for the two sex categories. But you might not see what numbers are
	associated with these labels. To add the numbers run the command below.
	This will ask Stata to show the catgory numbers for the sex variable. */
	
	
	numlabel sex, add
	
	tabulate sex
	
	
/* You you want to add numbers to categories for all categorical variables in
	the data set you can use the command below.  */
	
	
	numlabel _all, add
	
	tabulate typaccm
	
	tabulate centheat

	
	
/* Not all values in this data set are appropriately labelled! We will come to
	that problem later.  */
	
	
	
* We can list the sex of the first 25 cases in the sample.


	list sex in 1/25

	
	
* Or the sex of the 25th to 55th person.


	list sex in 25/55


	
	
	
	
	
** Continuous Variables

/* Take a note of what each of these commands do. They are each exploring the 
	variable 'workhrs'.  
	
	You will notice when you list workhrs that there are some non-numeric
	variables (e.g. .c) these are missing values. We will return to this 
	later.  */

	
	summarize workhrs
	
	list workhrs in 1/40
	
	histogram workhrs

	graph box workhrs 

	ci means workhrs
	
	tabstat workhrs, stat(count min max range)
	

	
	
	
** One categorical variable, one metric

	table soclase
	
	summarize thhy

	tabstat thhy, by(soclase) 
	
	tabstat thhy, by(soclase) stats(n mean sd)



	
	

	
*** BIVARIATE TECHNIQUES	




* A contingency table (two variables) 

	tab soclase genhlth 
	
	
* A contingency table with row percentages

	tab soclase genhlth, row
	
	
* A contingency table with column percentages

	tab soclase genhlth, col

	
* A contingency table with column percentages and a chi-square test

	tab soclase genhlth, col chi
	
	
/* There are 12 degrees of freedom, the chi-square value is 153.6362 and
	this test is significant (p<0.05).  */
	
* A contingency table with column percentages, a chi-square test and Cramer's V.

	tab soclase genhlth, col chi V	

	
* You might want to check the expected frequencies in each cell of your table.

	tab soclase genhlth, expected	
	
* There are quite small expected frequencies for those in the armed forces.



	
	
	
	
	
	
* A T-Test

	ttest workhrs, by(sex)
	
/* 	We find a significant difference in the mean work hours of men and women.

	We might also want to find a measure of effect size for this t-test 
	(e.g. Cohen's d).  */


	esize twosample workhrs, by(sex)
	
* We find a large effect size.






* An ANOVA


	anova workhrs genhlth 
	
/* 	There is not a significant difference in mean workhors by general health
	(p=0.1076).

	If the ANOVA were significant we would want to look at an effect size 
	measure such as eta-squared. 
	
	Note you must ensure you run the command below after you have run the anova
	command. Stata is using details from the anova in it's memory to estimate
	the effet sizes. */

	
	estat esize 
	
* We observe a small effect size (as expected).


	

	
	
	
* Pearson Correlation	
	
	
	pwcorr workhrs age
	
/* We can see age and workhours are not strongly correlated. The value of
	Pearson's r is 0.0248. To find the significance of this correlation we
	can add the 'sig' option to the code.   */
	
	
	pwcorr workhrs age, sig

/* These two variables are not significantly associated (p = 0.2080)

	We will cover graphs later, but lets take a quick look at the 
	scatterplot. */
	
	
	scatter workhrs age

* Close the graph window before you move on.









*** Multivariate comparisons 



** Three categorical variables

	sort sex
	by sex: tab soclase genhlth, col chi V
	
* This code has run two analyses, one for each category of the sex variable.



** Two categorical variables and one continuous variable

	sort sex
	by sex: table soclase, c(mean thhy sd thhy n thhy) 
	
* This code has produced descriptive statistics of income by social class for
* men and women.	
	
	

	
	
	
	
	
*** Subsample Operations	
	
/* We want to know the average work hours of those age 21 to 30.

	>= means greater than or equal to
	<= means less than or equal to
	
   We are asking Stata to summarize the variable workhrs if age is greater
   than or equal to 21 and age is less than or equal to 30.  */

   
	summarize workhrs if (age>=21)&(age<=30)

	
/* We want to know the average work hours for those age 35.

	= on its own does not mean 'equals', it means 'becomes equal to'
	== means equals
	
	This is important to Stata.  */
	
	
	summarize workhrs if (age==35)
	

* We could calculate the average work hours for those younger than 65.


	summarize workhrs if (age<65)
	
	
/* We could calculate the average work hours excluding those age 16.

	!= means 'not equal to'
	
	Here we ask Stata to summarize work hours when age is not equal to 16. */
	
	
	summarize workhrs if (age!=16)








/* If there is time remaining please practice the techniques introduced above
	with different variables in the 'ghs95.dta' data set.  */





	
	
	
	
	

* Clear data from Stata's memory.

	clear
	
* Clear your screen.

	cls



********************************************************************************
* END OF FILE
