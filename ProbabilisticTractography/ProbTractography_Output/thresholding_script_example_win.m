%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 3944 $)
%-----------------------------------------------------------------------
dir = 'I:\Tracking\';
fname = cellstr(['03DN ';'04FN ';'05WE '; '07CY ';'09CS '; '10MK ';'11HH ';'12JE ';'13GNR';'14GNA';'15ES ';'18LE ';'19FS ';'20AJ ';'21HR ';'22LM ';'23LP ';'24PH ';'25RS ';'26RV ';'27SF ';'28SG ';'29RB ';'30JR ']);
nrun= 24;

for crun = 1:nrun
    
matlabbatch{crun}.spm.util.imcalc.input = strcat(dir,'ProbTract_NEW_2015Nov\',fname(crun),'\ROI_connection_probability_wxlSPL_4.img,1');
matlabbatch{crun}.spm.util.imcalc.output = char(strcat(fname(crun),'_prob_lSPL_4_roi_2.5TH.img'));
matlabbatch{crun}.spm.util.imcalc.outdir = strcat(dir,'ProbTract_NEW_2015Nov\',fname(crun),'\');
matlabbatch{crun}.spm.util.imcalc.expression = 'i1>374.49';
matlabbatch{crun}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{crun}.spm.util.imcalc.options.mask = 0;
matlabbatch{crun}.spm.util.imcalc.options.interp = 1;
matlabbatch{crun}.spm.util.imcalc.options.dtype = 4;

end
spm('defaults', 'FMRI');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);
