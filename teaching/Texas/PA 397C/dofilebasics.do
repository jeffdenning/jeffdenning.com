/* This file is an example do file for Econ 488. The
goal is to teach good practices for writing code.

Authors: Jeff Denning
Date 9/16/19

Input: Nothing

Output: regressions.xls
		data.dta (data for regression)
*/

*clears all memory
clear all

*changes the working directory
cd "C:\Users\jtd44\Desktop\"

*begins log
log using "C:\Users\jtd44\Desktop\class_example", replace text

*generates data
set obs 1000
gen x=rnormal()
gen y=rnormal()

*simple analysis
regress y x

*outputs regressions
outreg2 x using regressions, excel replace

*saves data for later use
save data, replace

*closes log
log close
