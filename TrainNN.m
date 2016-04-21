%%Program to train the Neural Network
%Created By: Project Team
%Date: 14-04-2016

clc
clear all
close all

filein1 = 'Data\Finger\Training\traindata.xlsx';
filein2 = 'Data\Finger\Training\traintarget.xlsx';
n = 10;  %number of hidden neurons

[num text row] = xlsread(filein1);
X = num;
[num text row] = xlsread(filein2);
T = num;

net = feedforwardnet(n,'traingd');
net.trainParam.epochs = 7000;
net.trainParam.lr = 0.1;
[net,tr] = train(net,X,T);

filein1 = 'Data\Finger\Training\testdata.xlsx';
filein2 = 'Data\Finger\Training\testtarget.xlsx';
[num text row] = xlsread(filein1);
Y = num;
[num text row] = xlsread(filein2);
T2 = num;
out = net(Y);

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
%     for i = 1:3
%         if out(i,j) < 0.5
%             out(i,j) = 0;
%         else
%             out(i,j) = 1;
%         end
%     end
% end

% perf = perform(net,T2,out);