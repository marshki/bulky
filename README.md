# BULKY 

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/fb82654b6fd24aa0b37fe1cd9e0275c1)](https://www.codacy.com/app/marshki/BULKY?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/BULKY&amp;utm_campaign=Badge_Grade)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

A shell script to rename files en masse. 

**BULKY** finds and replaces the **FIRST** occurrence of a string in **ALL** files  
that **MATCH** a search term (__by string__), e.g.:  

red_**white**_blue_00.csv --> red_**pink**_blue_00.csv

red_**white**_blue_00.html --> red_**pink**_blue_00.html 

red_**white**_blue_00.txt --> red_**pink**_blue_00.txt 

or that **MATCH** a search term (__by extension__) for ALL files of an extension, e.g.: 

**red_white_blue**_00.txt --> **big_red**_00.txt

**red_white_blue**_01.txt --> **big_red**_01.txt

**red_white_blue**_02.txt --> **big_red**_02.txt 

## TODO: 

Loop back if user does not confirm changes (not exit). 

Add loop back if files not found? 

Arg parse? 

Add exit code 1 to log file 
