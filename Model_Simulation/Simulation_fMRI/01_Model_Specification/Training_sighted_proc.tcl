set ntname semobj_neurocomp_sighted
source "${ntname}.in"
set nsub 15
set fhead semobj_neurocomp_sighted
set ofhead semobj_neurocomp_sighted
set trainfile semobj_t10_sighted_less_NEW1
set testfile semobj_t10_sighted_less_NEW1
set tmode ORDERED
set testcrit 0.1
set ZeroR 0
set ntstxp 176
set acc 0.98
set lrate 0.01
set nupdates 100
set tarR 0
set bsize 0
set outfile1 [open "${ofhead}_training_acc_crit${testcrit}.log" a]
set outfile2 [open "${ofhead}_training_err_crit${testcrit}.log" a]
setObj testGroupCrit $testcrit
setObj batchSize $bsize
setObj reportInterval 1000
setObj zeroErrorRadius $ZeroR
setObj targetRadius $tarR
setObj learningRate $lrate
setObj weightDecay  [expr $lrate/100]
gradingLRs visualhid praxishid 20 20
autoPlot 10

for {set i 1} {$i<= $nsub} {incr i} {

                    if {$i < 10} {
                    set subID "s0$i"
			 } else {
		    set subID "s$i"
		    }
                         
                         resetNet
                         disconnectGroups visualhid praxishid
                         disconnectGroups praxishid visualhid
                         setObj learningRate $lrate
                         setObj weightDecay  [expr $lrate/100]
                         gradingLRs visualhid praxishid 20 20
                         autoPlot 10 
	                 loadWeights "${fhead}_initial_$subID.wt"
			 loadExamples "${trainfile}.ex"
		         loadExamples "${testfile}.ex"
			 useTrainingSet "${trainfile}"
			 useTestingSet "${testfile}"
			 set stepw $nupdates
			 test
			 puts $outfile1 "$subID " nonewline
			 puts $outfile2 "$subID " nonewline
             puts $outfile1 "[format "%.2f" $Test(percentCorrect)] " nonewline
			 puts $outfile2 "[format "%.2f" $Test(totalError)] " nonewline
		    for {set j 0} {$j<=5} {incr j} {
			 
			 if {$j==0} {
			
			 
			     while {[getObj totalUpdates]<[expr (5+$j)*100*$nupdates]} {
                             train $stepw -a steepest
                             test
							 if {[expr [getObj totalUpdates]%1000]==0} {
							 puts $outfile1 "[format "%.2f" $Test(percentCorrect)] " nonewline
			                 puts $outfile2 "[format "%.2f" $Test(totalError)] " nonewline
							 }
				 if {$Test(examplesCorrect)>[expr $ntstxp*$acc]} {
                                    break
				 }
                              } 
			 } else {
			 setObj learningRate [expr (6-$j)*$lrate/10]
			 setObj weightDecay [expr (6-$j)*$lrate/1000]
			
			     for {set u 0} {$u<=19} {incr u} {
				 setObj "visualhid.unit(${u}).block(3).learningRate"  [expr [getObj "visualhid.unit(${u}).block(5).learningRate"]*(6-$j)/10]
				 for {set bl 2} {$bl <= 21} {incr bl} {
				     setObj "praxishid.unit(${u}).block(${bl}).learningRate" [expr [getObj "praxishid.unit(${u}).block(${bl}).learningRate"]*(6-$j)/10]
				      }     
                                 }

			 while {[getObj totalUpdates]<[expr (5+$j)*100*$nupdates]} {
                                train $stepw -a steepest
                                test
								if {[expr [getObj totalUpdates]%1000]==0} {
							         puts $outfile1 "[format "%.2f" $Test(percentCorrect)] " nonewline
			                         puts $outfile2 "[format "%.2f" $Test(totalError)] " nonewline
							        }
			     if {$Test(examplesCorrect)>[expr $ntstxp*$acc]} {
                                     break
			     }
			 }
			 }

			 if {$Test(examplesCorrect)>[expr $ntstxp*$acc]} {
                                     break
			 }
		     }
	           set tnupdts [expr [getObj totalUpdates]/$nupdates/10.0]
                   saveWeights "${ofhead}_${tnupdts}kTE_$subID.wt"
			       puts $outfile1 "\n" nonewline
				   puts $outfile2 "\n" nonewline
		}

		close $outfile1
		close $outfile2