PROC CONTENTS DATA=BANPROJS.WALMART varnum;
RUN;

Title 'Listing the first 20 Observations of WALMART Data Set';
Proc Print data=banprojs.WALMART (obs=20);
Run;

   
DATA BANPROJS.WALMART;
	set BANPROJS.WALMART;
	new_store=put(store, $8.);
	new_dept=put(dept, $8.);
	new_Effective_Markdowns=put(Effective_Markdowns, $8.);
	new_type=put(type, $8.);
RUN;

Title 'Listing the first 20 Observations of WALMART Data Set';
Proc Print data=banprojs.WALMART (obs=20);
Run;



Title "Statistics WALMART dataset";
   proc means data=banprojs.WALMART n nmiss mean median min max;
   run;
   
   
Title 'Using PROC UNIVARIATE to distributions';

       proc univariate data=banprojs.WALMART;
       var Temperature Fuel_price CPI Markdown1 Markdown2 Markdown3 Markdown4 Markdown5 Unemployment Size Isholiday Weekly_Sales Sales_Per_SqFt 
          histogram / normal;
run;

Title "Describing Relationships between variables: Scatter Plots and Correlation";

Ods graphics on;

 Proc sgscatter data=banprojs.WALMART;
 Matrix Temperature Isholiday Markdown5 Weekly_Sales Sales_Per_SqFt / diagonal=(histogram);
 Run;
 
 Proc Corr data=banprojs.WALMART nosimple;
 Var Temperature Isholiday Markdown5 Weekly_Sales Sales_Per_SqFt;
 Run;

 Proc sgscatter data=banprojs.WALMART;
 Matrix Fuel_price CPI Unemployment Size Weekly_Sales Sales_Per_SqFt / diagonal=(histogram);
 Run;
 
 Proc Corr data=banprojs.WALMART nosimple;
 Var Fuel_price CPI Unemployment Size Weekly_Sales Sales_Per_SqFt;
 Run;
 
  Proc sgscatter data=banprojs.WALMART;
 Matrix Markdown1 Markdown2 Markdown3 Markdown4 Weekly_Sales Sales_Per_SqFt/ diagonal=(histogram);
 Run;
 
 Proc Corr data=banprojs.WALMART nosimple;
 Var Markdown1 Markdown2 Markdown3 Markdown4 Weekly_Sales Sales_Per_SqFt;
 Run;
 
Ods graphics off;


#MULTIPLE REGRESSION

Title 'Finding a multiple regresion model for the data';
Proc reg data=banprojs.WALMART;
model Weekly_Sales = Markdown1 Markdown2 Markdown3 Markdown5 Size CPI Unemployment;
Run;
Quit;


Title 'Using Stepwise Regression to find the best model';
Proc reg data=banprojs.WALMART;
Stepwise: model Weekly_Sales= Markdown1 Markdown2 Markdown3 Markdown5 Size CPI Unemployment / selection = stepwise;
Run;
Quit;


Title 'Predicting weekly Sales';
Proc reg data=banprojs.WALMART;
model Weekly_Sales = Markdown3 Markdown5 Size CPI Unemployment / p;
Run;
Quit;


