Model performance:
Accuracy of trained models on overall patterns
acc_neurocomp_sighted.xlsx
acc_neurocomp_blind.xlsx

Folder: Activation_hidden_sighted and Activation_hidden_blind
Output files from activations on hidden layers (visual-FG, vismotion-pMTG,action-IPL, and praxis-SPL) of sighted (both visual and auditory) and blind (only visual) models.
Under each subfolder, 15 output text files of 15 individual runs were saved for each model, condition (visual or auditory) and layers.

The included excel files has each individual activation pattern (tabbed with Sub01-Sub15).
The activation patterns were first added with random noise (the noise parameter was in cell AG2), and then spatially smoothed with a Gaussian function covering adjancent 4 units (2 on the left and right) at the individual level.
After the noising and smoothing, activtion patterns of each individual run were recorded in the spreadsheet called "Total-Smoothed" to calculated activations across units for animal and artifact concepts.

For visual-FG units, lateral (unit0-9) and medial(unit10-19) were calculated separately for averaged activation, whereas for other hidden layers, the average activation was calculated across all units. 

(NOTE: because the formula in excel constantly update the values in the spreadsheets, the activation values found in those spreadsheet will produce the patterns similar to what is reported in the paper, but not the exact values).

Individual values:
This spreadsheet has the final averaged activation values for each individual run (Sub01-15), model (sighted vs. blind), odality (visual vs. auditory; only in sighted) and category (animal vs. artifact)


