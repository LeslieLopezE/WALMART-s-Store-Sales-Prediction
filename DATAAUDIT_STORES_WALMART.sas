PROC CONTENTS DATA=BANPROJS.WALMART_STORES varnum;
RUN;

Title 'Listing the first 10 Observations of WALMART_FEATURES Data Set';
Proc Print data=BANPROJS.WALMART_STORES (obs=10);
Run;



*Using PROC FREQ to Count Missing Values and Errors for Character Variables;

Title "Checking Missing Values for Type Variable";
	Proc format;
     value $Count_Missing ' ','NA' = 'Missing'
  					   other = 'Nonmissing';
run;

proc freq data=BANPROJS.WALMART_STORES;
tables Type/ nocum missing; 
format Type $Count_Missing.;
run;



*Using PROC MEANS to Count Missing Values for Numeric Variables;

Title "Checking nissing values for numeric variables in WALMART_STORES dataset";
   proc means data=BANPROJS.WALMART_STORES n nmiss mean median min max;
   run;
   
*Using PROC UNIVARIATE to examine Numeric Variables;
   
Title 'Using PROC UNIVARIATE to examine size and store variables';

       proc univariate data=BANPROJS.WALMART_STORES;
          var store size;
          histogram / normal;
run;