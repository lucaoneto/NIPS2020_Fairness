clear
close all
clc

%%
L = 25;
beta = .1;

YLT = load('Data/RF_YLT.csv');
YLF = load('Data/RF_YLF.csv');
YTT = load('Data/RF_YTT.csv');
YTF = load('Data/RF_YTF.csv'); 
SL  = load('Data/SL.csv');
ST  = load('Data/ST.csv');

YTFd = f_dis(YTF,L);
errd = f_err(YTT,YTFd);
fai = f_fai(YTFd,ST);
fprintf('C = 0 - E:%.3f - F:%.3f\n',errd,fai)

YTFd = f_ICML(YLF,YTF,SL,ST,L,beta);
err = f_err(YTT,YTFd);
fai = f_fai(YTFd,ST);
fprintf('C = 1 - E:%.3f - F:%.3f\n',err,fai) 