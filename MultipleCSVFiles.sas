dm'log;clear;output;clear;'; * This code clears the contents of the log and output windows;

*---- Importing Multiple CSV Files into SAS ----;
%Let wk_dir = /folders/myfolders/SASTuts/Olympics/;

* Import Multiple CSV files ;
%macro import_csv (dat_csv);
	proc import datafile="&wk_dir.&dat_csv..csv" 
	out=CSVDat dbms=csv replace; 
run;

* Combine all imported data into a single data on the go ;
	proc append base=all_CSV data=CSVDat force; quit;
	
%mend;
%import_csv(Olympics1);
%import_csv(Olympics2);
%import_csv(Olympics3);
%import_csv(Olympics4);
%import_csv(Olympics5);

proc print data=all_CSV; run;
/* Print data. If data your is large, you may need to print only a few rows. In that case, use (obs=N), where N is the number of observations you want to print 
E.g., (obs=10) prints out the first 10 observations */;
proc print data=all_CSV (obs=10); run; * prints out the first 10 observations ;
proc contents data=all_CSV varnum; run; * Basic checks for data type etc., similar to 'str(all_CSV)', 'glimpse(all_CSV)' in R;
