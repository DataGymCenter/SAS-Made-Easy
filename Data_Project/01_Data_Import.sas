/* Import data from CSV file */
proc import 
	* 'proc' is short for procedure. This statement calls the import procedure. To execute correctly, the this step requires some key information ;
	datafile="&path.&dat1..csv"  	
	* From where am I getting the data? 'path' and 'dat1' are placeholders defined in the '00_BasicsInfo.sas' file. ;
        out=carsy.carz 			
	* What name should I call the data (for use within SAS) once imported? ;
        dbms=csv 			
	* What's the file type? ;
        replace; 			
	* Replace data with the current if data with the same name already exists. ;
     getnames=Yes; 			
     * 'Yes' means the first row contains my variable names. ; 
run;				

/* Print out the data */
proc print data=carsy.carz(obs=15);run;

/* Import data from XLSX file */
* This step is similar to above. ;
proc import 
	datafile="&path.cars11.xlsx" 	
	* Simply change the file to 'xlsx' here,  ; 
        out=carsy.carz_XL
        dbms=xlsx 			
	* and Here!. ;
        replace;
     	getnames=Yes;
	range="subset_dat"; 		
	* Specify the sheet name or the data range name already defined in the Excel file. ;
run;

/* Print out the data */
proc print data=carsy.carz_XL(obs=15);run;

