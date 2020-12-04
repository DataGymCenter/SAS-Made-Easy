dm'log;clear;output;clear;';

* ---- Importing Multiple Excel Files into SAS ----;
%Let wk_dir = /folders/myfolders/SASTuts/Olympics/;

%macro import_xl (dat_xl);
	proc import datafile="&wk_dir.&dat_xl..xlsx" 
	out=XLDat dbms=xlsx replace; 
	getnames=yes; 
run;

* Combine all imported data into a single data ; 
	proc append base=all_xl data=XLDat force; quit;

%mend;
%import_xl(Olympics1);
%import_xl(Olympics2);
%import_xl(Olympics3);
%import_xl(Olympics4);
%import_xl(Olympics5);

proc print data=all_xl; run;

proc contents data=all_xl varnum; run;
