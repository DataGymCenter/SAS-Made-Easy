dm'log;clear;output;clear;';

*---- Importing a Single EXCEL Files into SAS ----;
%Let wk_dir = /folders/myfolders/SASTuts/Olympics/;

* Now let us import the data ;
proc import datafile="&wk_dir.cars1.xlsx"     * '&wk_dir.' is the shortcut to the folder containing the data ;
	out=XLDat 
	dbms=xlsx replace; 
	sheet = cars   
	getnames=YES;
run;

proc print data=XLDat; run; * Print data ;

proc contents data=XLDat varnum; run; * This PROC checks data type of imported data ;
