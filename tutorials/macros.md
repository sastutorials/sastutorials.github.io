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

<a href="#subsect5"><sub>Conditional logic</sub></a>

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

**Note** **that the period sign** is not fundamental but **it's good practice to use**.

Macros and macro variables can be nested within a macro program. The macro program can also contain more complex logic including complete DATA and PROC steps other than other macros.

**inserire un'immagine schematica della spiegazione di sopra.**

<a name="sect2"></a>

# 2. Built-in macro variables 

<a name="subsect4"></a>

## The %let and %put macros 

Let's see an example of creating a macro to a dataset name, still using dataset terna16 from the previous tutorials. 

```
%let ds = terna16;

proc print data = &ds.;
run;
```

This code is very simple: as we've previously seen it prints out the dataset called terna16 in its entirety. 

The difference is that we have placed the **dataset name** inside a macro, and we have called this macro **"ds"**. Whenever we need to call the dataset name we **no longer need to write "terna16", but &ds. is enough**.

We can have a look at what the macro contains by printing the content of the macro itself, by using another built-in macro called **%put**. %PUT will print anything written next to it in the **log**, and strings don't require quotes. Let's see this example:

```
/* printing the macro in the log with %put */

%put   print ==============>  &ds <=============;
```

Now check the log. 

![put_log](../screenshots/07_macros/put_log.png)

If we ever wanted to change dataset or dataset name, **we would need to change it in the macro, and not everywhere we use the dataset in the code**, like so:

```
%let ds = terna17;

proc print data=&ds.;
run;
```

This code here instead of printing terna16 now prints terna17. 

You can imagine how this process becomes extremely useful when **the same lines of code or when variable names are repeated throughout long programs of code**.

![macro on multiple programs](../screenshots/07_macros/macro_var_program12.png)

<a name="subsect5"></a>

## Conditional logic

Another type of built-in macros relates to structuring code that requires execution of a **conditional logic**.

We are going to execute a simple condition: if the file exists then we can print it otherwise we are going to print an error message in the log. 

The code is the following: 

```
/* macros: conditional logic */

%if %sysfunc(exist(&ds.)) %then %do; 
    proc print data=&ds.;
    run;
%end; 
%else %do; 
    %put ========> WARNING: the file &ds does not exist. The operation has been skipped. ;
%end; 
```

As you run it you can see that the output does appear as the first condtion applies. 

If we changed the name of the dataset to print that **does not exist in work library**, like so: 

```
/* macros: conditional logic */

%let ds1 = terna18; 

%if %sysfunc(exist(&ds1.)) %then %do; 
    proc print data=&ds1.;
    run;
%end; 
%else %do; 
    %put ========> WARNING: the file &ds1. does not exist. The operation has been skipped. ;
%end; 
```

We can now see that there is no output, but if you check the log **the message from the second condition appears**: 

![2nd cond %if](07/../../screenshots/07_macros/if_2nd_cond.png)

**Note:** we've added another built-in macro, **%sysfunc**, which is useful as it allows to **execute SAS functions or user-written functions inside a macro-like logic**. In this case we've used the function *exist()* to confirm the presence of the dataset in *work*.

<a name="sect3"></a>

# 3. Custom macro variables

So far we've seen a few examples of macro variables **which already exist in SAS**. The flexibility of macro language relies in the fact that **we are able to create custom macros to optimise and facilitate our programming**.

<a name="subsect6"></a>

## The %macro - %mend couple

To create a custom macro variable we first need to specify the *%macro* macro, which initialises the creation of a *new macro*, followed by the *name we want to give to the macro*. Say we want to create a macro called *biomass_modif* - the first thing we need to write is

```
%macro biomass_modif;
```

Then we need to write whatever code (written in SAS or combined with more macros) that we want the macro to execute. 

```
data &ds._biomass (keep = year biomass1);
set &ds.; 
biomass1 = biomass * 0.5; 
run; 
```

To *close* the macro we need to specify another built-in macro called **%mend**. It is good practice to specify the name of the new macro next to *%mend* too, although not strictly necessary. 

This is what the macro should look like overall:

```
%mend biomass_modif;
```

![macro mend](07/../../screenshots/07_macros/macro_mend.png)

If you run the code, nothing is output as the macro has been created *not executed*. To recall the macro and execute it you just need to use it like we've used previous built-in macros: 

```
%biomass_modif;
```

As you run the line of code above, the macro does execute and creates a new dataset called *terna17_biomass*, which you can see in the *output data* tab.

![biomass modif output](07/../../screenshots/07_macros/output_tab_macro_mend.png)

<a name="subsect7"></a>

## Adding parameters to the macro variable 

Any time we want to create a new dataset called *terna17_biomass*, it is sufficient to run our new macro *%biomass_modif*. 

Don't you think this code is yet not quite flexible? 

Whenever we execute this macro we will only be able to modify a column called *called biomass* inside terna17. 

What if we wanted to modify different datasets and different columns, and what if we wanted to use a different parameter each time to multiply the variables with? 

We can do so specifying *parameters that need to be input in the macro*. In the following examples, We need to set the parameters next to the macro initialisation.

```
%macro variable_modif (lib=, data= , var= , newvar= , num=0.5);  
data &data._&var. (keep = year &newvar.);
set &data.; 
&newvar. = &var. * &num.; 
run; 
%mend variable_modif; 
```

Once we call the macro, then we can specify the actual variables that we want the macro to use. 

```
%variable_modif(lib=work, data=terna17, var=biomass ,newvar=  biomass1);
```

In this case, I've added the same parameters as above, in fact the output is the same. 

![biomass modif output](07/../../screenshots/07_macros/output_tab_macro_mend.png)

Now, we can try changing the parameters to modify another dataset and variable. 

```
%variable_modif(lib=work, data=terna17, var=Wind,newvar=  wind_modif);
```

![output macro param](07/../../screenshots/07_macros/output_macro_parameters.png)

<a name="subsect3"></a>

## Think %global act local 

The example of macro we have just seen is only applied **inside the program you currently work with**. This means that if we were writing on different programs, we would need to **recreate the same macro in each program for them to work throughout**. 

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