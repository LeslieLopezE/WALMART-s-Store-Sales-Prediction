PROC CONTENTS DATA=BANPROJS.WALMART_FEATURES varnum;
RUN;

Title 'Listing the first 100 Observations of WALMART_FEATURES Data Set';
Proc Print data=banprojs.WALMART_FEATURES (obs=100);
Run;



*Using PROC FREQ to Count Missing Values and Errors for Character Variables;

Title "Checking Missing Values for Markdown1-5 Variables";
	Proc format;
     value $Count_Missing ' ','NA' = 'Missing'
  					   other = 'Nonmissing';
run;

proc freq data=banprojs.WALMART_FEATURES;
tables MarkDown1 MarkDown2 MarkDown3 MarkDown4 MarkDown5/ nocum missing; 
format MarkDown1 MarkDown2 MarkDown3 MarkDown4 MarkDown5 $Count_Missing.;
run;

Title "Checking Missing Values for CPI";
	Proc format;
     value $Count_Missing ' ','NA','?' = 'Missing'
  					   other = 'Nonmissing';
run;

proc freq data=banprojs.WALMART_FEATURES;
tables CPI/ nocum missing; 
format CPI $Count_Missing.;
run;

Title "Checking Missing Values for Unemployment";
	Proc format;
     value $Count_Missing ' ','NA','?' = 'Missing'
  					   other = 'Nonmissing';
run;

proc freq data=banprojs.WALMART_FEATURES;
tables Unemployment/ nocum missing; 
format Unemployment $Count_Missing.;
run;

 *Using PROC MEANS to Count Missing Values for Numeric Variables;

Title "Checking Missing Values for Numeric Variables in WALMART_FEATURES dataset";
   proc means data=banprojs.WALMART_FEATURES n nmiss mean median min max;
   run;
   

   
Title 'Using PROC UNIVARIATE to Examine store date temperature Fuel_price IsHoliday';

       proc univariate data=banprojs.WALMART_FEATURES;
          var store date temperature Fuel_price IsHoliday;
          histogram / normal;
run;


