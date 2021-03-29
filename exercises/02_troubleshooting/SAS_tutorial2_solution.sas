/* Try it yourself: spot the errors in this program and fix them
so that it can run correctly (SOLUTION!)*/

*creating a new library called "sastutorial";

libname sastut "/home/u58156616" ; *missing semi-colon; 
								*libname too long - changed it to shorter (max 8 char); 
								*placed my own directory; 
								*removed .png extension from path;

*creating new datasets	inside the new library;

data sastut.dataset1; *removed 1 from beginning of dataset name; 
	input x y;
	cards;
1 2 
2 3
4 5
4 4
;

data sastut._dataset2;
	input x y;
	cards;
2 3 
3 4 
334 4 
3 4
; *maybe a bit tricky: reordered values in column; 

data sastut.dataset3; *added libraryname before dataset and removed $ sign from front; 
	input x y;
cards; * added cards statement;
2 3 
23 3 
3 3 
3 4
; *reordered values in columns of two (there are two variables); 

data sastut.dataset4; * removed / (forward slash) from beginning of dataset name; 
	input x y;
	cards;
2 3 
3 4 
4 5 
;

data sastut.dataset5;
	input x y name $ 20.; *specified length allowed for character values in "name" column; 
	cards; * removed unnecessary semi-colon from first line of values; 
1 2 Johnny-Smith-Jones
2 3 Annie-Smith 
3 4 George 
4 5 Marion 
5 6 Ceasar-Augustus
;
	
title "data1";

proc print data=sastut.dataset1; *fixed dataset name here too;
run; *added run statement; 

title "data 2";

proc print data=sastut._dataset2;
run; *added run statement;

title "data 3";

proc print data=sastut.dataset3; *fixed dataset name here too, and added semi-colon at end of code line; 
run; * moved run statement on next line; 

title "data 4";

proc print data=sastut.dataset4; *fixed dataset name here too;
run;

title "data 5";

proc print data=sastut.dataset5;
run;