#####similarity function###
sim_Stddp<-function(matrixA, matrixB,fname,stpA,stpB,savetxt=TRUE) {

   matrixA2<-as.matrix(matrixA[,stpA:ncol(matrixA)])
  matrixB2<-as.matrix(matrixB[,stpB:ncol(matrixB)])

  if(ncol(matrixA2)!=ncol(matrixB2)) {
   print("matrixA and matrixB have different No. of features")}

  else {
 
  simdp<-matrix(nrow=nrow(matrixB2), ncol=nrow(matrixA2))
  
   for (i in 1:nrow(matrixB2)){
      
       simdp[i,] <- (matrixB2[i,]%*%t(matrixA2))/(sqrt(rowSums(matrixA2^2))*sqrt(sum(matrixB2[i,]^2)))
   }
  }
  if (savetxt) {
     write.table(simdp, file = fname, col.names = F, row.names = F)   #use diag(simdp) to get values on the diagonal when Out and Tar contain the same items#
     } else if (!savetxt) {
       return(simdp)
	   }
}
##############


n = 15 #number of subjects
nlevel = 5 #total levels of lesion
prop<-0.1  #lesion prop step
crit<-0.5
ninitImp<-10   #total number of retraining iteration
retstep<-500  #retraining stepwise
matA1<-read.table("Lexicon_target.txt",header=F)
stpA1<-2
stpA2<-2
stpB<-4
fnameh1<-"semobj_neurocomp_sighted_withEmpty_mVerbal_trained_lexOutp_pnam_delWtsem&moreVisLat"
fnamee1<-".txt"
fnameOut2<-"_descinitImp"
fnameOut1<-"_acc"

###########For picture naming task ################

for (j in 1:nlevel) {
  
  for (i in 1:n) {
    if (i<10) {
    fnameh3<-"_retfinal_s0"
    } else {
    fnameh3<-"_retfinal_s"
    }
    
    matB<-read.table(paste(fnameh1,prop*j,"_",initImp*retstep,fnameh3,i,fnamee1,sep=""), header = F)
	matA<-as.matrix(matA1[,stpA1:ncol(matA1)])
    matB1<-as.matrix(matB[,stpB:ncol(matB)])
	
    acc<-as.numeric(rowSums((matA-matB1)< crit & (matA-matB1)>(-1)*crit)==ncol(matA))	
	stdDP<-sim_Stddp(matA1,matB,paste(fnameh1,prop*j,"_",initImp*retstep,fnameOut2,"_StdDP",fnameh3,i,fnamee1,sep=""),stpA1,stpB,savetxt=F)
	
	acc_el<-(matA-matB1)< crit & (matA-matB1)>(-1)*crit
	ani_bas<-as.numeric(rowSums(acc_el[,2:5])==ncol(matA[,2:5]))         #animal basic level names
	ani_spec<-as.numeric(rowSums(acc_el[,11:34])==ncol(matA[,11:34]))    #animal specific level names
    mmd_bas<-as.numeric(rowSums(acc_el[,7:10])==ncol(matA[,7:10]))       #manmade basic level names
	mmd_spec<-as.numeric(rowSums(acc_el[,35:58])==ncol(matA[,35:58]))      #manmade specific level names

        accsubT<-acc
        stdDPsubT<-stdDP
		ani_bassubT<-ani_bas
		ani_specsubT<-ani_spec
		mmd_bassubT<-mmd_bas
		mmd_specsubT<-mmd_spec

	
	nmax<-rowSums(stdDPsubT==apply(stdDPsubT,1,max))>1                      	##find the rows with morethan 1 max value
	tstdDPsubT<-t(stdDPsubT)                                                    ##R fills matrix by column so needs to be transformed
	tstdDPsubT[,t(nmax)]<-c(1:nrow(tstdDPsubT))                                 ##initImplace the rows with more than 1 max
	stdDPsubT<-t(tstdDPsubT)
	pos<-which(stdDPsubT==apply(stdDPsubT,1,max),arr.ind=T)                     ##locate the position of max value of each row
    act<-rowSums((stdDPsubT==apply(stdDPsubT,1,max))*(stdDPsubT>=crit))              ##find the rows with max value smaller than 0.5
    outsubT<-as.character(matA1[pos[order(pos[,1]),][,2],1])
	outsubT[act==0]<-"LowSim"
	outsubT[nmax==1]<-"MoreThanOne"
		
	if (i == 1) {
    accTotal<-accsubT
    outTotal<-outsubT
	aBasTotal<-ani_bassubT
	aSpecTotal<-ani_specsubT
	mBasTotal<-mmd_bassubT
	mSpecTotal<-mmd_specsubT
	} else {
    accTotal<-cbind(accTotal,accsubT)
    outTotal<-cbind(outTotal,outsubT)
	aBasTotal<-cbind(aBasTotal,ani_bassubT)
	aSpecTotal<-cbind(aSpecTotal,ani_specsubT)
	mBasTotal<-cbind(mBasTotal,mmd_bassubT)
	mSpecTotal<-cbind(mSpecTotal,mmd_specsubT)
   }
   }
   write.table(accTotal,file=paste(n,"subjs_",fnameh1,prop*j,"_",initImp*retstep,fnameOut1,fnamee1,sep=""),col.names=F, row.names=F)
   write.table(outTotal,file=paste(n,"subjs_",fnameh1,prop*j,"_",initImp*retstep,fnameOut2,"_Response",fnamee1,sep=""),col.names=F, row.names=F)
   write.table(aBasTotal,file=paste(n,"subjs_",fnameh1,prop*j,"_",initImp*retstep,fnameOut1,"_animalBasMean",fnamee1,sep=""),col.names=F, row.names=F)
   write.table(aSpecTotal,file=paste(n,"subjs_",fnameh1,prop*j,"_",initImp*retstep,fnameOut1,"_animalSpecMean",fnamee1,sep=""),col.names=F, row.names=F)
   write.table(mBasTotal,file=paste(n,"subjs_",fnameh1,prop*j,"_",initImp*retstep,fnameOut1,"_manmadeBasMean",fnamee1,sep=""),col.names=F, row.names=F)
   write.table(mSpecTotal,file=paste(n,"subjs_",fnameh1,prop*j,"_",initImp*retstep,"_manmadeSpecMean",fnamee1,sep=""),col.names=F, row.names=F)
   
   write.table(rbind(colMeans(aBasTotal[1:24,]),colMeans(aSpecTotal[1:24,]),colMeans(mBasTotal[25:48,]),colMeans(mSpecTotal[25:48,])),file=paste(n,"subjs_",fnameh1,prop*j,"_",initImp*retstep,"_BasSpecItemMean",fnamee1,sep=""),col.names=F, row.names=F)

 
}
