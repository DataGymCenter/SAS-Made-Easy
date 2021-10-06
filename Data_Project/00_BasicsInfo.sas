* Decluttering work environment by deleting all temporary files ;
dm 'log;clear;output;clear;odsresults;clear;macro;clear'; 
* 'dm' means display manager;
proc datasets library=work kill memtype=data nolist;quit; 
* You do not need to run this everytime to avoid deleting your active data in the 'work' library/folder ;
options notes source errors=20 nocenter;

*== Path or directory (folder) containing the data to import ==;
%Let path = C:\ALL_Tuts\Fall_2021_Class\;

* Name of data file ;
%Let dat1 = cars1;

* Create a library name ; 
Libname carsy "&path"; 
* 'carsy' houses all your files within SAS, and it's linked to your directory. Whatever you save in the folder is said to be permanent ;
