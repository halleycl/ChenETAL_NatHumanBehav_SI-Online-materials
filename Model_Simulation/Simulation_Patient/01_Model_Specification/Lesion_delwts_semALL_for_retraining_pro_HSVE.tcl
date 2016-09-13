##########################################################################################################
##test the model at different lesion levels of semantic links but not progressively (stepwise=5%)
source my_procs.tcl
source lang_procs.tcl

##########################################################################################################
##test the model at different lesion levels of semantic hub but not progressively (stepwise=10%)
set nsub 15
set ntname semobj_neurocomp_sighted_semLat
set tstexample1 semobj_t10_sighted_less_NEW1_moreVerbal
set tstexample2 semobj_t10_sighted_less_NEW1_visual
set testcrit 0
set ZeroR 0
set ntstxp 258
set acc 0.98
set lrate 0.001
set nupdates 500
set tarR 0.1
set bsize 0
set step 0.1
set nrep 1
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
    #for {set i 1} {$i <= $nrep} {incr i}  {   #can test the lesion effect on the same healthy model for several variations#
        for {set j 6} {$j <= $nlev} {incr j} {
		    deleteNet
			source "${ntname}.in"
			setObj testGroupCrit $testcrit
            setObj batchSize $bsize
            setObj reportInterval 500
            setObj zeroErrorRadius $ZeroR
            setObj targetRadius $tarR
            setObj learningRate $lrate
            setObj weightDecay  [expr $lrate/1000]
			gradingLRs visualhid praxishid 20 20
			loadWeights "${fhead}.wt"
            set prop [expr $stepw*$j]
			if {$prop != 0} {
                        #within SEM
			lesionLinks sem -p $prop -t semconnw
                        #lateral Ventral SEM   
            lesionLinks sem -p $prop -t semLat
            lesionLinks visualhid -p $prop -t semLat
                        #medial Ventral SEM
            lesionLinks sem -p $prop -t semMed
            lesionLinks visualhid -p $prop -t semMed
                        #pMTG
            lesionLinks sem -p $prop -t semMTG
            lesionLinks vismotionhid -p $prop -t semMTG
                        #All Dorsal SEM
			lesionLinks sem -p $prop -t semSTG
			lesionLinks {lexiconhid vercontexthid} -p $prop -t semSTG
						
			
            }
			
			loadExamples "${tstexample1}.ex"
            loadExamples "${tstexample2}.ex"			
			useTrainingSet "${tstexample1}"
			useTestingSet "${tstexample2}"
			for {set k 1} {$k<=10} {incr k} {
			    train $nupdates -a steepest
				set totalupdates [expr $nupdates*$k]
                saveWeights "${ofhead}_delWtSem${prop}_${totalupdates}_retfinal_s${sub}.wt"
				testAllFinalActs "${ofhead}_lexOutp_pnam_delWtSem${prop}_${totalupdates}_retfinal_s${sub}.txt" lexiconout
            } 
		}
			
}

