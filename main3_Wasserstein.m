clear
close all
clc

%%
YLT = load('Data/RF_YLT.csv');
YLF = load('Data/RF_YLF.csv');
YTT = load('Data/RF_YTT.csv');
YTF = load('Data/RF_YTF.csv'); 
SL  = load('Data/SL.csv');
ST  = load('Data/ST.csv');

err_c0 = f_err(YTT,YTF);
fai_c0 = f_fai(YTF,ST);
fprintf('C = 0 - E:%.3f - F:%.3f\n',err_c0,fai_c0)

YF = f_NIPS(YLF+eps*randn(size(YLF)),YTF+eps*randn(size(YTF)),SL,ST);
err_c1 = f_err(YTT,YF);
fai_c1 = f_fai(YF,ST);
fprintf('C = 1 - E:%.3f - F:%.3f\n',err_c1,fai_c1)