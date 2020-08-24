dm'log;clear;output;clear;';

*---- Importing Multiple CSV Files into SAS ----;
%Let wk_dir = /folders/myfolders/SASTuts/Olympics/;

* Import Multiple CSV files ;
%macro import_csv (dat_csv);
	proc import datafile="&wk_dir.&dat_csv..csv" 
	out=CSVDat dbms=csv replace; 
run;

* Combine all imported data into a single data ;
	proc append base=all_CSV data=CSVDat force; quit;
	
%mend;
%import_csv(Olympics1);
%import_csv(Olympics2);
%import_csv(Olympics3);
%import_csv(Olympics4);
%import_csv(Olympics5);

proc print data=all_CSV; run;

proc contents data=all_CSV varnum; run;




























* ---- Importing Multiple CSv Files into SAS ----;
* Import Multiple excel files ;
%macro import_xl (dat_xl);
	proc import datafile="&wk_dir.&dat_xl..xlsx" out=XLDat dbms=xlsx replace; getnames=yes; run;
	proc append base=all_xl data=XLDat force; quit;
%mend;
%import_xl(Olympics1);
%import_xl(Olympics2);
%import_xl(Olympics3);
%import_xl(Olympics4);
%import_xl(Olympics5);

proc print data=all_xl; run;

proc contents data=all_xl NODS; run;

data all; set filenames; where filename=cars:; run;



%Let wk_dir = /folders/myfolders/SASTuts/;

filename DIRLIST pipe "&wk_dir.cars*.csv";
 
* Import Multiple excel files ;
%macro import_xl1 (dat_xl1);
	proc import datafile="&wk_dir.&dat_xl1..xlsx" out=XLDat1 dbms=xlsx replace; run; * (where=(medal NE 'NA'));
	proc append base=all_xl1 data=XLDat1 force; quit;
%mend;
%import_xl1(athlete_events);
%import_xl1(athlete_events1);
%import_xl1(athlete_events2);



%macro xl (data);
	Libname all1 XLSX "&wk_dir.&data..xlsx";
	proc append base=allyy data=all1 force; quit;
%mend;
%xl(cars1);
%xl(cars2);
%xl(cars3);

proc contents data=allyy._ALL_ NODS; run;

data car; set all1:; proc print; run;


%Let dir = /folders/myfolders/SASTuts/; * Change to your path; 
%Let dat_in = cars1.xlsx; * Change to your excel file;

libname irifile xlsx "&dir.&dat_in"; 
*libname assigns a libref to the Excel file;
*View the contents of SAS the library;

PROC CONTENTS DATA=irifile._ALL_ NODS;RUN;
* _ALL_ = List all SAS files in library, NODS = minimal output, NO details;

*Combine all datasets;
data irifile.iris_combined;
   set irifile.iris:;*The wild card (:) tells SAS to import ALL sheets starting with 'iris';
*proc print;
run;