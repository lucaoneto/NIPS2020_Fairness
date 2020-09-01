clear
close all
clc

%%
load('Crime.mat');

%%
n = length(Y);
nl = round(.9*n);

i = randperm(n);
il = i(1:nl);
it = i(nl+1:end);
D = [X(il,:),Sreal(il),Scat(il),Y(il)];
csvwrite('Data/L.csv',D);
D = [X(it,:),Sreal(it),Scat(it),Y(it)];
csvwrite('Data/T.csv',D);
csvwrite('Data/SL.csv',Scat(il));
csvwrite('Data/ST.csv',Scat(it));