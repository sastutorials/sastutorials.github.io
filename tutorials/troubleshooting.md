--- 
layout: default
title: Intro to SAS pt. II
subtitle: Troubleshooting and how to find help.
--- 

## Learning Objectives

* Take advantage of SAS Studio's smart programming features

* Learn how to read and interpret the Log window 

* Familiarise yourself with some common programming errors you might run into

## Tutorial structure

<a href="#sect1">1. General SAS Syntax rules</a>

<a href="#sect2">2. SAS Studio syntax helper</a>

<a href="#sect3">3. Where to find official documentation and how to browse it</a>

<a href="#sect4">4. Log window</a>

<a href="#sect5">5. Common mistakes and how to solve them</a>

<a href="#sect6">6. Try it yourself: fix the errors from a SAS program</a>

<a href="#sect7">7. Resources</a>

-----------------------------------------------

<a name="sect1"></a>

# 1. General SAS Syntax rules 

Before exploring how to troubleshoot and where to find help with SAS programming, I am going to quickly tell you about some general rules that you must apply in order to **avoid running into simple errors**. 

#### 1. Names for datasets **must** start with a **character** or **underscore**. If you, instead, place a **special character or a number** you will run into error. 

At the moment, don't worry about the logic behind the code and syntax, as you will learn about them in the next tutorials. What matters now is the naming of your dataset and comparing when it works and when it does not. 

Open SAS Studio and write this simple code, to get an idea of the output when your write a dataset name *correctly*.  

```
/* name your dataset with character or underscore at the
beginning */

data _trial;
	input x y;
	cards;
1 2 
;
run;

data trial;
	input x y;
	cards;
1 2
;
run;
```

If you run the program, by either pressing on the *running figure* button or by clicking on **F3** key in your keyboard, you can see that it does produce an output (a *SAS dataset*) with the variables x and y, displayed in a *new tab* called *output data*. 

![output_correct](https://user-images.githubusercontent.com/80749213/112655495-baf3cd80-8e50-11eb-96d9-2222615f1e3c.png)

If, instead, you paste the following in your editor and *run the program*:

```
/* wrong: dataset name starts with numbers or special characters */ 

data 1trial;
	input x y;
	cards;
1 2
;
run;

data %trial;
	input x y;
	cards;
1 2 
;
run;
```

You can see that the tab *output data* **does not show this time**. Instead, an **X** appears near the *name of the program* and you are automatically directed to the **log** window.

In this example, you can see that there are *4 errors* and *5 warnings* (notes are usually always there). If you click on either menu you can read the specific message(es).

![error_dataset_name](https://user-images.githubusercontent.com/80749213/112657426-b4feec00-8e52-11eb-9541-d670ea01c690.png)
 
#### 2. Blank spaces automatically define two separate entities

Let's see an example of this. Let's say you want to create two columns named *id employees* and *age*. 

Paste the following in SAS Studio: 

```
/* naming two columns as
- id employees 
- age
*/ 

data trial; 
input id employees age; 
cards; 
1 23
2 45
3 23
4 48
5 30
; 
run; 
```

If you run the program with the code written above, you are going to see the output is *not quite what we had in mind*. 

What happened? The space between the words *id* and *employees* treats them as **two separate variables**, instead of one! Since underneath you have written values for only the first two variables, the variable **age** does not even appear and is, instead, substituted by the word **employees**, which appears first.

![blank_spaces](https://user-images.githubusercontent.com/80749213/112658624-de6c4780-8e53-11eb-9330-88ffede130f1.png)

SAS indeed does **identify blank spaces as separators between different variables and values**. 

*Here is the trick*. If you wanted to keep *id employees* as one variable, you could either substitue the space with a special character (convenience is to use an underscore), like this: 

```
data trial; 
input id_employees age; 
cards; 
1 23
2 45
3 23
4 48
5 30
; 
run; 
```

Or if you wanted to **preserve the blank**, you should **wrap** the variable name within quotes and the letter `n` at the end of the string. The letter `n` is used in SAS syntax to highlight that the content inside the quotes is a whole character string. 
```
data trial; 
input "id employees"n age; 
cards; 
1 23
2 45
3 23
4 48
5 30
; 
run; 
```

If you run the program now, you will see that the output is **finally what we had expected**. 

![correct_dataset_name](https://user-images.githubusercontent.com/80749213/112659619-d82a9b00-8e54-11eb-9440-491664d23e07.png)


The first variable is called *id employees* and the second one is *age*. 

<a name="sect2"></a>

# 2. SAS Studio syntax helper


<a name="sect3"></a>

# 3. Where to find official documentation and how to browse it


<a name="sect4"></a>

# 4. Log window


<a name="sect5"></a>

# 5. Common mistakes and how to solve them 


<a name="sect6"></a>

# 6. Try it yourself: fix the errors from a SAS program


<a name="sect7"></a>

# 7. Resources