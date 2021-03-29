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

<a href="#sect2">2. SAS Official Support</a>

<a href="#subsect1"><sub>SAS Studio syntax helper</sub></a>

<a href="#subsect2"><sub>Where to find official documentation and how to browse it</sub></a>

<a href="#subsect3"><sub>Log window</sub></a>

<a href="#sect3">3. Common mistakes and how to solve them</a>

<a href="#sect4">4. Try it yourself: fix the errors from a SAS program</a>

<a href="#sect5">5. Resources</a>


<a name="sect1"></a>

# 1. General SAS Syntax rules 

Before exploring how to troubleshoot and where to find help with SAS programming, I am going to quickly tell you about some general rules that you must apply in order to **avoid running into simple errors**. 

At the moment, don't worry about the logic behind the code and syntax, as you will learn about them in the next tutorials. What matters now is the naming of your dataset and comparing when it works and when it does not. 

#### 1.1 Every line of code in SAS **MUST** end with a **semi-colon** (;)

If you run the following program, by either pressing on the *running figure* button or by clicking on **F3** key in your keyboard, you will see an error popping up. 

```
data trial      
	input x y;
	cards;
1 2
;
run;
```

The error says: 

![no_semi_colon_error](https://user-images.githubusercontent.com/80749213/112667209-48d5b580-8e5d-11eb-82a6-67a24c14b724.png)

The table you tried to create did not succeed because of a missing semi-colon in the first line of code. 

If you add it, it will now work and create a new dataset called "trial". 

```
data trial;     
	input x y;
	cards;
1 2
;
run;
```

![output_correct](https://user-images.githubusercontent.com/80749213/112655495-baf3cd80-8e50-11eb-96d9-2222615f1e3c.png)


#### 1.2 Names for datasets **must** start with a **character** or **underscore** and cannot exceed 32-character in length (by default). If you place a **special character or a number** you will run into error. 

Open SAS Studio and write this simple code, to get an idea of the output when your write a dataset name *correctly*.  

```
/* correct: name your dataset with character or underscore at the
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

You can see that the program does produce an output (a *SAS dataset*) with the variables x and y, displayed in a *new tab* called *output data*. 

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
 

#### 1.3 Blank spaces automatically define two separate entities

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

What happened? The space between the words *id* and *employees* treats them as **two separate variables**, instead of one! Since underneath the variables names there is a list of values also separated by one blank space, which defines them as two separate columns, the variable **age** does not even appear and is, instead, substituted by the word **employees**, which appears first.

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

If you run the program now, you will see that the output is **finally what we had expected**. The first variable is, in fact, called *id employees* and the second one is called *age*. 

![correct_dataset_name](https://user-images.githubusercontent.com/80749213/112659619-d82a9b00-8e54-11eb-9440-491664d23e07.png)

#### 1.4 SAS code is CASE IN-sensitive

This means that you could be writing your statements, functions, variable and value names either of these ways: 

```
DATA

data 

DaTa 

```

*SAS does not care about the case.*

However, **remember** that SAS **does remember the case of the first occurrence of each variable name in the program, and will print it the same also for the following occurrences**.

Have a look at the results from running the following code: 

```
data trial; 
input "id employees"n age; 
cards; 
1 23 
2 23
3 40
4 50
; 
run; 

proc print data=work.trial; 
var "id EMpLoYEEs"n; 
run;
```

As you can see, the **data step** has the variable *id employees* written entirely in lower case. In the **proc step**, instead, is a mix of lower and upper case - a mess. If you check the *results* window, however, you can see that SAS will print the case from the first occurrence of the variable name, which is lower case in this example. 

![case_insensitive_ex](https://user-images.githubusercontent.com/80749213/112662980-97cd1c00-8e58-11eb-9e3b-521f32069367.png)

You can try and revert the order of occurrence of the two variables, to see that the output does change according to the new first occurrence. 

![case_insensitive_ex2](https://user-images.githubusercontent.com/80749213/112663328-fa261c80-8e58-11eb-8711-de03320de723.png)

#### 1.5 By default, values cannot be longer than 8 characters in length

Let's use a new example, taking into consideration character strings as values. 

```
data trial; 
input name $ age; 
cards; 
Anna 23
Johnathan-Smith 40
Rodolphus 34 
Mattie 32
Mary 26 
; 
run; 

```

If you run this new program, you can see that the output cuts the names written in the first column, after the 8th character.

![char_length_values](https://user-images.githubusercontent.com/80749213/112664390-33ab5780-8e5a-11eb-96fd-c55ac50441b1.png)

To fix it, we need to tell SAS that we want to increase the length of our values. **WE WILL TALK ABOUT THIS IN THE NEXT TUTORIAL?????**

**REMEMBER** that there is a maximum character length allowed, and that is of **32767** characters. That should be enough! 

#### 1.5 Library names cannot exceed 8 characters in length 

If we tried to absurdly write a very long library name (**remember to write your own path to your home directory**), it would result in error. 

```
libname thislibnameiswaytoolongtoexist "your/path/to/your/home/directory";
```

The log window would report this error, specifically. 

![library_name_length](https://user-images.githubusercontent.com/80749213/112665668-9a7d4080-8e5b-11eb-83bd-9e427525b422.png)

SAS is telling you the library name **is not a valid SAS name** because **it definitely exceeds the maximum allowed of 8 characters in length**. 

In this case, and contrary to value names, **you cannot change this option**. Every new library name that you will create will have to fit within the maxmimum length allowed of 8 characters. 

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