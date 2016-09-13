In the folder of IntialWeights:
15 sets of random weights were used to train the sighted and blind versions of the model (NOTE: the sighted and blind versions of the model don't differ in the architecture but only differ in whether the visual patterns are included in training evironment)

These weights need to be in the same folder of the files of model specification in order to run the training scripts

In the folder of TrainedWeights:
Trained to criterion weights were saved for sighted and blind models separately. Using the commands "testFinalsTrned" or "testAllsTrned" provided in the lang_procs.tcl (in folder "01_Model_Specification") to write output files with activations in desired layers
