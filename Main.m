%*** 15/01/2019*********************************************%
%*** ALHASAN ALKHATIB **************************************%
%*** Main.m dosyasi*****************************************%
%***********************************************************%
 
  
fileID = fopen('sonuc.txt','w');
%DataSet = readtable('PT_veriler.xlsx');
DataSet = readtable('PT_veriler - 2c lass.xlsx');

[N,F]=size(DataSet);
fold=3;
Dataarray=table2cell(DataSet);
DataY=Dataarray(:,1);
DataX=Dataarray(:,2:end);

DataY=cell2mat(DataY);
DataX=cell2mat(DataX);

DataY=DataY(:,1);DataY(1:17)='0';DataY(18:32)='1';DataY(33:49)='2';DataY=double(DataY)-48;

oran0=0;oran00=0;oran000=0;
for i=1:5
    
%Egitim sonuclari
oran0(i)=EgitimNN();
[x1,oran1(i)]=EgitimKnn(DataSet,3); 
[x2,oran2(i)]=EgitimKnn(DataSet,5);
[x3,oran3(i)]=EgitimKnn(DataSet,7);
[x4,oran4(i)]=EgitimWKnn(DataSet,3);
[x5,oran5(i)]=EgitimWKnn(DataSet,5);
[x6,oran6(i)]=EgitimWKnn(DataSet,7);
[x7,oran7(i)]=EgitimLinearSVM(DataSet);
[x8,oran8(i)]=EgitimMGSVM(DataSet);
[x9,oran9(i)]=EgitimEnsembleBaggedTree(DataSet);

%10 fold icin test sonuclari
oran00(i)=FoldNN(fold);
[k10,x10,oran10(i)]=Knn(DataSet,3,fold);
[k11,x11,oran11(i)]=Knn(DataSet,5,fold);
[k12,x12,oran12(i)]=Knn(DataSet,7,fold);
[k13,x13,oran13(i)]=WKnn(DataSet,3,fold); 
[k14,x14,oran14(i)]=WKnn(DataSet,5,fold);  
[k15,x15,oran15(i)]=WKnn(DataSet,7,fold);
[k16,x16,oran16(i)]=LinearSVM(DataSet,fold);
[x17,oran17(i)]=MGSVM(DataSet,fold);
[k18,x18,oran18(i)]=EnsembleBaggedTree(DataSet,fold);


%L00 N=49 icin test sonuclari
oran000(i)=LOONN(N);
[k19,x19,oran19(i)]=Knn(DataSet,3,N);
[k20,x20,oran20(i)]=Knn(DataSet,5,N); 
[k21,x21,oran21(i)]=Knn(DataSet,7,N);   
[k22,x22,oran22(i)]=WKnn(DataSet,3,N);
[k23,x23,oran23(i)]=WKnn(DataSet,5,N);
[k24,x24,oran24(i)]=WKnn(DataSet,7,N);
[k25,x25,oran25(i)]=LinearSVM(DataSet,N);
[x26,oran26(i)]=MGSVM(DataSet,N);
[k27,x27,oran27(i)]=EnsembleBaggedTree(DataSet,N);

end
oran0=mean(oran0);
oran00=mean(oran00);
oran000=mean(oran000);
oran1=mean(oran1);
oran2=mean(oran2);
oran3=mean(oran3);
oran4=mean(oran4);
oran5=mean(oran5);
oran6=mean(oran6);
oran7=mean(oran7);
oran8=mean(oran8);
oran9=mean(oran9);
oran10=mean(oran10);
oran11=mean(oran11);
oran12=mean(oran12);
oran13=mean(oran13);
oran14=mean(oran14);
oran15=mean(oran15);
oran16=mean(oran16);
oran17=mean(oran17);
oran18=mean(oran18);
oran19=mean(oran19);
oran20=mean(oran20);
oran21=mean(oran21);
oran22=mean(oran22);
oran23=mean(oran23);
oran24=mean(oran24);
oran25=mean(oran25);
oran26=mean(oran26);
oran27=mean(oran27);

fprintf('Egitim ANN= %8.8f ',oran0);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran0);
  fprintf(fileID,',');
  
fprintf('Egitim K=3  Knn= %8.8f ',oran1*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran1*100);
  fprintf(fileID,',');
  
fprintf('Egitim K=5  Knn= %8.8f ',oran2*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran2*100);
  fprintf(fileID,',');
  
fprintf('Egitim K=7  Knn= %8.8f ',oran3*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran3*100);
  fprintf(fileID,',');

fprintf('Egitim K=3  agirlikli Knn= %8.8f ',oran4*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran4*100);
  fprintf(fileID,',');
  
fprintf('Egitim K=5  agirlikli Knn= %8.8f ',oran5*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran5*100);
  fprintf(fileID,',');  

fprintf('Egitim K=7  agirlikli Knn= %8.8f ',oran6*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran6*100);
  fprintf(fileID,',');

fprintf('Egitim Linear SVM = %8.8f ',oran7*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran7*100);
  fprintf(fileID,',');
  
fprintf('Egitim MG SVM= %8.8f ',oran8*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran8*100);
  fprintf(fileID,',');

fprintf('Egitim Ensemble Bagged Tree= %8.8f ',oran9*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran9*100);
  fprintf(fileID,',');

  fprintf(fileID,'\n');

%10 fold icin test sonuclari
fprintf('10-fold ANN= %8.8f ',oran00);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran00);
  fprintf(fileID,',');
  
fprintf('K=3 10-fold Knn= %8.8f ',oran10*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran10*100);
  fprintf(fileID,',');
  
fprintf('K=5 10-fold Knn= %8.8f ',oran11*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran11*100);
  fprintf(fileID,',');
  
fprintf('K=7 10-fold Knn= %8.8f ',oran12*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran12*100);
  fprintf(fileID,',');

fprintf('K=3 10-fold agirlikli Knn= %8.8f ',oran13*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran13*100);
  fprintf(fileID,',');
  
fprintf('K=5 10-fold agirlikli Knn= %8.8f ',oran14*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran14*100);
  fprintf(fileID,',');
  
fprintf('K=7 10-fold agirlikli Knn= %8.8f ',oran15*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran15*100);
  fprintf(fileID,',');
  
fprintf('10-fold Linear SVM= %8.8f ',oran16*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran16*100);
  fprintf(fileID,',');
  
fprintf('10-fold MG SVM = %8.8f ',oran17*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran17*100);
  fprintf(fileID,',');

fprintf('10-fold EnsembleBaggedTree = %8.8f ',oran18*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran18*100);
  fprintf(fileID,',');

  fprintf(fileID,'\n');

% L00 N=49 icin test sonuclari
fprintf('LOO ANN= %8.8f ',oran000);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran000);
  fprintf(fileID,',');

fprintf('LOO K=3 Knn= %8.8f ',oran19*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran19*100);
  fprintf(fileID,',');
  
fprintf('LOO K=5 Knn= %8.8f ',oran20*100);
fprintf('\n');
  fprintf(fileID,'%8.8f',oran20*100);
  fprintf(fileID,',');
  
fprintf('LOO K=7 Knn= %8.8f ',oran21*100);
fprintf('\n');
    fprintf(fileID,'%8.8f',oran21*100);
    fprintf(fileID,',');
   
fprintf('LOO K=3 agirlikli Knn= %8.8f ',oran22*100);
fprintf('\n');
    fprintf(fileID,'%8.8f',oran22*100);
    fprintf(fileID,',');
    
fprintf('LOO K=5 agirlikli Knn= %8.8f ',oran23*100);
fprintf('\n');
    fprintf(fileID,'%8.8f',oran23*100);
    fprintf(fileID,',');
  
fprintf('LOO K=7 agirlikli Knn= %8.8f ',oran24*100);
fprintf('\n');
    fprintf(fileID,'%8.8f',oran24*100);
    fprintf(fileID,',');

fprintf('LOO Linear SVM= %8.8f ',oran25*100);
fprintf('\n');
    fprintf(fileID,'%8.8f',oran25*100);
    fprintf(fileID,',');

fprintf('LOO MG SVM= %8.8f ',oran26*100);
fprintf('\n');
    fprintf(fileID,'%8.8f',oran26*100);
    fprintf(fileID,',');

fprintf('LOO Ensemble Bagged Tree= %8.8f ',oran27*100);
fprintf('\n');
    fprintf(fileID,'%8.8f',oran27*100);
    fprintf(fileID,',');

  fprintf(fileID,'\n');

  fclose(fileID);

