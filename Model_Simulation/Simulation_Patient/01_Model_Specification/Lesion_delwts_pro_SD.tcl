##########################################################################################################
##test the model at different lesion levels of semantic links but not progressively (stepwise=5%)
source my_procs.tcl
source lang_procs.tcl

##########################################################################################################
##test the model at different lesion levels of semantic hub but not progressively (stepwise=10%)
set nsub 15
set ntname semobj_neurocomp_sighted
set tstexample1 semobj_t10_sighted_less_NEW1_visual
set step 0.1
set nrep 50
set nlev 10
source "${ntname}.in"
gradingLRs visualhid praxishid 20 20
for {set s 1} {$s<=$nsub} {incr s} {

 if {$s < 10} {
    set sub "0${s}"} else {
	set sub $s
	}	

set fhead "semobj_neurocomp_sighted_withEmpty_mVerbal_100.0kTE_s${sub}"
set ofhead semobj_neurocomp_sighted_withEmpty_mVerbal_trained
set stepw $step
          for {set i 1} {$i <= $nrep} {incr i}  {   #can test the lesion effect on the same healthy model for several variations#
           for {set j 1} {$j <= $nlev} {incr j} {
		    deleteNet
			source "${ntname}.in"
			gradingLRs visualhid praxishid 20 20
			loadWeights "${fhead}.wt"
            set prop [expr $stepw*$j]
			if {$prop != 0} {
            
			lesionLinks sem -p $prop -t semconnw
			lesionLinks sem -p $prop -t semconnb
			lesionLinks {visualhid vismotionhid lexiconhid vercontexthid} -p $prop -t semconnb
			}
			
			loadExamples "${tstexample1}.ex"			
			useTrainingSet {}
			useTestingSet $tstexample1
		       	testAllFinalActs "${ofhead}_lexOutp_pnam_delWtSem${prop}_final_s${sub}_$i.txt" lexiconout
			
		       	}
}
}
