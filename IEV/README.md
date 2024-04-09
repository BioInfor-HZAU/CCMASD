## 
![Logo](./logo.png)

# Project Name
> Iterative Exclusion of Variables algorithm for the detection of associated SNPs in complex diseases.


## Table of Contents
* [General Info](#general-information)
* [Features](#features)
* [Usage](#usage)
* [Contact](#contact)

## General Information
- IEV algorithm is for the detection of associated SNPs in complex diseases.
- Some epistasis analysis methods have been proposed so far, however, there are still some problems, such as the limit of SNPs’ order, heavy computational burden and unexplainable results, etc.
- IEV could analyze the relationship between SNPs and complex diseases with less computation.

## Features
- Strong recognition ability.
- Small amount of computation.


## Usage
How does one go about using it?
Provide various use cases and code examples here.
- Copy the "comparison" folder to the default working directory of R.
- Install MDR package.
- Install iev package.
- To compare MDR, BOOST and IEV in the simulated data set, run "comparison-different noise iteration 1000-MDR-BOOST-IEV" script.
- To compare MDR, BOOST and IEV in the real data set, run "comparison-choosedata-IEV-MDR-BOOST" script. you can modify two parameters of necessaryconditions function: "consistencythreshold" and “coveragethreshold”. you can also modify two parameters of iev function: "iteration" and “consistencythreshold”.
- The data is stored in the "data" directory.
- View the results in the "result" directory or in the R window.
- To generate simulated data with strict, epistatic models of different noise, employ generatedata function.


## Contact
Created by @xuwei - feel free to contact me!
