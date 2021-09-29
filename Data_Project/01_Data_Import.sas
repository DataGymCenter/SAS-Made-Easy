/* Import data from CSV file */
proc import datafile="&path.&dat1..csv"
        out=carsy.carz
        dbms=csv
        replace;
     getnames=Yes;
run;

/* Print out the data */
proc print data=carsy.carz(obs=15);run;

/* Import data from XLSX file */
proc import datafile="&path.cars11.xlsx"
        out=carsy.carz_XL
        dbms=xlsx
        replace;
     getnames=Yes;
	 range="subset_dat";
run;

/* Print out the data */
proc print data=carsy.carz_XL(obs=15);run;

data Acura;
	set carsy.carz;
	where make = "Acura";
	proc print;
run;
