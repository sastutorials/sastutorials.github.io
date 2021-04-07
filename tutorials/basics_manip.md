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

<a href="#sect1">1. First analyses (observational)</a>

<a href="#subsect1"><sub>Familiarise with the dataset</sub></a>

<a href="#subsect2"><sub>Format the data</sub></a>

<a href="#subsect3"><sub>Quick summary statistics</sub></a>

<a href="#sect2">3. Data manipulation </a>

<a href="#subsect4"><sub>Cleaning and sorting</sub></a>

<a href="#subsect5"><sub>Feature engineering</sub></a>

<a href="#subsect6"><sub>Save your new dataset!</sub></a>

<a href="#sect3">4. Resources</a>

<a name="sect1"></a>

# 1. First analyses (observational)

Every data scientist has a specific workflow to carry out a project: importing, cleaning, analysing dataset(s) and presenting an output, usually through a visual medium. **80% of our work consists of cleaning and preparing the datasets for analysis and modelling**. As you can imagine, raw datasets come in all shapes and forms, and that is way it takes way more time and effort to clean them, sort them, create new variables, than carrying out the analysis and reporting. 

![datascience_workflow](../screenshots/04_basic_manip/datascience_workflow.png)

<a name="subsect1"></a>

## Familiarise with the dataset

Once you have your data imported on your programming interface, the first thing you need to do is to familiarise with the dataset or series of datasets you are working with. 

You should have your datasets uploaded and imported on SAS Studio. If you haven't got them yet, you can download them from [here](/terna_data). You should first extract the files within the zip folder, then upload them on SAS Studio. The files come in three formats, and you might want to check out the tutorial on [data access](/tutorials/accessing_data.html), to learn how to **import them on SAS Studio**. Once you've done that, you can come back here to start this tutorial!

![imported_data](../screenshots/04_basic_manip/screen_imported_data.png)




<a name ="subsect2"></a>

## Format the data

Before manipulating the datasets at your disposal, the first thing to do is to see what type of data you are dealing with, so that you understand how you can manipulate it and you can start thinking about the potential analyses. We refer to **data types** as **the type of format of the data values** in your dataset. 

There are **three mains data types**: 

1. Numeric 
2. Character string 
3. Datetime

SAS reads the numeric data type by default. However, it is necessary to add specifications to make SAS read particular types of numerical data and other data types. 

Our sample dataset ... 

### Formats and informats 

### Numeric formatting 

### String formatting 

### Datetime formatting 

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

