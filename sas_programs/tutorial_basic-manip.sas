/* importing  datasets*/
proc import datafile="/home/u58156616/terna16.xls" out=terna16 dbms=xls;
run;

proc import datafile="/home/u58156616/terna17.txt" out=terna17 dbms=tab;
run;

proc import datafile="/home/u58156616/terna18.xls" out=terna18 dbms=xls;
run;

proc import datafile="/home/u58156616/terna19.txt" out=terna19 dbms=tab;
run;

proc import datafile="/home/u58156616/terna20.csv" out=terna20 dbms=dlm replace;
delimiter=";";
run;

proc import datafile="/home/u58156616/terna21.csv" out=terna21 dbms=dlm replace;
delimiter=";";
run;



/*Executing proc contents on the datasets*/

proc contents data=work.terna16;
proc contents data=work.terna17;
proc contents data=work.terna18;
proc contents data=work.terna19;
proc contents data=work.terna20;
proc contents data=work.terna21;
run;












/* proc print */ 

proc print data=work.terna16; 
run; 
proc print data=work.terna17; 
run; 
proc print data=work.terna18; 
run; 
proc print data=work.terna19; 
run; 
proc print data=work.terna20; 
run; 
proc print data=work.terna21; 
run; 


/* First 10 obs */

proc print data = work.terna16 (obs = 10);
run;

/* Last 10 obs */

data last10;
  do p=max(1,nobs-9) to nobs;
    set work.terna16 nobs=nobs point=p;
    output;
  end;
  stop;
run;

proc print data = work.last10;
run;


************************************************;

data trial; 
input x $; 
cards; 
ABCD
; 
run; 
proc print data=trial; run;





