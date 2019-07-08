STOP
********************************************************************************
/*
					   INTRODUCTION TO STATA WORKSHOP

							Lab Session 4

							Tables and Graphs
																			
																			  */
********************************************************************************






********************************************************************************

*            P U B L I C A T I O N   R E A D Y   T A B L E S                   *

********************************************************************************



/*

	A benefit of working in a Stata is the combination of accessability with 
	functionality.

	Part of this includes the ability to produce publication ready tables...

	Or at least tables that require only minimum alteration. 

	asdoc is one of the most powerful tools that enable this.

	As well as running 'help asdoc' in Stata to access documentation there are 
	also an array of online help resources for asdoc.

	https://tinyurl.com/y578fo86
	
	http://fintechprofessor.com/2018/02/23/use-asdoc-basic-example/
	
	https://www.youtube.com/channel/UCXYdNPOmk6BdW1RwrxswLfQ/playlists
	
	https://fintechprofessor.com/2018/01/31/asdoc/



	Stata allows users to contribute user written commands to undertaken
	useful tasks. asdoc is one of these user writen packages (thank you
	Professor Shah).
	
	These commands are made available online and you have to install them 
	(don't worry this is easy). 
	
	On your home computer you would only ever need to do this once, but on
	a university computer you (might) need to do it every time you log in.
	
	When a new version of Stata is introduced they often 'suck in' high 
	quality user written commands and they are then made available as part of 
	the pacakge. 

	Here we install the asdoc package.										*/

	
	ssc install asdoc, replace
	

/* We now tell Stata where we would like to save the files with our
	tables. You should set this location to where you have been saving your
	files so far (e.g. your H: drive or memory stick).                      */
	
	mkdir H:/results

    cd H:/results
	
	

* A simple example
* using the Stata Auto dataset 

	sysuse auto

	asdoc summarize

/* Hopefully you will see a summary of all the variables in the auto data set.

	Below this you will see some blue text 'Myfile.doc' - click on this.
	
	A word file will open with a lovely table in it.			        */
	


	
	
	
	

*** Functionality: Append or Replace


* Basically, with append you can add a table to file that already exists

* With replace you wipe any table pre-existing in the file and replace it with
* the new table

* Close the Word.doc with the descriptive statistics 

* lets try the append/replace functionality

* By default asdoc will append


	asdoc corr

  * OR
  
	asdoc corr, append

* have the same outcome
   
* We now have a table of descriptives and a table of correlations


	asdoc corr, replace

* This example replaces the two tables with one table of correlations 





*** Functionality: Changing Filename

* Save our table as a .doc file called summary, instead of the default Myfile.doc 

	asdoc sum, save(summary.doc)
       
	* OR
	
* Save our table as a .rtf file
	
	asdoc sum, save(summary.rtf)


	
	
	
	

*** Functionality: Add a title to the table

	asdoc sum, replace title(Dave's Smart Table)

	
	
	
	
* t-test

	asdoc ttest mpg, by(foreign) append title(T-test - miles per gallon, by ///
	foreign/domestic)
   
  
  
  
  
* Chi-square  
 
/*
	Well, asdoc doesn't read out a chi-quare. For a bivariate association you 
	can simply read out the table and add the chi-square values to the table 
	manually or write a line of code to get adsoc to include the chi-square 
	result for chi-square. We'll use a different dataset for this.
	
*/
  
	clear

	webuse citytemp2

* A table of regions by age of people

	tabulate region agecat, col nofreq chi

* Read out the table, with a title and add the chi-square result with a line of text

	asdoc tab region agecat, replace col nofreq title(Chi square - age by region)
																	
	asdoc, text(Pearson Chi2 = 61.2877, Pr = 0.000, df = 6) append

	
	
													
*** REGRESSION


/*
	asdoc really comes into its own when reading out the results of statistical 
	models. There are alternatives to asdoc avaiable but the simplicity and the 
	sophistication of the adsoc output is exceptional.
	
*/

*** An OLS regression of car price with several explanatory variables

	sysuse auto, clear

	asdoc regress price mpg rep78 headroom,  stars replace

* Same table with a title	
	
	asdoc reg price mpg rep78 headroom, title(Table 1: Regression results) append

	
	
*** NESTING REGRESSIONS

* Make a nested table of four regressions
        
* Estimate the first regression
		
	asdoc regress price mpg rep78, nest replace

* Add the variable headroom to the model and then nest with existing table
        
	asdoc regress price mpg rep78 headroom, nest  append

* Add variable weight to the model and then nest with existing table
        
	asdoc regress price mpg rep78 headroom weight, nest append


	

/* Open the Crime Survey for England and Wales, 2013-2014: Unrestricted Access 
	Teaching Dataset and practice undertaking your own regression analyses and 
	preparing 'publication ready' tables.
	
	Remember the first place to find help are the Stata help files and
	asdoc also has an excellent website:
	
	https://fintechprofessor.com/2018/02/23/use-asdoc-basic-example/       
	
	https://fintechprofessor.com/2019/03/02/asdoc-version-2-3-3-new-features/
	
																			*/
	

		
		
				
		
		
********************************************************************************

*         				        G R A P H S                     			   *

********************************************************************************		
		
/* 
	Stata is also capable of producing very high quality graphs.
	
	A particularly useful online resource is available here:
	
	https://www.stata.com/support/faqs/graphics/gph/stata-graphs/
	
	Here you will practice producing a range of graphs, and you will get 
	accustomed to using Stata's graph options to get the graphs looking just
	how you'd like.
	
		
*/


* We will use Stata's auto example data:

	sysuse auto.dta, clear

* Add number labels:

	numlabel _all, add

* Take a look at the data:

	summarize


* A Simple Box Graph
* ==================

	graph box price



* A Simple Histogram
* ================== 

* Here is a simple histogram:

	histogram mpg



* Simple Plots of Functions
* =========================

	twoway function y=x, range(1 100)

	twoway function y=(x^2), range(1 20)

	twoway function y=cos(x), range(1 20)







* Pie Charts
* ==========

* Pie charts are not the best way to present patterns in data, and they have 
* many problems. But just incase you ever have a very good reason to produce
* them, here is how.

* Look at the variable rep78:

	tab rep78

* Make a pie chart of this variable:

	graph pie, over(rep78)

* Pick out category 2

	graph pie, over(rep78) pie(2, explode)

* Pick out category 4

	graph pie, over(rep78) pie(4, explode)

* Lets make the legend span only one line (these options I will show you
* will work in the same way for different types of graphs):

	graph pie, over(rep78) pie(4, explode) legend(row(1))

* Or maybe we want the lengend in three columns:

	graph pie, over(rep78) pie(4, explode) legend(col(3))

* Or maybe we want the legend in one column:

	graph pie, over(rep78) pie(4, explode) legend(col(1))

* Lets keep the legend in one column but more it to the side. Position works
* like a clock. With 12 at the top and 6 at the bottom. We want to place the
* legend at 3 O'Clock:

	graph pie, over(rep78) pie(4, explode) legend(col(1) position(3))

* Write the code to position the legend at the left hand side:







* A Simple Bar Chart
* ==================

* A graph of miles per gallon over foreign car:

	graph bar (mean)mpg, over(foreign)

* An alternative version of the bar chart (horizontal bars):

	graph hbar (mean)mpg, over(foreign)

* We might want to change the colours of the bars:

	graph hbar (mean)mpg, over(foreign) ///
	bar(1, color(green))
	
* Or we want to bars to be different colours:

	graph hbar (mean)mpg, asyvars over(foreign) ///
	bar(1, color(green)) bar(2, color(navy))

* There are various other colours and formatting in the graph. We could 
* change these individually but a more efficient way is to use one of Stata's
* preset 'schemes'.

* Take a look at Stata's schemes here:
* https://www.stata.com/manuals13/g-4schemesintro.pdf


* A useful scheme to know is s1mono. In reports and outputs you are generally
* not allowed to use colour in printing. s1mono is pure black and white:

	graph hbar (mean)mpg, asyvars over(foreign) scheme(s1mono)

* Take a look at some different schemes:

* Try economists

* Try s2color

* Many schemes and the Stata default have a blue background. Graphs look nicer
* with a clean white background. s1color does this automatically.

	graph hbar (mean)mpg, asyvars over(foreign) scheme(s1color)

* If you want all graphs in a session to use the same scheme you can set the 
* scheme, and all the graphs you run will use this scheme unless you tell
* Stata otherwise

	set scheme s1color




* Remember graphs should stand alone. You do this by making sure that your
* graphs are effectively labeled with enough detail for your reader to 
* interpret the graph.


* Lets add a title:

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon")
	
* Lets add a subtitle:

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon") ///
	subtitle("For Domestic and Foreign Cars")
	
* If titles are long you can make them span 2 (or more lines):

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon") ///
	subtitle("For Domestic" "and Foreign Cars")
	
* You can change the size of the font:

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(large)) ///
	subtitle("For Domestic and Foreign Cars", size(med))

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(huge)) ///
	subtitle("For Domestic and Foreign Cars", size(med))

* You can see a list of Stata font sizes here:
* https://www.stata.com/manuals13/g-4textsizestyle.pdf

* You can add a note to the graph to indicate the dataset or any other details:

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(huge)) ///
	subtitle("For Domestic and Foreign Cars", size(med)) ///
	note("Note: Auto Data")
	
	
* We can change the font that is used in the graphs. Lets change it to
* Times New Roman:

	graph set window fontface "Times New Roman"

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(huge)) ///
	subtitle("For Domestic and Foreign Cars", size(med)) ///
	note("Note: Auto Data")

* Lets change the text back to Arial:
	
	graph set window fontface "Arial"

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(huge)) ///
	subtitle("For Domestic and Foreign Cars", size(med)) ///
	note("Note: Auto Data")

* We could add the actual values of the mean to the bars. I think this is 
* often superfluous. But some people like it.

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(huge)) ///
	subtitle("For Domestic and Foreign Cars", size(med)) ///
	note("Note: Auto Data") ///
	blabel(bar, pos(center) format(%3.2f) size(huge))


	
* The legend has a border around it, we might like to remove this:	
	
	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(huge)) ///
	subtitle("For Domestic and Foreign Cars", size(med)) ///
	note("Note: Auto Data") ///
	blabel(bar, pos(center) format(%3.2f) size(huge)) ///
	legend(region(lwidth(none)))

	
* Once you have got your graph as you like it, you want to save it.

* You must make sure that the graph window is still open when you run the
* graph export code.	

	graph hbar (mean)mpg, asyvars over(foreign)  ///
	title("Mean Miles Per Gallon", size(huge)) ///
	subtitle("For Domestic and Foreign Cars", size(med)) ///
	note("Note: Auto Data") ///
	blabel(bar, pos(center) format(%3.2f) size(huge)) ///
	legend(region(lwidth(none))) 
	graph export "H:/bar1.png", replace


	
* You can save Stata graphs in various different formats.
* See here:
* https://www.stata.com/help.cgi?graph_export
	
	
	
	
* Sometimes we would like to combine multiple graphs.
	
* Lets run a vertical and horizontal bar chart of miles per gallon over
* foreign:

	graph bar (mean)mpg, over(foreign) name(g1, replace)
	
	graph hbar (mean)mpg, over(foreign) name(g2, replace)

	
* Here we store each of the graph by giving them a name, this will enable
* us to call on them later.

* Make sure the graphs are both closed.

* We can ask Stata to display a graph that is stored in memory:

	graph display g1

	graph display g2
	

* Here we use graph combine to combine these two graphs (we give their names):

	graph combine g1 g2

* Lets add a title:

	graph combine g1 g2, ///
	title("Two Graphs Combined")

* We can save this as above (remember the graph needs to be open to save it):

	graph export "H:/combined.png", replace








* Scatter Plots
* =============

* Lets open a different version of the auto data:

	sysuse autornd, clear

* Look at miles per gallon:

	tab mpg

* Look at weight:

	tab weight

* A scatter plot:

	scatter mpg weight

* We can change the x and y labels. We change them here the original labels
* (attached to the variables) are proably nicer:

	scatter mpg weight, ///
	xtitle("WEIGHT") ytitle("MPG")
		
		
* Add a title and note to this graph:






* We can also add a line of best fit to a scatter plot:

	scatter mpg weight || lfit mpg weight





/*	Jitter is sometimes a useful command to apply to a scatterplot.

Scatter will add spherical random noise to your data before plotting 
if you specify jitter(#), where # represents the size of the noise as 
a percentage ofthe graphical area.  

This can be useful for creating graphs of categorical data when, 
were the data not jittered, many of the points would be on top of each other, 
making it impossible to tell whether the plotted point represented 
one or 1,000 observations.

For instance,  mpg is recorded in units 
of 5 mpg, and weight is recorded in units of 500 pounds.  
A standard scatter has considerable overprinting
multiple points are in the exact same spot                               */


	scatter mpg weight


/* There are 74 points in the graph, 
even though it appears because of overprinting as if there are only 19.
Jittering solves this problem.                                          */

	scatter mpg weight, jitter(7)



* Increasing the jitter value creates more random noise:

	scatter mpg weight, jitter(20)

	
* Reducing the jitter value creates less random noise:

	scatter mpg weight, jitter(2)





* Line Plots
* ==========

* Lets use some US life expentancy data:

	sysuse uslifeexp, clear

	
* We can produce a line graph of life expectancy for white and black males:

	graph twoway line le_wmale le_bmale year, legend(col(1) pos(6))

	
* If you are puzzled by the dip prior to 1920 just Google "US life expectancy 1918"


* Alternative versions of the legends:

	graph twoway line le_wmale le_bmale year ///
            , title("U.S. Life Expectancy") subtitle("Males") ///
              legend( order(1 "white" 2 "black") )

	graph twoway line le_wmale le_bmale year ///
           , title("U.S. Life Expectancy") subtitle("Males") ///
             legend( order(1 "white" 2 "black") ring(0) pos(5) )


* Altering line colour:

	graph twoway (line le_wmale le_bmale year , clcolor(maroon navy) ) ///
           , title("U.S. Life Expectancy") subtitle("Males") ///
	     legend( order(1 "white" 2 "black")) 

		 
		 
* Altering the line pattern:

	graph twoway (line le_wmale le_bmale year , clpatter(dash dot) ) ///
           , title("U.S. Life Expectancy") subtitle("Males") ///
	     legend( order(1 "white" 2 "black")) 

		 
		 
* Altering the line width:

	graph twoway (line le_wmale le_bmale year , clwidth(thin thick) ) ///
           , title("U.S. Life Expectancy") subtitle("Males") ///
	     legend( order(1 "white" 2 "black")) 

		 
		 
* An aspect ratio greater than 1 creates a tall skinny graph:
	 
	graph twoway (line le_wmale le_bmale year , clwidth(thin thick) ) ///
           , title("U.S. Life Expectancy") subtitle("Males") ///
	     legend( order(1 "white" 2 "black")) ///
		 aspectratio(1.3)
		 
* An aspect ratio less than 1 creates a shorter fatter graph:

	graph twoway (line le_wmale le_bmale year , clwidth(thin thick) ) ///
           , title("U.S. Life Expectancy") subtitle("Males") ///
	     legend( order(1 "white" 2 "black")) ///
		 aspectratio(0.5)

		
		
		

* A Catplot
* =========

/*  I find catplots really useful for graphing categorical variables (which 
	are quite common in social science).

	You will need to install this command, it is written by Profesor Nick Cox
	(a Stata god).                                                           */

	ssc install catplot

* Lets set a new colour scheme:

	set scheme s1color

* Open the auto data:

	sysuse auto, clear

* A catplot:

	catplot rep78

* A more refined catplot:

	catplot rep78, blabel(bar, pos(base) size(4)) bar(1, bfcolor(none)) ysc(off)


* Catplot for two variables:

	tab rep78 foreign

	catplot rep78 foreign

* With some format adjustments:

	catplot rep78 foreign, nofill

	catplot rep78, by(foreign) percent(foreign)

	catplot rep78, by(foreign) percent(foreign) recast(bar)

	catplot rep78 foreign, percent(foreign) bar(1, bcolor(blue)) ///
        blabel(bar, position(outside) format(%3.1f)) ylabel(none) ///
        yscale(r(0,60))


* A stacked catplot:

	catplot  rep78, over(for) stack asyvars  perc(for)	///
	blabel(bar, position(center) format(%3.1f)) ///
	legend(off)

		
		
* Create a variable for mpg greater than 25:

	capture drop himpg
	gen himpg = mpg > 25
    label def himpg 1 "mpg > 25" 0 "mpg <= 25", replace
    label val himpg himpg
	label variable himpg "High MPG"
	tab himpg

	
* Catplot of three variables:	

	catplot himpg rep78 foreign

	catplot rep78 foreign, by(himpg, col(1) note("")) subtitle(, pos(9) ///
        ring(1) bcolor(none) nobexpand place(e))

	catplot rep78 foreign, recast(dot) by(himpg, col(1) note("")) ///
        subtitle(, pos(9) ring(1) bcolor(none) nobexpand place(e))

	catplot rep78 foreign, recast(bar) by(himpg, row(1) note("")) ///
        subtitle(, pos(6) ring(1) bcolor(none) nobexpand)

	catplot rep78, var1opts(sort(1))
 
	catplot rep78, var1opts(sort(1) descending)




		 
				


* Example: Turning a Table into a Graph
* =====================================

/* Here we have some data from a table:

Employment Status, Young People (age 16-19) Great Britain 1974-81 
General Household Survey, Source Payne, Payne and Heath 1994 Table 3.1 

In this example we will turn these data in a graph, to help us interpret it.

*/

* Input the data:

	clear
	input year quals percent
	1974 0 8
	1974 1 5
	1975 0 13
	1975 1 7
	1976 0 21
	1976 1 8
	1977 0 24
	1977 1 8
	1978 0 23
	1978 1 9
	1979 0 19
	1979 1 8
	1980 0 27
	1980 1 12
	1981 0 39
	1981 1 16
	end




* Add labels to the variables:

	label variable year "Year"
	label variable quals "Qualifications"
	label variable percent "Percentage Unemployed"
	label define qual1 0 "None" 1 "Some"
	label values quals  qual1
	numlabel _all, add





* Take a look at the data:

	summarize




* Graph of the trend in youth unemployment. Look through this code and see
* if you can understand what each option does:

	graph twoway (scatter percent year if quals==1, msymbol(circle) mcolor(navy)) ///
             (scatter percent year if quals==0, msymbol(diamond) mcolor(green)) , ///
			 title("Percentage Unemployed by Qualifications and Year", ///
			 size(large) justification(center) ) ///
             subtitle( ///
			 "Young people (age 16-19) Great Britain 1974-81 GHS", ///
			 size(medsmall) justification(left) ) ///
             note("Calculated from Payne, Payne and Heath 1994 Table 3.1" ///
             "", ///
             justification(left) ) ///
             legend( order(1 2)   ///
            label(1 "Qualifications") label(2 "No Qualifications") ) 

* In the code above we tell Stata which marker symbols we want to use.

* To see the different marker symbols and colors you need to install
* the command showmarkers.

* This doesn't work using  ssc install

* Instead run:

	findit showmarkers

* Click on the link below 1 package found.
* Then click on install

* You can now view the marker symbols:

	showmarkers , over(msymbol) 

* Marker sizes:

	showmarkers , over(msize) 

* Marker colours:

	showmarkers , over(mcolor) 


* Reproduce the graph above with purple triangles and cyan squares as symbols.







* Bubble Plot (aka a scatterplot with weighted markers)
* =====================================================

* Data from the US census

webuse census, clear

* Scatter plot of number of deaths by median age:

scatter death medage, msymbol(circle_hollow)

* It is likely that many people full under each of these points. We could
* weight each point by the population size to make this clear.

scatter death medage [w=pop65p], msymbol(circle_hollow)

* Lets add titles and change the scheme:

scatter death medage [w=pop65p], msymbol(circle_hollow) scheme(s1mono) ///
	title("Median Age by Number of Deaths") ///
	subtitle("Weighted by Population Size") ///
	note("Note: US Census Data")




* Area Plot
* =========

* Time series data on gross national product over time:

webuse gnp96, clear

* Area plot of gnp by date:

twoway area d.gnp96 date

* With some titles added:

twoway area d.gnp96 date, scheme(s1mono) ///
	title("Gross National Product by Time") ///
	note("Note: Stata gnp96.dta example data") ///
	ytitle("Gross National Product")

	
	
	
	
	
	



	



* Graph of Regression Output
* ==========================

* Open the 'high-school_beyond.dta' data file.

	use "H:/high_school_beyond.dta", clear

* Lets run a regression model of maths test scores.

* We start with a model with three explanatory variables sex, ses and race:


	regress math i.female i.ses i.race, allbaselevels



* Here we will use the coefplot command.

	ssc install coefplot


* This command is written by Professor Ben Jann:

	help coefplot
	

* There is a very good website to help you with coefplot which provides a 
* lot of great examples:

* http://repec.sowi.unibe.ch/stata/coefplot/




* Here we make sure the variables are nicely labelled. Stata will use these
* labels when making the graph so this is important:

	label define sexlabel 0 "Male" 1 "Female", replace
	label values female sexlabel 

	label define seslabel 1 "Low" 2 "Medium" 3 "High", replace
	label values ses seslabel

	label define ethlabel 1 "Hispanic" 2 "Asian" 3 "African American" 4 "White", replace
	label values race ethlabel

	
* Run the regression again:

	regress math i.female i.ses i.race, allbaselevels


* Produce a coefplot:

	coefplot, omitted baselevels drop(_cons) xline(0)

* The graph plots the coefficients and standard errors. When presenting a 
* graph of regression results you should include the same details you would
* include in a table. Regression coefficients are just an estimate. They should
* always be accompanied by standard errors.

* Lets use the options to make this coefplot more attractive:

	coefplot, omitted baselevels drop(_cons) xline(0) ///
	headings( 0.female = "{bf:Sex}" 1.ses = "{bf:Parental Social Class}" ///
	1.race = "{bf:Ethnicity}", ) ///
	title("OLS Regression Model of Maths Test Scores") ///
	subtitle("Coefficients and 95% Standard Errors") ///
	note("Data: High School and Beyond Data, n = 200, Adjusted R2 = 0.12") ///
	scheme(s1color)

			 
			 

* Graph of Regression Output (Quasi-Variance)
* ===========================================

/* Quasi-variance is a means to overcome the reference category problem when
	displaying regression coefficients from categorical variables.
	
	If you are not familiar with this concept there is an accessible 
	introduction here: https://tinyurl.com/yystvbra                          */
	
	
* Install the qv package. This is written by Dr Aspen Chen.

	ssc install qv
	
	
* Run the regression of maths scores again.

	regress math i.female i.ses i.race, allbaselevels	
	
	
* We will produce a graph showing the coefficients and 95% quasi variance
* comparison intervals for the ses variable.
		
	qvgraph i.ses, scheme(s1mono) ///
	xtitle("Socio-Economic Status", size(medsmall)) ///
	title("Maths Test Scores") ///
	subtitle("Coefficients and 95% Quasi-Variance Comparison Intervals") ///
	note("Data: High School and Beyond" "Note: Model also contains sex and ethnicity.")
		
		
		
		
		
		
		
		

		
/* If time remains please open the Crime Survey for England and Wales, 
	2013-2014: Unrestricted Access Teaching Dataset and practice producing
	the graphs introduced throughout this lab.                              */
	
	
	
	
	
	
	
	
	
	
	
* Clear data from Stata

	clear

* Clear your screen

	cls

		


  
********************************************************************************
* END OF FILE
