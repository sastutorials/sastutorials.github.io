--- 
layout: default
title: Basics of data manipulation
subtitle: Learn about different SAS functions to implement in the data step.
--- 

## Learning Objectives 

* Properly format the variables before modifying them 

* Explore the DATA step and its group of statements in detail, in particular how to modify variables, have control over their execution and create calculated fields

* Compare the use of DATA step statements in CAS

* Learn about different options to control the output for the entire dataset, for only certain observations and / or variables

## Structure 

<a href="#sect1">1. Observational analyses</a>

<a href="#subsect1"><sub>Familiarise with the dataset</sub></a>

<a href="#subsect2"><sub>Format the data</sub></a>

<a href="#subsect3"><sub>Quick summary statistics</sub></a>

<a href="#sect2">3. Data manipulation </a>

<a href="#subsect4"><sub>Cleaning and sorting</sub></a>

<a href="#subsect5"><sub>Feature engineering</sub></a>

<a href="#subsect6"><sub>Save your new dataset!</sub></a>

<a href="#sect3">4. Resources</a>

<a name="sect1"></a>

# 1. Observational analyses

Every data scientist has a specific workflow to carry out a project: importing, cleaning, analysing dataset(s) and presenting an output, usually through a visual medium. **80% of our work consists of cleaning and preparing the datasets for analysis and modelling**. As you can imagine, raw datasets come in all shapes and forms, and that is way it takes way more time and effort to clean them, sort them, create new variables, than carrying out the analysis and reporting. 

![datascience_workflow](../screenshots/04_basic_manip/datascience_workflow.png)

**In this tutorial we are going to learn how to carry out some basic data manipulation with SAS.**

<a name="subsect1"></a>

## Familiarise with the dataset

Once you have your data imported on your programming interface, the first thing you need to do is to familiarise with the dataset or series of datasets you are working with. 

You should have your datasets uploaded and imported on SAS 
Studio. If you haven't got them yet, you can download them 
by clicking on the button below. 

<center>
    <form action="AD">
        <a href="/terna_data/terna_data.zip"><input type="button" value="DOWNLOAD THE FILE"></a>
    </form>
</center>

You should first extract the files within the zip folder, then upload them on SAS Studio. The files come in three formats, and you might want to check out the tutorial on [data access](/tutorials/accessing_data.html), to learn how to **import them on SAS Studio**.

I am going to assume you have the 6 datasets ready to work with.

![imported_data](../screenshots/04_basic_manip/screen_imported_data.png)

You can make sure that all datasets have been temporarily stored inside the *work* library, with the name you've given. I have called the datasets *ternaN* where N stands for the years 2016 until 2021 (the most recent observation). 

Once you've headed to the library, you can also check the content of each dataset. For instance, open the dropdown menu from Terna16. 

![dropdown](../screenshots/04_basic_manip/dropdown_work.png)

Each variable is accompanied by a symbol which already **gives you information on the format of the variable**. You can see most variables are numeric except *date*, which is datetime format. 

We can also quickly explore the datasets by executing two procedures: **proc contents** and **proc print**. 

#### PROC CONTENTS 

Copy the following in a new SAS program (call the program *tutorial_basic_manip.sas*, if you wish to keep it in the future). 

```
/*Executing proc contents on the datasets*/

proc contents data=work.terna16;
proc contents data=work.terna17;
proc contents data=work.terna18;
proc contents data=work.terna19;
proc contents data=work.terna20;
proc contents data=work.terna21;
run;
```

With this code we are repeating the same thing: we want to know **information on the contents of each data set**. In this case, **it is sufficient to run the procedures once**.

Let's use again terna16 as an example - we have repeated the same procedure on all datasets so showing you one of the results is enough. 

![proc_contents_terna16](../screenshots/04_basic_manip/proc_cont_terna16.png)

The proc contents statement gives us a nice overview about the dataset. We are provided with three tables, which you've already explore in the [data access](accessing_data.html) tutorial. 
 
* **dataset description**, including: dataset name and the library it is contained within, n of observations, of variables and the maximum length allowed for a data value; 
* **Engine/host dependent information**: information about how SAS Studio stores and outputs the dataset; 
* **Alphabetic List of Variables and Attributes**: as the title explains, it gives a more in depth overview of the variables contained inside the dataset. 

**SPIEGARE DI PIU' SUL PROC CONTENTS:** 
* LABEL 
* ALTRE OPTIONS NEL PROC CONTENTS PER RENDERE IL TUTTO PIU' INFORMATIVO

#### PROC PRINT 

Another useful thing to do when getting to know the dataset is to print out its raw data. 

```
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
```

Again, the code repeats equally for all datasets. However, if you ran it, you would get the **entire dataset printed in the results tab**. 

We could scroll down to see every single row for each dataset, or we could just tell SAS to **print the top 10 and bottom 10 observations**.

To do so, **copy** the following code: 

```
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
```

![top_bottom_10](../screenshots/04_basic_manip/top_bottom_10.png)

<a name ="subsect2"></a>

## Format the data

Before getting to the actual manipulation of the datasets, you always need to **observe the characteristics of the variables and observations inside each dataset**. 

This way, you can start getting a general **overview** of them, and see if any **formatting changes** need to be made. 

We know that variables can be formatted as either of these three ways:  

1. Numeric 
2. Character string 
3. Datetime

SAS reads *numeric data* by default. However, it is necessary to **add specifications** to make SAS read particular types of **numerical** data as well as **other data formats** (or *types*). 

### Formats and informats 

Do you recall the concept of format and informat statements from [accessing data](tutorials/../accessing_data.html)?

Informats and formats present the same formatting specifications. However, **they are used for very different purposes**. The **informat** statement enables SAS to read a non-standard variable, while the **format** statement allows SAS to display the same variable when printed to the output window or viewed in a viewtable window. This implies that **before the format statement there always needs to be an informat**. In fact, printing an output without having *_in_formatted the data* first will not display anything because SAS has not been able to read and interpret it. 

**INSERTING PIC OF INFORMAT-FORMAT WORKFLOW**

The syntax does not vary between formats and informats, and it is generally presented as

**(IN)FORMAT*w.d***

where

* *(IN)FORMAT* represents the name of the format or informat; 
* *w.* refers to the **character** length to be specified, if not the default specific to that (in)format applies;
* *d* refers to the **number of decimal points to be included**. This is specific to the numeric format, and to some of the *date* formats and informats (in that case relating to *fraction of seconds*).

Let's explore examples of typical formats divided by **category**. We will then use some of them to better format our datasets.

### Numeric (in)formatting 

| Syntax | Definition | Width range | Default width |
|:---:|:---:|:---:|:---:|
| *w.d* | Reads standard numeric data | 1-32 | None |
| BZ*w.d* | Converts blanks to 0s | 1-32 | 1 | 
| COMMA*w.d* | Removes embedded comma and/or $ , converts *left parenthesis* to a *minus sign* |1-32 | 1 | 
| PERCENT*w.* | Converts *percentage* to a *proportion* | 1-32 | 6 |
| DOLLAR*w.d* | Turns the number into *currency*, by inserting the *$* in front of the value | 2-32 | 6 | 
| WORDS*w.d* | Converts the numeric value to *written* (string) *format* | 5–32767 | 10 |

### String (in)formatting 

| Syntax | Definition | Width range | Default width |
|:---:|:---:|:---:|:---:|
| $*w.* | Reads character data and *trims leading blanks* | 1–32,767 | None |
| $CHAR*w.* | Reads character data but *does not trim* leading or trailing blanks | 1–32,767 | 8 or length of var | 
| $UPCASE*w.* | Converts character data to *upcase* | 1–32,767 | 8 | 
| $QUOTE*w.* | Removes *matching quotation marks* from character data | 2 if var length undefined, otherwise length of var + 2 | 2–32767 |
| $REVERS*w.* | Reads character data *from right to left and left aligns*, removes *blanks* | 1 if width of output field not specified | 1–32767 | 
| $VARYING*w.* | Reads character data of *varying length* | Default length of variable; 8 if variable is undefined | 1–32767 | 

### Datetime (in)formatting 

| Syntax | Definition | Width range | Default width |
|:---:|:---:|:---:|:---:|
| DATE*w.* | Reads dates in forms *ddmmyyyy* and *ddmmyy* | 7-32 | 7 | 
| DATETIME*w.* | Reads datetime values in the form: *ddmmyy hh:mm:ss:ss* | 13-40 | 18 |
| TIME*w.d* | Reads time in form: *hh:mm:ss:ss* (or *hh:mm*) using a 24-h clock | 5-32 | 8 |
| DDMMYY*w.* | Reads date values in the form *ddmmyy* or *ddmmyyyy* | 2-10 | 8 |
| MONYY*w.* | Reads month and yer date values in the form *mmmyy* or *mmmyyyy* | 5-7 | 5 |
| YYQ*w.* | Reads *quarters* of the year | 4-32 | 6 |

<a name="subsect3"></a>

## Quick summary statistics

<a name="sect2"></a>

# 3. Data manipulation 

<a name="subsect4"></a>

## Cleaning and sorting 

<a name="subsect5"></a>

## Feature engineering 

<a name="subsect6"></a>

## Save your new dataset!

<a name="sect3"></a>

# 4. Resources 

* [Informats and formats by category](http://v8doc.sas.com/sashtml/lrcon/z0920449.htm);
* 