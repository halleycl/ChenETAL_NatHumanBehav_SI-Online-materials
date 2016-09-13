%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
clear

matlabbatch{1}.spm.util.imcalc.input = {
                                        'I:\Tracking\ProbTract_NEW_2015Nov\03DN\w03DN_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\04FN\w04FN_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\05WE\w05WE_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\07CY\w07CY_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\09CS\w09CS_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\10MK\w10MK_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\11HH\w11HH_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\12JE\w12JE_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\13GNR\w13GNR_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\14GNA\w14GNA_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\15ES\w15ES_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\18LE\w18LE_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\19FS\w19FS_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\20AJ\w20AJ_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\21HR\w21HR_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\22LM\w22LM_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\23LP\w23LP_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\24PH\w24PH_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\25RS\w25RS_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\26RV\w26RV_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\27SF\w27SF_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\28SG\w28SG_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\29RB\w29RB_prob_lSPL_4_roi_2.5TH.img,1'
                                        'I:\Tracking\ProbTract_NEW_2015Nov\30JR\w30JR_prob_lSPL_4_roi_2.5TH.img,1'
                                        };
matlabbatch{1}.spm.util.imcalc.output = '24subjs_GroupTemp_lSPL_4_roi_2.5TH.img';
matlabbatch{1}.spm.util.imcalc.outdir = {'I:\Tracking\ProbTract_NEW_2015Nov\'};
matlabbatch{1}.spm.util.imcalc.expression = '(i1+i2+i3+i4+i5+i6+i7+i8+i9+i10+i11+i12+i13+i14+i15+i16+i17+i18+i19+i20+i21+i22+i23+i24)/24';
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 4;

spm('defaults', 'FMRI');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);