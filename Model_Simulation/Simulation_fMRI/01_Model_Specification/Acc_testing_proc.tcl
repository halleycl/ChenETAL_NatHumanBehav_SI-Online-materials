set ntname semobj_neurocomp_sighted
source "${ntname}.in"
set nsub 15
set fhead semobj_neurocomp_sighted_withEmpty_trained
set ofhead semobj_neurocomp_sighted_allsubjs_acc
set testfile(1) semobj_t10_sighted_less_NEW1
set testfile(2) semobj_t10_sighted_less_NEW1_visual
set testfile(3) semobj_t10_sighted_less_NEW1_auditory
set testfile(4) semobj_t10_sighted_less_NEW1_visual_animal
set testfile(5) semobj_t10_sighted_less_NEW1_visual_tool
set testfile(6) semobj_t10_sighted_less_NEW1_auditory_animal
set testfile(7) semobj_t10_sighted_less_NEW1_auditory_tool
set testcrit 0.5
set outfile [open "${ofhead}_crit${testcrit}.txt" a] 
setObj testGroupCrit $testcrit
gradingLRs visualhid praxishid 20 20
autoPlot 10

for {set i 1} {$i<= $nsub} {incr i} {
            
        if {$i < 10} {
        set subID "s0$i"
			 } else {
		    set subID "s$i"
		    }
                         
                 resetNet
                 loadWeights "${fhead}_$subID.wt"
				 for {set j 1} {$j<=7} {incr j} {
				   
			       loadExamples "$testfile($j).ex"	         
			       useTrainingSet ""
			       useTestingSet $testfile($j)
				   test
			     puts $outfile "[format "%.2f" $Test(percentCorrect)] " nonewline 
                 }
                 puts $outfile "\n" nonewline
}

close $outfile
				 

		    
