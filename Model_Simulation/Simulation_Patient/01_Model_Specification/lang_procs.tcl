#testing all ativations with trained weights

proc testAllsTrned {nsub fhead grp} {
      resetNet
      setObj testGroupCrit 0
    
      for {set i 1} {$i <=$nsub} {incr i} {
          if {$i < 10} {
	      loadWeights "${fhead}_s0$i.wt"
              
           testAllActs "${fhead}_all_tool_${grp}_s0$i.txt" $grp
          } else {
	      loadWeights "${fhead}_s$i.wt"
              
           testAllActs "${fhead}_all_tool_${grp}_s$i.txt" $grp
	  }
      }
}



#test the final activations in grp with trained model with tepoch traing
proc testFinalsTrned {nsub fhead ofhead grp} {
      resetNet

      setObj testGroupCrit 0
    
      for {set i 1} {$i <=$nsub} {incr i} {
          if {$i < 10} {
	      loadWeights "${fhead}_s0$i.wt"
	      testAllFinalActs "${ofhead}_final_${grp}_s0$i.txt" $grp
          } else {
	      loadWeights "${fhead}_s$i.wt"
	      testAllFinalActs "${ofhead}_final_${grp}_s$i.txt" $grp
	  }
      }
}

#save initial weights 

proc saveIniWeights {nsub fhead} {
    for {set i 1} {$i <= $nsub} {incr i} {
        if {$i < 10} {
           saveWeights "${fhead}_s0$i.wt"
        
	  
	} else {
	    saveWeights "${fhead}_s$i.wt"
          
	 
        }
       
        resetNet
    }
}



#create connections between grp1 and grp2 with increasing LearningRate and the grading effect is on grp1 (from 0 to Nunits1)

proc gradingLRs {grp1 grp2 Nunits1 Nunits2} {
     

    for {set i 0} {$i < $Nunits1} {incr i} {
	 addLinkType "${grp1}_${grp2}_$i"
	set baseLR [getObj learningRate]
	for {set j 0} {$j < $Nunits2} {incr j} {
	    connectUnits  "{$grp2:$j}" "{$grp1:$i}" -t "${grp1}_${grp2}_$i" -bi -m 0 -r 0.1 
	}
	setLinkValues learningRate [expr 2*${baseLR}/(1+pow(2.71828183,(${Nunits1}/2-${i})))] -t "${grp1}_${grp2}_$i"
     }
}
