/* Try it yourself: spot the errors in this program and fix them 
so that it can run correctly */
*creating a new library called "sastutorial"; 
libname sastutorial "path/to/your/home/directory.png"
*creating new datasets inside the new library;
data sastutorial.1dataset1; 
input x y ; cards; 1 2 
2 3
4 5
4 4
; data sastutorial._dataset2; 
input x y; 
cards
2 3
3 4
334 4
3 4
; data $dataset3; 
input x y; 
2 3 
23 3
3 3
3 4
; 
data sastutorial./dataset4; 
input x y; 
cards; 
2 3 
3 4 
4 5 
; 
data sastutorial.dataset5; input x y name $; 
cards; 
1 2 Johnny-Smith-Jones; 
2 3 Annie-Smith
3 4 George 
4 5 Marion
5 6 Ceasar-Augustus
; title "data1"proc print data=sastutorial.1dataset1; 
title "data 2";
proc print data=sastutorial._dataset2; 
title "data 3"; 
proc print data=sastutorial.$dataset3run; title "data 4"; 
proc print data = sastutorial./dataset4; 
run; 
title "data 5"; 
proc print data=sastutorial.dataset5; 
run; 