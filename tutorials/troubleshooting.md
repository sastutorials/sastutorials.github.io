--- 
layout: default
title: Intro to SAS pt. II
subtitle: Troubleshooting and how to find help.
--- 

## Learning Objectives

* Take advantage of SAS Studio's smart programming features

* Learn how to read and interpret the Log window 

* Familiarise yourself with some common programming errors you might run into

## Structure

<a href="#sect1">1. General SAS Syntax rules</a>

<a href="#sect2">2. SAS Official Support</a>

<a href="#subsect1"><sub>SAS Studio smart features</sub></a>

<a href="#subsect2"><sub>Where to find official documentation</sub></a>

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

![output_correct](../screenshots/output_correct.png)


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

To fix it, we need to tell SAS that we want to increase the length of our values. We will further discuss about the **LENGTH** statement in the next tutorial.

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

<a name="subsect1"></a>

## SAS Studio smart features

As we had mentioned in the previous tutorial "[Getting Started with SAS and SAS Studio](/tutorials/intro-to-sas.html)", SAS Studio is equipped with **smart features**, like *code completion, formatting and syntax colouring*. Make sure to *exploit these features*, which should already help you out not to make unnecessary mistakes. 

In particular, the **code completion** feature allows you to visualise information on the command quickly and to browse for examples by **directing you to the official SAS documentation**. 

Let's have a look at how this works in particular. 

Let's say you are looking for a command, but not quite remember its exact name. You only now it starts with *se*... 

![syntax_helper](../screenshots/syntax_helper.png)

The **code completion** feature gives you suggestions on the existing commands within the *SAS dictionary*, starting from the letters that you typed inside the program editor. In this case, it is suggesting two possible commands starting with *se*: **select** and **set** statements and it already tells you that these two belong to the group of **DATA Step Statements**. If you hover over either, a new window appears on the right hand side, further detailing functionalities, syntax structure, and other information on that particular command. 

**Scrolling down** in that same window, you are offered links that direct you to the **official documentation** and to examples of uses of that particular command. 

![syntax_helper1](../screenshots/syntax_helper1.png)

 The second smart feature in SAS Studio helps you correctly **format** your code. This is important to help yourself with clearly understanding your code - extremely important when you want to **go back to a program which you haven't opened in a while and want to rememeber quickly what you programmed**. 

 Let's say we have coded this program:

```
data trial;
input x y;
cards;
10 3.5 
11 3.6 
10 43.45
34 10
10 230.0
11 34
34 45.6
;

proc print data=trial;
var x; run; 
```

It is okay as it is in that sense that, if you run this code, it will create the output correctly and without errors. 

However, If you help yourself with the formatting feature, you are going to be able to read your code more clearly. 

Click on the button highlighted in *yellow* in the image below. **You can see that the position of certain commands has changed.** I have highlighted the changes in *green*. 

![code_formatting](../screenshots/code_formatting.jpg)

SAS Studio does not provide automatic smart features for this, but another two important formatting rules that might help you with clean code writing etiquette, are: 

* **write SAS commands in capital letters**, so you can distinguish them from other text; 
* **comment about your code**, so when you go back to it you already have information on the functionality of your program before you run it. 

Here is an example of a well-formatted and clean program: 

```
/* This is one way of adding comments to your SAS program*/

DATA trial;    *This is another way to write a comment; 
	INPUT x y;
	CARDS;
10 3.5 
11 3.6 
10 43.45
34 10
10 230.0
11 34
34 45.6
;   *Here we have created a small datasets with numeric variables x and y; 

PROC PRINT data=trial;
	VAR x;
RUN; *Here we are printing only the x variable from the dataset created above; 


*********the program ends here*********; 
```

Last but not least, the **syntax colouring** feature helps you distinguish between **types of commands**, **variables** and **values**, **special characters** and **other symbols**. I guess you've already noticed that from pasting the previous code in your SAS Studio program. 

Here I have taken a snippet of the previous program, adding a few more lines of code to show you what each colour corresponds to. The more you are going to write in SAS the more you are going to become familiar with this smart feature. 

![code_colouring](../screenshots/code_colouring.png)

<a name="subsect2"></a>

## Where to find official documentation

At this point, you know that SAS offers its own official documentation, where you can find details about each single command existing in SAS. 

We have already mentioned where to look for help from SAS Studio: either by clicking on the **question mark** (?) on the top bar, or by clicking on **product documentation** from the **code completion** feature of the application. 

The documentation that you have access to from SAS Studio either directs you to the [official SAS Studio Guide](https://documentation.sas.com/?activeCdc=webeditorcdc&cdcId=sasstudiocdc&cdcVersion=3.7&docsetId=sasstudioov&docsetTarget=aboutthedoc.htm&locale=en) or to [SAS Product Support A to Z](https://support.sas.com/en/software/all-products-support.html). 

However, these either relate to SAS Studio specifically or start from a very broad range of choices. 

Here is a couple of links more to help you get started. 

* [*This link*](https://go.documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=v_009&docsetId=ledsoptsref&docsetTarget=p1pczmnhbq4axpn1l15s9mk6mobp.htm&locale=en) directs you to the **full dictionary of DATA STEP options**; 
* [*This link*](https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=9.4_3.5&docsetId=proc&docsetTarget=titlepage.htm&locale=en) instead directs you to the **full list of PROCEDURES (PROC STEPS)** that you can do on SAS; 
* [*This link*](https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=9.4_3.5&docsetId=lefunctionsref&docsetTarget=n01f5qrjoh9h4hn1olbdpb5pr2td.htm&locale=en) directs you to a list of **functions and call routines**, grouped by category of use.

<a name="subsect3"></a>

## Log window


<a name="sect5"></a>

# 3. Common mistakes and how to solve them 


<a name="sect6"></a>

# 4. Try it yourself: fix the errors from a SAS program


<a name="sect7"></a>

# 5. Resources