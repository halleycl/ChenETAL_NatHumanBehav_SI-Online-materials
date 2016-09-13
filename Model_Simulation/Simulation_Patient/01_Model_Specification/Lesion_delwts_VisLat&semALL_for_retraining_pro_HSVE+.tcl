

##########################################################################################################
##test the model at different lesion levels of semantic links but not progressively (stepwise=5%)
source my_procs.tcl
source lang_procs.tcl

##########################################################################################################
##test the model at different lesion levels of semantic hub but not progressively (stepwise=10%)
set nsub 5
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
            if {$prop > 0.5} {
			lesionLinks sem -p 1.0 -t semLat
            lesionLinks visualhid -p 1.0 -t semLat
			} else {
            lesionLinks sem -p [expr $prop*2] -t semLat
            lesionLinks visualhid -p [expr $prop*2] -t semLat
			}
                        #medial Ventral SEM
            lesionLinks sem -p $prop -t semMed
            lesionLinks visualhid -p $prop -t semMed
                        #pMTG
            lesionLinks sem -p $prop -t semMTG
            lesionLinks vismotionhid -p $prop -t semMTG
                        #All Dorsal SEM
			lesionLinks sem -p $prop -t semSTG
			lesionLinks {lexiconhid vercontexthid} -p $prop -t semSTG
						
			#lesionLinks vismotionhid -p $prop -t semMTG
			#lesionLinks {vismotionhid visualhid actionhid} -p $prop -t parconn
			
			#lesionLinks vismotionhid -r $prop -m -t semMTG
			#lesionLinks {vismotionhid visualhid actionhid} -r $prop -m -t parconn
            }
			
			loadExamples "${tstexample1}.ex"
            loadExamples "${tstexample2}.ex"			
			useTrainingSet "${tstexample1}"
			useTestingSet "${tstexample2}"
			for {set k 1} {$k<=10} {incr k} {
			    train $nupdates -a steepest
				set totalupdates [expr $nupdates*$k]
                saveWeights "${ofhead}_delWtSem&moreVisLat${prop}_${totalupdates}_retfinal_s${sub}.wt"
				testAllFinalActs "${ofhead}_lexOutp_pnam_delWtSem&moreVisLat${prop}_${totalupdates}_retfinal_s${sub}.txt" lexiconout
            } 
		}
			#useTestingSet $tstexample1
			#testAllFinalActs "${ofhead}_actOutp_pnam_noiseWtSem${prop}_final_s${sub}.txt" actionout
			#testAllFinalActs "${ofhead}_visOutp_pnam_noiseWtSem${prop}_final_s${sub}.txt" visualout
			#testAllFinalActs "${ofhead}_mVerbal_lexOutp_pnam_delWtSemALL_${prop}_final_s${sub}_$i.txt" lexiconout
			#testAllFinalActs "${ofhead}_lexOutp_pnam_delWtAct&Vismotion${prop}_final_s${sub}_$i.txt" lexiconout
			
			#useTestingSet $tstexample2
			#testAllFinalActs "${ofhead}_actOutp_wdef_noiseWtSem${prop}_final_s${sub}.txt" actionout
			#testAllFinalActs "${ofhead}_visOutp_wdef_delWtSem${prop}_final_s${sub}_$i.txt" visualout
			#testAllFinalActs "${ofhead}_lexOutp_wdef_noiseWtSem${prop}_final_s${sub}.txt" lexiconout
			
    #}
}

