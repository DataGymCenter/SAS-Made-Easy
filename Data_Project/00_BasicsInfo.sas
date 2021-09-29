* Decluttering work environment. Delete all temp files ;
dm 'log;clear;output;clear;odsresults;clear;macro;clear'; 
proc datasets library=work kill memtype=data nolist;quit;
options notes source errors=20 nocenter;

*== Path or directory (folder) containing the data to import==;
%Let path = C:\ALL_Tuts\Fall_2021_Class\;

* Name of data file ;
%Let dat1 = cars1;

Libname carsy "&path";
