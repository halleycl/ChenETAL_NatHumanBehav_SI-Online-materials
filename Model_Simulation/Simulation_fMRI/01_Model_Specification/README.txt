Model structure files:
semobj_neurocomp_sighted.in (for the Sighted)
semobj_neurocomp_blind.in (for the Congenitally blind) normally two parallel files for sighted and blind will be created


Training environment files:
semobj_t10_sighted_less_NEW1.ex
semobj_t10_blind_less_NEW1.ex
(NOTE: The name of each example was only used for diagnosing purpose so its training pattern has no link to their real properties of individual exemplars or categories of whatever the name was given)


Training script:
Training_sighted_proc.tcl
Training_blind_proc.tcl

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
