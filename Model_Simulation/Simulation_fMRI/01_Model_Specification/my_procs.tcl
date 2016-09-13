# prints the activation of a unit
# use with printUnitValues to write to a file for whole groups
proc printActivation {group unit} {format "%.3f " [getObj $unit.output]}

proc saveActivations {fname groups} {
    # open a channel to fname, output to be appended
    set outfile [open $fname a]
    puts $outfile "[getObj currentExample.num] [getObj currentExample.name] [getObj currentTick] " nonewline
    printUnitValues -$outfile printActivation $groups
    puts $outfile "\n" nonewline
    close $outfile
}

proc testAllFinalActs {fname groups} {
    resetExampleSet [getObj testingSet.name]
    set nex [getObj testingSet.numExamples]
    for {set i 0} {$i < $nex} {incr i} {
	doExample -set [getObj testingSet.name]
	saveActivations $fname $groups
    }
}

proc testAllActs {fname groups} {
    resetExampleSet [getObj testingSet.name]
    set nticks [getObj historyLength]
    set nex [getObj testingSet.numExamples]
    set outfile [open $fname a]

    setObj testGroupCrit 0.0

    for {set iex 0} {$iex < $nex} {incr iex} {
	doExample
	for {set itick 0} {$itick < $nticks} {incr itick} {
            puts $outfile "$iex $itick " nonewline
	    foreach igroup $groups {
		set nunits [getObj "$igroup.numUnits"]
		for {set iunit 0} {$iunit < $nunits} {incr iunit} {
		    puts $outfile [format "%.3f " [getObj "$igroup.unit($iunit).outputHistory($itick)"]] nonewline
		}
	    }
	    puts $outfile "\n" nonewline
	}
    }
    close $outfile
}
