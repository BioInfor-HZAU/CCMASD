## 
![Logo](./SCClogo.png)

# Project Name
> Sufficient Condition Conjunction algorithm to detect single SNPs and multiple SNP interactions in complex diseases.


## Table of Contents
* [General Info](#general-information)
* [Features](#features)
* [Usage](#usage)
* [Contact](#contact)

## General Information
- SCC algorithm is Sufficient Condition Conjunction algorithm to detect single SNPs and multiple SNP interactions in complex diseases.
- The influence of SNPs on complex diseases mainly includes the following three aspects: single SNPs main effect, SNP-SNP interaction and SNP-environment interaction.
- To simultaneously detect the relationship  between SNPs (single SNP and multi-SNP combinations) and complex diseases,SCC algorithm is proposed.

## Features
- Strong recognition ability.
- Small amount of computation.


## Usage
How does one go about using it?
Provide various use cases and code examples here.
- Copy the "comparison" folder to the default working directory of R.
- Install MDR package.
- Install SCC package.
- To compare MDR, BOOST and SCC in the Gametes simulated data set, run "comparison-gametesdata 100 data set-MDR-BOOST-SCC" script.
- To compare MDR, BOOST and SCC in the real data set, run "comparison-choosedata-SCC-MDR-BOOST" script and you can modify the two parameters: “consistencythreshold" and "maximumofconditions”.
- The data is stored in the "data" directory.
- View the results in the "result" directory.
- To convert the SNPs of the "natural breaking point" calculation results into RS numbers, please run the "transform consistency result" script. 8.1 choose variable comparison table. 8.2 choose result file.
- To convert the SNPs calculated by the equivalent analysis into RS numbers, please run the "transform equivalence result" script. 9.1 choose result file. 9.2 choose variable comparison table.


## Contact
Created by [@xuwei](eric.wxu@hotmail.com) - feel free to contact me!
