%%Program to train the Neural Network parallelly
%Created By: Project Team
%Date: 15-04-2016

clc
clear all
close all

filein1 = 'Data\Finger\Training\traindata.xlsx';
filein2 = 'Data\Finger\Training\traintarget_finger.xlsx';
filein3 = 'Data\Finger\Training\traintarget_onoff.xlsx';
n = 5;  %number of hidden neurons

[num text row] = xlsread(filein1);
X = num;
[num text row] = xlsread(filein2);
T1 = num;
[num text row] = xlsread(filein3);
T2 = num;

net1 = feedforwardnet(n,'traingd');
% net1.layers{1}.transferFcn = 'logsig';
% net1.layers{2}.transferFcn = 'logsig';
net1.trainParam.epochs = 10000;
[net1,tr1] = train(net1,X,T1);

net2 = feedforwardnet(n,'traingd');
% net2.layers{1}.transferFcn = 'logsig';
% net2.layers{2}.transferFcn = 'logsig';
net2.trainParam.epochs = 10000;
[net2,tr2] = train(net2,X,T2);

filein1 = 'Data\Finger\Training\testdata.xlsx';
filein2 = 'Data\Finger\Training\testtarget_finger.xlsx';
filein3 = 'Data\Finger\Training\testtarget_onoff.xlsx';

[num text row] = xlsread(filein1);
Y = num;
[num text row] = xlsread(filein2);
T3 = num;
[num text row] = xlsread(filein3);
T4 = num;

out1 = net1(Y);
out2 = net2(Y);

dat_de_ind_off = 100;
dat_de_ind_on = 70;
dat_de_mid_off = 100;
dat_de_mid_on = 70;
dat_de_thu_off = 70;
dat_de_thu_on = 70;
dat_god_ind_off = 100;
dat_god_ind_on = 100;
dat_god_mid_off = 100;
dat_god_mid_on = 100;
dat_god_thu_off = 100;
dat_god_thu_on = 100;
train_coeff = 0.8;
test_coeff = 0.2;
total_len = dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off+dat_de_thu_on+dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off+dat_god_thu_on;

% for j = 1:test_coeff*total_len
%    for i = 1:3
%        if out1(i,j) < 0.5
%            out1(i,j) = 0;
%        else
%            out1(i,j) = 1;
%        end
%    end
%    if out2(j) < 0.5
%        out2(j) = 0;
%    else
%        out2(j) = 1;
%    end
% end
% 
% perf1 = perform(net1,T3,out1);
% perf2 = perform(net2,T4,out2);