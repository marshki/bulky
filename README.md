# BULKY 

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/fb82654b6fd24aa0b37fe1cd9e0275c1)](https://www.codacy.com/app/marshki/BULKY?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/BULKY&amp;utm_campaign=Badge_Grade)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

A shell script to rename files en masse. 

BULKY finds and replaces the FIRST occurrence of a string in ALL file names 
that CONTAIN that string, e.g.: 

| Find: "tale"     |                   | Replace: "tail"  |
|------------------|-------------------|------------------|
| tall_tales.csv   |            -->    | tall_tails.csv   | 
| tall_tales.html  |            -->    | tall_tails.html  | 
| tall_tales.json  |            -->    | tall_tails.json  | 
| tall_tales.txt   |            -->    | tall_tails.txt   | 

BULKY can also find/replace the FIRST occurrence of a string in ALL file names 
that CONTAIN that string and END WITH a specific file extension, e.g.: 

| Find: "tale"     | Extension: "txt" | Replace: "tail"  |
|------------------|------------------|------------------|
| duck_tales.html  |                  | duck_tales.html  | 
| fairy_tales.txt  |            -->   | fairy_tails.txt  | 
| snails_tales.csv |                  | snails_tales.csv |
| tall_tales.txt   |            -->   | tall_tails.txt   | 
| whales_tales.txt |            -->   | whales_tails.txt | 

BULKY logs changes made to: `bulky.sh.log` in the `pwd` with a time stamp. 

## Getting Started

Drop `bulky.sh` in the directory containing the files to be renamed, 
then do: `bash bulky.sh`and follow on-screen prompts.  

## History

First commit: 2019.01.29 

## License

[MIT license](https://opensource.org/licenses/MIT). 'Nuff said. 
