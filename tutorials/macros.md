--- 
layout: default
author: Anna
title: Write flexible code with SAS Macros
subtitle: Learn about the Macro language, and how to integrate them in your program to write flexible and modular code.
--- 


# Learning Objectives 

* Learn about the macro language, its syntax and unique features;
* Learn about the difference between macros and macro variables;
* Learn how to use macros to optimise code writing and create modular code that can be recalled at need;
* Become familiar with the macro language to start programming with more flexibility throughout different SAS programs and ETLs.

# Structure

<a href="#sect1">1. What is the Macro language in SAS?</a>

<a href="#subsect1"><sub>Structure and syntax</sub></a>

<a href="#subsect3"><sub>Think %global act local</sub></a>

<a href="#sect2">2. Built-in macro variables</a>

<a href="#subsect4"><sub>The %let and %put macros</sub></a>

<a href="#subsect5"><sub>%if conditions and %do loops</sub></a>

<a href="#sect3">3. Custom macro variables</a>

<a href="#subsect6"><sub>The %macro - %mend couple</sub></a>

<a href="#subsect7"><sub>Adding parameters to the macro variable</sub></a>

<a href="#sect4">4. Data-driven programs</a>

<a href="#subsect8"><sub>DATA step interfaces</sub></a>

* symget
* symput
* check out interm sas macro pdf 

<a href="#subsect9"><sub>DATA step functions in macros</sub></a>

<a href="#subsec10"><sub>PROC SQL interfaces</sub></a>

* into

<a href="#sect5">5. Exercise: create an ETL-type program</a>

<a href="#subsect11"><sub>Definition of ETL</sub></a>

<a href="#subsect12"><sub>Download the SAS programs to do the exercise</sub></a>

<a href="#sect6">6. References</a>


<a name="sect1"></a>

# 1. What is the Macro language in SAS?

The macro language is an entirely "new world" within SAS, a tool that allows your code to be **dynamic and flexible**.

Syntax and structure of macros can be a bit hard to get a grasp on at first, but they possess great advantages, which include:

* Reduction of regular code;
* Programming optimisation;
* Automatic generation of SAS code;
* Facilitation of information passed from one procedure to the other and from one program to another;
* Reduced read/write effort of SAS code;
* Generation of data-driven programs, letting SAS decide what to do based on actual daata values.

These advantages can be really understood when using programs that need to be run frequently, perhaps on a daily basis. Otherwise, **macro code takes longer to write and debug** and might become a disadvantage if you decided to use it for simple programs or programs that would only be run a few times.

<a name="subsect1"></a>

## Structure and syntax

The first thing to remember is that, differently from regular SAS code, macros pass through a **Macro processor**, which then generates SAS code. 

Here is a schematic view of the workflow. 

![macro workflow](../screenshots/07_macros/macro_workflow.png)

Essentially, you are writing a program that writes a program, and this is also called **meta-programming**.

The syntax is simple and defines different types of macros:
* Macros are called or created by placing a **percent sign** (%) at the start of the word;
* Macro variables are called instead by placing an **ampersand** (&) at the start of the word and a **period** (.) sign at the end of the word.

Macros and macro variables can be nested within a macro program. The macro program can also contain more complex logic including complete DATA and PROC steps other than other macros.

Let's see an example of creating a macro to a dataset name, still using dataset terna16 from the previous tutorials. 

```
%let ds = terna16;

proc print data = &ds.;
run;
```

This code is very simple: as we've previously seen it prints out the dataset called terna16 in its entirety. 

The difference is that we have placed the **dataset name** inside a macro, and we have called this macro **"ds"**. Whenever we need to call the dataset name we **no longer need to write "terna16", but &ds. is enough**.

If we ever wanted to change dataset or dataset name, **we would need to change it in the macro, and not everywhere we use the dataset in the code**, like so:

```
%let ds = terna17;

proc print data=&ds.;
run;
```

This code here instead of printing terna16 now prints terna17. 

You can imagine how this process becomes extremely useful when **the same lines of code or variable names are repeated throughout long programs of code**.

<a name="subsect3"></a>

## Think %global act local 



<a name="sect2"></a>

# 2. Built-in macro variables 

<a name="subsect4"></a>

## The %let and %put macros 

<a name="subsect5"></a>

## %if conditions and %do loops

<a name="sect3"></a>

# 3. Custom macro variables

<a name="subsect6"></a>

## The %macro - %mend couple

<a name="subsect7"></a>

## Adding parameters to the macro variable 

<a name="sect4"></a>

# 4. Data-driven programs

<a name="subsect8"></a>

## Data step interfaces

<a name="subsect9"></a>

## Data step functions in macros

<a name="subsect10"></a>

## PROC SQL interfaces

<a name="sect5"></a>

# 5. Exercise: create and ETL-type program

<a name="subsect11"></a>

## Definition of ETL 

<a name="subsect12"></a>

## Download the SAS programs to do the exercise

<a name="sect6"></a>

# 6. References