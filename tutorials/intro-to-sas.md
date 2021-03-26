--- 
layout: default
author: Anna
title: Intro to SAS pt. I
subtitle: Get started with SAS software and SAS Studio.
redirect_from: 
--- 

## Learning Objectives

* What SAS is, its origins, and applications

* SAS popularity and performance compared to other softwares and programming languages

* Get to know the different SAS environments

* Explore SAS Studio (OnDemand for Academics)

## Tutorial structure

<a href="#sect1">1. Introduction: what is SAS?</a>   

<a href="#subsect1"><sub>Origins</sub></a>

<a href="#subsect2"><sub>Where does SAS belong in the hierarchy of programming language generations?</sub></a>

<a href="#subsect3"><sub>Use and applications</sub></a>

<a href="#subsect4"><sub>omparison with other programming languages</sub></a>

<a href="#subsect5"><sub>SAS toolkit</sub></a>

<a href="#subsect6"><sub>Workflow</sub></a>
   
<a href="#sect2">2. SAS studio</a>

<a href="#subsect7"><sub>What is SAS Studio?</sub></a>

<a href="#subsect8"><sub>Instructions to Log in</sub></a>

<a href="#subsect9"><sub>Exploring the SAS Studio environment</sub></a>

<a href="#sect3">3. Resources</a>

---------------------------------------------

<a name="sect1"></a>

# 1. Introduction: what is SAS? 

<a name="subsect1"></a>

## Origins of SAS

SAS began in the late 60s and early 70s, formerly as a *statistical package* created for allowing analysis of large quantities of agricultural data. In fact, its name originally stood for for Statistical Analysis System. 

Its origins locate back to North Carolina State University, founded by Anthony Barr and James Goodnight, where the SAS Institute was later founded and incorporated. 

Over the years, SAS developers included an increasingly larger amount of products designed for a variety of applications, from statistical analysis to machine learning. Thanks to the new additions and the increased versatility of the product, SAS grew in popularity and use. 

SAS is considered to be part of the 4th generation of programming languages. It is, in fact, much simpler than its predecessors, like Pascal and C, as it already possesses built-in functions to make programming much easier and user-friendly. 

<a name="subsect2"></a>

## Where does SAS belong in the hierarchy of programming language generations? 

| Generations | Description | Language (examples) | 
|:---:|:---:|:---:|
| First | Machine language. Collection of binary digits or bits that the computer reads and interprets. | Machine code | 
| Second | Assembly language. Low-level programming language specific to a particular computer architecture (later converted into executable machine code). | Assembly language (ASM), Cobol, Fortran |
| Third | High-level language. Several steps removed from the actual code run on a computer's processor. Easy to read syntax. | C, C++ , Net, Java | 
| Fourth | Advanced upon third-generation programming languages. Higher level of abstraction of the internal computer driver details. Programmer-friendlier, versatile, powerful. | **SAS**, Python, R, SPSS | 
| Fifth | Constraint-based and logic programming languages. Based on problem-solving using constraints given to the program. | OPS5, Mercury |

<a name="subsect3"></a>

## Use and applications

Today, SAS is an extremely powerful, general-purpose programming language. 

It is primarily used for carrying out **advanced analytics, business intelligience, data management, and predictive analytics.**

SAS has become the undisputed market leader in commercial analytics, offering a huge array of statistical functions for people to **learn quickly**, and provides great **technical support** for troubleshooting. 

<a name="subsect4"></a>

## Comparison with other programming languages 

Comparing SAS to other programming languages, in terms of quantity of jobs available, is evident that SAS *is not the most popular language in the market*. That is due to two main reasons: 

1. SAS is not free, and many companies will opt for open-source alternatives; 
2. The jobs that do require SAS are more dedicated to report-writing than pure datascience. 

![n_datascience_jobs_comparison](https://user-images.githubusercontent.com/80749213/112302858-d8cc0180-8c9b-11eb-8e79-11878d963346.png)

SAS continues to be a leader and important tool in data management and report writing. 

![Gartner-2019](https://user-images.githubusercontent.com/80749213/112304355-ad4a1680-8c9d-11eb-81cd-1a25c39ae141.png)

Here we offer a summary on advantages and disantavantages of using SAS compared to other programming languages (SPSS, R and Python).


| | SAS | SPSS | R | Python |
|:---:|:---:|:---:|:---:|:---:|
|**Advantages** |  |  |  |   |
|  | high adoption rate (major industries) | high adoption rate (universities) | open-source, community creating libraries and contributing | scalability | 
| | flow-based interface, drag and drop | good user interface, extensive documentation | free | general purpose language | 
| | official support | click & play functionality | early adopter in explanatory and predictive modelling | easy to learn | 
| | handles large datasets| easy coding with "paste" button | easy to connect to data sources, incl. NoSQL and webscraping | good in ML | 
| | SQL integration ("PROC SQL") | official support | | big community | 
| | | | | free | 
| **Disadvantages** | | | | |
| | relatively high cost | relatively high cost | can be slow with big datasets | not as strong in explanatory modelling | 
| | does not provide an interface for non-standard options (need to code) | requires different licenses for different functionalities | steep learning curve | | 
| | slow adapting to new techniques | limited syntax | no official support | no official support | 
| | different programs for visualisation and data mining | slow in handling large datasets | no user interface | no user interface | 

<a name="subsect5"></a>

## SAS toolkit 

SAS does not come as one unique interface for each of its applications and functionalities, but serves of a variety of tools, each specified on a particular task.

Here is an overlook at the main  ones (there are more!): 

* [SAS/ACCESS](https://support.sas.com/en/software/sas-access.html#documentation) provides data access to a wide extension of data sources and formats. It provides data integration between SAS and third-party databases, to read, write and update data from all types of native databases and platforms you use; 

* [SAS/AF](https://support.sas.com/en/software/sasaf-support.html) creates portable, point-and-click applications in a development environment. With it, you have access to SAS Component Language (SCL), an object-oriented programming laguage that helps you access and display your data, control interfaces, read and write data to SAS tables and files; 

* [SAS/ASSIST](https://support.sas.com/en/software/sas-assist-support.html#documentation) is a user-friendly software to the SAS System, providing options for completing tasks without having to write code, for saving programs and running them repetitively and for customising the interface to better suit your needs; 

* [SAS/CONNECT](https://support.sas.com/en/software/sas-connect-support.html#documentation) is a client/server toolset that establishes connections between networked computers with different operating systems, and offers scalability through panel SAS processing; 

* [SAS/EIS](https://support.sas.com/en/software/sas-eis-support.html#documentation) summarises, integrates and displays information in reports that are easy to access and understand; 

* [SAS/ETS](https://support.sas.com/en/software/sasets-support.html#documentation) allows creation of models, forecasts, simulations of business processes for improving strategic and tactical business planning; 

* [SAS/FSP](https://support.sas.com/en/software/sasfsp-support.html#documentation) allows you to browse and edit contents of SAS datasets, to create new datasets and reports, to edit SAS data views, and to build and customise end-user applications: 

* [SAS/GIS](https://support.sas.com/en/software/gis-support.html) provides an interactive Geographic Information Systems interface within the SAS system. You can view and interact with the data by selecting features and performing actions based on your selections; 

* [SAS/GRAPH](https://support.sas.com/en/software/sasgraph-support.html#documentation) is a data visualisation tools, allowing you to create accurate, high-impact visuals; 

* [SAS/ML](https://support.sas.com/en/software/sasiml-support.html#documentation) translates mathematical formulas into programs for data analysis, optimisation and matrix computations; 

* [SAS/SECURE](https://support.sas.com/en/software/sas-secure-support.html#documentation) provides access to industry-standard encryption algorithms to protect data as it passes between platforms or over networks; 

* [SAS/SHARE](https://support.sas.com/en/software/sas-share-support.html#documentation) allows multiple users to gain simultaneous access to SAS files without using separate remote logins; 

* [SAS/STAT](https://support.sas.com/en/software/sas-stat-support.html#documentation) provides a comprehensive set of tools for statistical methods and visualisation techniques.

As you might have noticed, **SAS is truly wide and varied** in the range of applications and tools it offers. However, **these are not freely available**, for some you require a *specific license*, for others you need to have the tool *installed on your SAS Server first*.

Now let's move on to more practical stuff! Let's open **SAS Studiio**, a free and open platform for you to practice with SAS.

<a name="subsect6"></a>

## Workflow

Have a look at the general SAS workflow, at the base of every program you are going to write: 

![sas_workflow](https://user-images.githubusercontent.com/80749213/112639053-26816f00-8e40-11eb-99f5-a7adce9567f0.png)

As you can see from the schematic structure of the workflow above, you will: 

* **import** the data, whether these are external (.xls, .csv, .txt, etc.) or SAS datasets; 

* use statements and commands from the **DATA STEP**, whose main purpose is to read and modify data, and to **output a dataset in "SAS" format**. In the next tutorials you will see how the **DATA STEP executes code line by line and one variable at a time**; 

* use statements and commands from the **PROC STEP**, whose main purpose is to analyse data and use utility functions (see this [**link**](https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=9.4_3.5&docsetId=proc&docsetTarget=p1d7hxx6hdao18n1lyd1h3ekss3y.htm&locale=en) to check out the list of utility procedures grouped according to task). Not only, through the **PROC STEP** you can create beautiful and informative reports of your output. 

<a name="sect2"></a>

# SAS studio (OnDemand for Academics)

SAS has several programming interfaces where you can **actively write and submit code**. 

* SAS **windowing environment** is the interface that is *part of SAS*; 

* SAS **Enterprise Guide** is a *client application* that runs on your laptop and connects to SAS on a *local or remote server*; 

* SAS **Studio** is a *web-based interface* that connects to SAS on a server. There is no download necessary, and for that *you can use it* on *any computer*. 

* It is also possible to run SAS and its tools on other applications, such as **Jupyter Notebook**, but this way you **won't have access to some of the programming tools that SAS offers**.

We are going to work on **SAS Studio**, and today we are going to explore its environment and windows.

<a name="subsect7"></a>

## What is SAS Studio? 

[SAS Studio](https://www.sas.com/it_it/software/studio.html) is the web browser-based programming environment. You can access existing data files, libraries and prograrms or create your own directly from the web. 

SAS Studio connects to a SAS server, to be able to elaborate SAS commands. This server can be an internal one to the cloud environment, a server in your local environment or a copy of the SAS server in your local machine. 

Once code has been elaborated by the software, the formatted results are returned back to SAS studio. 

Let's start exploring the interface!

<a name="subsect8"></a>

## Instructions to Log in

To access SAS Studio, you first need to [**register here**](https://www.sas.com/profile/ui/#/create) to create a SAS profile. 

<img src="https://user-images.githubusercontent.com/80749213/111760264-cb2f0a00-889e-11eb-9d56-d58cae05e8c7.PNG" alt="log_in_studio" class="center">

Fill in the blanks with your personal information and credentials. 

Once you've done that, and verified your email, you can head to the [log in page](https://welcome.oda.sas.com/login) and enter your email address and password. 

![login_studio](https://user-images.githubusercontent.com/80749213/111760465-09c4c480-889f-11eb-8b23-cd20a64691ac.PNG)

When the next window opens, click on SAS Studio so we can start exploring the environment!

![open_studio](https://user-images.githubusercontent.com/80749213/111761263-01b95480-88a0-11eb-9ad9-ae192033633e.PNG)

<a name="subsect9"></a>

## Exploring the SAS Studio environment

SAS Studio (like any other SAS interface) is equipped with **three main environments**:

#### **Editor**

The editor environment allows you to open all SAS programs in which you can write code.

![editor_studio](https://user-images.githubusercontent.com/80749213/112123049-317a9c00-8bc1-11eb-86ad-6675bdd7aa55.PNG)


#### **Log**

The log environment allows you to read messages and errors related to the code you've submitted. 

![log_studio](https://user-images.githubusercontent.com/80749213/112123087-3a6b6d80-8bc1-11eb-8d3d-85e68ff993ad.PNG)


#### **Results**

This environment allows you to view the data outputs created by your programs. 


![results_studio](https://user-images.githubusercontent.com/80749213/112123121-41927b80-8bc1-11eb-8f0c-af4d46d80170.PNG)



However, unlike the other interfaces, SAS Studio presents **smart features** that ease up your programming efforts, like **code completion, formatting and syntax coloring** features. 

Let's have a look at the other features present in the SAS Studio interface. 

On the left hand side, you'll see different tabs that you can click on. 

* The **Server Files and Folders** tab shows you your "home directory" where you can create new folders where to store data you imported and programs you created. These are permanent and you can move them or delete them as you please. 

![tab1_studio](https://user-images.githubusercontent.com/80749213/112123145-48b98980-8bc1-11eb-8252-f0b2d0469492.PNG)

* The **Tasks and Utilities** tab shows you all the built-in features for data analytics, visualisation, statistical testing, etc. You can also add your own and these are going to be stored in the **My Tasks** folder (the first one at the top). 

![tab2_aperto_studio](https://user-images.githubusercontent.com/80749213/112123170-4e16d400-8bc1-11eb-94f8-aa7749b2ef1f.PNG)

* The **Snippets** tab offers you pre-made snippets of code that can come in handy so that you don't have to code entirely from scratch. As you can see in the example, I have clicked on the *Edit a SOURCE Entry* from the list of **Catalogs** inside the **Snippets** folder, and a new program appears with the *code snippet* already written inside of it. You can click on multiple snippets and these will just be added in the same program page. As for the *Tasks and Utilities* tab, you can create your own code snippets which are going to be stored in the **My Snippets** folder.

![TAB3_STUDIO](https://user-images.githubusercontent.com/80749213/112123210-58d16900-8bc1-11eb-9a4e-ba568facf99e.PNG)

* The **Libraries** tab shows you all the built-in libraries offered by SAS. A few examples:

###### **SASHELP** library offers a large variety of *read-only* sample SAS datasets; 

![tab4_sashelp](https://user-images.githubusercontent.com/80749213/112123241-61c23a80-8bc1-11eb-8dfd-77c53049d5a4.PNG)

###### **SASUSER** is an empty library initally, where you can *permanently* save your datasets; 
   
###### **WORK** is another empty library, where you can *store your data temporarily*. It is the default library in which data is stored, **unless differently specified**. 

* The **File Shortcuts** tab offers you a quicker way to access your files. You can create a new file shortcut by **clicking on the curved arrow** symbol, inserting a shortcut name and the path that leads you to the original file. You can also delete the shortcuts, see their properties and / or refresh the shortcut list when you need to update it. 

![tab4_studio](https://user-images.githubusercontent.com/80749213/112123324-743c7400-8bc1-11eb-9a98-83ff270aade8.PNG)

On the **blue bar** at the top of the SAS Studio interface (where you can see the application's name), you also have other options to speed up your programming and set your interface according to your preferences.

![top_tab_studio](https://user-images.githubusercontent.com/80749213/112124540-be722500-8bc2-11eb-8538-1254e3e6b843.PNG)

* Starting from the left, you have a search button where you can **browse for files and folders within each of these tabs more quickly**. This will come handy once your libraries and folders will become populated with more and more datasets and outputs. 

* Next to it you can see the *opened folder* symbol, **useful for opening existing folders and programs, by searching through your directory**. 

* You can also click on the *new options* symbol, and if you click on it you can see that you can choose between **opening a new SAS program, importing new data, writing a new query or XML program, closing all tabs and maximising the view of your environment**. 

* You can switch between **SAS Programmer and Visual programmer** *perspectives*, by clicking on the scroll-down menu and selecting either. Default is set to *SAS Programmer*, which contains **features most commonly needed for developing a SAS program**. On the other hand, *Visual programmer* perspective contains tools needed for managing various processes - you can define your dataset, task and variabes using **easy-to-understand drag-and-drop methods**.  

* The *more application options* button allows you to edit the **autoexec file** (code that starts automatically whenever you start the applicaton), to change which tabs on the left-hand side are displayed (default is all of them),  change preferences and restart the session. 

* Last button refers you to **SAS Support**, where you can access help guidelines, documentation and interact with SAS community. It also shows you keyboard shortcuts for using the application. 


**REMEMBER** that SAS Studio is a free platform, but with **limited free space at your disposal**. You can check out the *quota* as you go along with your practice, which you can find every time you log in, as shown below. 

![quota_free_space_studio](https://user-images.githubusercontent.com/80749213/112646521-dc03f080-8e47-11eb-8b2c-db0dadd1fda5.png)

You have completed this tutorial! 

Hopefully now you have a clear understanding of what SAS is and how SAS Studio is structured. 

We are going to start working with SAS Studio in the following tutorials. 


<a name="sect3"></a>

# 3. Resources 

* [SAS documentation](https://support.sas.com/en/documentation.html)

* [SAS Support: SAS Studio](https://support.sas.com/en/software/studio-support.html)

* [Becoming a more efficient programmer with SAS Studio](https://www.pharmasug.org/proceedings/2016/QT/PharmaSUG-2016-QT17.pdf)


