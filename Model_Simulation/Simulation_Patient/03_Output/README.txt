Act_visM_TPT,SEM_ALL_SD,SEM&LatVentral_HSVE+,Vihid_delWisALL_VA
Output files from R scripts of accuracy data for TPT, SD, and VA simulations.
Each folder contains an excel file with summary values and txt files are averaged accuracy values across 50 independent lesion runs

Sem_ALL_ALL&VisLat_Retraining_HSVE_HSVE+
Output files for simulations of HSVE with retraining.
subfolders:
retraining_semALL_HSVE:
output from the R script of accuracy data for HSVE simulation (SEM lesion + relearning)
retraining_semALL&moreVisLat_HSVE+:
output from the R script of accuracy data for HSVE simulation (SEM lesion & more lateral FG lesion + relearning)
(NOTE: after lesion and retrained weights are in accordingly folders called “was”, but they may not reloadable into LENS because impairment to connections were random and irrecoverable)
Lexicon_target.txt: providing the target representations for names

VisualVentral_script3.txt: sample R script can be used to calculate accuracy and latency for output data; for SEM_ALL_SD,Act_visM_TPT, and Vishid_delWisALL_VA

Different scripts were used for Retraining HSVE and HSVE+ under each corresponding folder:

VisualVentral_script_NOrelearning.r (for no-retraing/relearning simulation)
VisualVentral_script_relearning.r (for other relearning simulations at various initial impairment severities)

All_together_neurocomp_withEmpty_mVerbal_HSVE(retraining).xlsx:
The spreadsheet contains averaged final values we used from HSVE and HSVE+ simulations with retraining

Patient_Simulation_Rawdata:

Contains all the output files from LENS for each simulation



