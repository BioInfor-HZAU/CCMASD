## 
![Logo](./ISSCClogo.png)

# Project Name
> Iterative Screening Algorithm Based on Sufficient Condition Conjunction to detect single SNPs and multiple SNP interactions in complex diseases.


## Table of Contents
* [General Info](#general-information)
* [Features](#features)
* [Usage](#usage)
* [Contact](#contact)

## General Information
- ISSCC algorithm is Iterative Screening Algorithm Based on Sufficient Condition Conjunction to detect single SNPs and multiple SNP interactions in complex diseases.
- The influence of SNPs on complex diseases mainly includes the following three aspects: single SNPs main effect, SNP-SNP interaction and SNP-environment interaction.
- To simultaneously detect the relationship  between SNPs (single SNP and multi-SNP combinations) and complex diseases,ISSCC algorithm is proposed.

## Features
- Strong recognition ability.
- Small amount of computation.


## Usage
How does one go about using it?
Provide various use cases and code examples here.
- Execute the "choosedata-isscc1.R" script to begin the first round of calculations, obtaining the consistency, coverage, chi-squared test, and chi-squared test P-value with Bonferroni correction for all one-dimensional SNPs. SNPs that do not achieve consistency are marked as -1. In this round, select single SNPs that meet the coverage and P-value criteria..
- Execute the "choosedata-isscc2.R" script to begin the second round of calculations. Note that when opening the "issccresult*.csv" file in Excel, the presence of thousand separators may interfere with reading the results, but this does not affect subsequent result conversion, and the execution result can be restored to normal after conversion.
- Execute the "choosedata-isscc3.R" script to begin the third round of calculations.
- Execute the "choosedata-isscc4.R" script to begin the fourth round of calculations.
- Execute the "choosedata-isscc5.R" script to begin the fifth round of calculations.
- Based on the consistency calculation in the first round, divide the SNPs into two groups, referred to as "group1.txt" and "group2.txt". The first group consists of SNPs with consistency greater than or equal to 0.5, and the second group consists of those less than 0.5. SNPs with consistency equal to 0 are not included. Execute the "imebgsccsolution.R" script to obtain the marginal effect SNP interaction (IME) of the second order. Record in the bgsccresult file.
- Perform ant colony calculation on the newdata2r data to find the combination with the maximum coverage, referred to as the joint action of micro-effect genes. Execute the "antsccsolution.R" script to obtain the results of each order of the ant colony algorithm.
- Execute the "get-variable-mapping-table" script and select the initial analysis data to obtain the variable mapping table.


## Contact
Created by [@xuwei](eric.wxu@hotmail.com) - feel free to contact me!
