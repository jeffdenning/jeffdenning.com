
/* This file is an example do file for Econ 488. The
goal is to teach good practices for writing code.

Authors: Jeff Denning
Date 9/16/19

Input: RD_DUI.csv

Output: 
*/

*clears all memory
clear all

*changes the working directory
cd "C:\Users\Desktop\"

*begins log
log using "C:\Users\Desktop\class_example", replace text

*imports data
import delimited "C:\Users\Desktop\RD_DUI.csv", clear

*summarizes/plots datax
	describe

	sum bac recid treat run runint

	scatter recid run, xline(0)
	scatter recid run if abs(run)<.05, xline(0)

*Binning up the data more coarsely
	gen bin=run-mod(run,.005)+.0025

*Creating RD graphs
preserve

*generates mean recidivismby BAC bin
	collapse (mean) recid, by(bin)
	scatter recid bin if bin<=.15, xline(0 .07) ylabel(.05 (.025) .2 )
*saves graphs
	graph save RD, replace
	graph export rd.png, as(png) replace
restore


*Regressions

	reg recid treat run runint if abs(run)<.05, r
	outreg2 treat using regressions, replace excel
	
	rdrobust recid run


*closes log
log close
