%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 3944 $)
%-----------------------------------------------------------------------
clear

dir = 'I:\Tracking\';
fname = cellstr(['03DN ';'04FN ';'05WE '; '07CY ';'09CS '; '10MK ';'11HH ';'12JE ';'13GNR';'14GNA';'15ES ';'18LE ';'19FS ';'20AJ ';'21HR ';'22LM ';'23LP ';'24PH ';'25RS ';'26RV ';'27SF ';'28SG ';'29RB ';'30JR ']);
nrun= 24;
for crun = 1:nrun
    
matlabbatch{crun}.spm.util.defs.comp{1}.dartel.flowfield = strcat(dir,'Coreg T1 and Deform\u_rc1r',fname(crun),' T1 SS_Gp_Template_24_Sub_T1T2_SS.nii');
matlabbatch{crun}.spm.util.defs.comp{1}.dartel.times = [1 0];
matlabbatch{crun}.spm.util.defs.comp{1}.dartel.K = 6;
matlabbatch{crun}.spm.util.defs.comp{2}.sn2def.matname = {strcat(dir,'Colins Template and Deformation\Gp_Template_24_Sub_T1T2_SS_6_sn.mat')};
matlabbatch{crun}.spm.util.defs.comp{2}.sn2def.vox = [NaN NaN NaN];
matlabbatch{crun}.spm.util.defs.comp{2}.sn2def.bb = [NaN NaN NaN
                                                  NaN NaN NaN];
matlabbatch{crun}.spm.util.defs.ofname = '';
matlabbatch{crun}.spm.util.defs.fnames = strcat(dir,'ProbTract_NEW_2015Nov\',fname(crun),'\',fname(crun),'_prob_lSPL_4_roi_2.5TH.img,1');
matlabbatch{crun}.spm.util.defs.savedir.saveusr = strcat(dir,'ProbTract_NEW_2015Nov\',fname(crun),'\');
matlabbatch{crun}.spm.util.defs.interp = 0;

end

spm('defaults', 'FMRI');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);
