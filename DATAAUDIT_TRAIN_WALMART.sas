PROC CONTENTS DATA=BANPROJS.WALMART_TRAIN varnum;
RUN;

Title 'Listing the first 50 Observations of WALMART_FEATURES Data Set';
Proc Print data=BANPROJS.WALMART_TRAIN (obs=50);
Run;


 *Using PROC MEANS to Count Missing Values for Numeric Variables;

Title "Checking Missing Values for Numeric Variables in WALMART_TRAIN dataset";
   proc means data=BANPROJS.WALMART_TRAIN n nmiss mean median min max;
   run;
   

   
Title 'Using PROC UNIVARIATE to Examine Store Dept Date Weekly_Sales IsHoliday';

       proc univariate data=BANPROJS.WALMART_TRAIN;
          var Store Dept Date Weekly_Sales IsHoliday;
          histogram / normal;
run;
