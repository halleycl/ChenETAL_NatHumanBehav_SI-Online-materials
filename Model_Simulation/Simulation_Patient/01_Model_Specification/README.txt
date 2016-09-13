Model structure files:
semobj_neurocomp_sighted.in (for the Sighted)


semobj_neurocomp_sighted_semLat.in (this model structure file was used for the retraining scripts for HSVE and HSVE+, because different types of connections were specified)


Training environment files:
semobj_t10_sighted_less_NEW1_moreVerbal.ex
(NOTE: This training environment used the same category prototypes and exemplar representations except that training on the verbal information, both names and verbal descriptions, were tripled to balance the exposure of animal and artifact knowledge in the model; this is due to the fact that the function and praxis knowledge were trained only for artifacts)


Training and lesion scripts:
Training_sighted_proc.tcl (to train the sighted model for lesion analysis)

Lesion_delwts_pro_SD.tcl (lesion script for SD case; all incoming and outgoing connections with ATL were affected)

Lesion_delwts_pro_TPT.tcl (lesion script for Temporal-parietal Tumor (TPT) case: based on recent evidence, the pMTG-IPL regions were associated with the severity of category-impairment of artifacts in TPT, especially the connections between pMTG and IPL; therefore, for simulating TPT, we lesion of connections coming in and going out of pMTG and IPL layers)

Lesion_delwts_pro_VA.tcl (lesion script for visual agnosia (VA):lesion was done from visual output layer to visual hidden layer; in order to have some visual inputs, lesion was done at a smaller proportion)

Lesion_delwts_semALL_for_retraining_pro_HSVE.tcl (training script to lesion the trained sighted models with different levels of lesion severity and different amount of retraining for HSVE; the lesion for this simulation was only applied to all connections to ATL equally as in lesion for SD)

Lesion_delwts_semALL_for_retraining_pro_HSVE+.tcl (this training was used to simulate a second account for HSVE, namely, more lateral lesion between ATL and FG; therefore, it is essentially the same procedure as previous one, except that during the lesion procedure, more lesion was applied to lateral connection between ATL and FG)


Other files:
my_procs.tcl (provided by Dr. Tim Rogers; self-written script to write out output activations)
lang_procs.tcl (provided by Dr. Lang Chen; self-written scripts/functions for writing outputs and creating graded connections)

Acc_testing_proc.tcl (provided by Dr. Lang Chen; self-written scripts to calculate overall accuracy of models in each condition, modality, stimuli type)

Testing environment for accuracy:
semobj_t10_sighted_less_NEW1_auditory_animal.ex
semobj_t10_sighted_less_NEW1_auditory_tool.ex
semobj_t10_sighted_less_NEW1_visual_animal.ex
semobj_t10_sighted_less_NEW1_visual_tool.ex
semobj_t10_sighted_less_NEW1_auditory.ex
semobj_t10_sighted_less_NEW1_visual.ex


