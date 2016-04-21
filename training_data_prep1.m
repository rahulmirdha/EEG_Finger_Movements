%%Program to Separate training and testing data
%Created by: Project Team
%Date: 14-04-2016

clc
clear all
close all

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

n = 6;  %number of channels
f = 6;  %number of features per channel

filein = 'Data\Finger\Training\de_features.xlsx';
fileout1 = 'Data\Finger\Training\traindata.xlsx';
fileout2 = 'Data\Finger\Training\testdata.xlsx';

traindat = zeros(f*n,train_coeff*total_len);
testdat = zeros(f*n,test_coeff*total_len);

[num text row] = xlsread(filein);

size(num)
num(1:20)
l = 1;
m = 1;

for k = 1:dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off+dat_de_thu_on
    if k <= train_coeff*dat_de_ind_off
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > train_coeff*dat_de_ind_off && k <= dat_de_ind_off
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_de_ind_off && k <= dat_de_ind_off+(train_coeff*dat_de_ind_on)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_de_ind_off+(train_coeff*dat_de_ind_on) && k <= dat_de_ind_off+dat_de_ind_on
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on && k <= dat_de_ind_off+dat_de_ind_on+(train_coeff*dat_de_mid_off)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on+(train_coeff*dat_de_mid_off) && k <= dat_de_ind_off+dat_de_ind_on+dat_de_mid_off
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on+dat_de_mid_off && k <= dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+(train_coeff*dat_de_mid_on)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+(train_coeff*dat_de_mid_on) && k <= dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on && k <= dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+(train_coeff*dat_de_thu_off)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+(train_coeff*dat_de_thu_off) && k <= dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off && k <= dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off+(train_coeff*dat_de_thu_on)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off+(train_coeff*dat_de_thu_on) && k <= dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off+dat_de_thu_on
        testdat(:,m) = num(:,k);
        m = m + 1;
    end
end

filein = 'Data\Finger\Training\god_features.xlsx';

[num text row] = xlsread(filein);

for k = 1:dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off+dat_god_thu_on
    if k <= train_coeff*dat_god_ind_off
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > train_coeff*dat_god_ind_off && k <= dat_god_ind_off
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_god_ind_off && k <= dat_god_ind_off+(train_coeff*dat_god_ind_on)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_god_ind_off+(train_coeff*dat_god_ind_on) && k <= dat_god_ind_off+dat_god_ind_on
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on && k <= dat_god_ind_off+dat_god_ind_on+(train_coeff*dat_god_mid_off)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on+(train_coeff*dat_god_mid_off) && k <= dat_god_ind_off+dat_god_ind_on+dat_god_mid_off
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on+dat_god_mid_off && k <= dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+(train_coeff*dat_god_mid_on)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+(train_coeff*dat_god_mid_on) && k <= dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on && k <= dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+(train_coeff*dat_god_thu_off)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+(train_coeff*dat_god_thu_off) && k <= dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off
        testdat(:,m) = num(:,k);
        m = m + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off && k <= dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off+(train_coeff*dat_god_thu_on)
        traindat(:,l) = num(:,k);
        l = l + 1;
    elseif k > dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off+(train_coeff*dat_god_thu_on) && k <= dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off+dat_god_thu_on
        testdat(:,m) = num(:,k);
        m = m + 1;
    end
end

clc
size(traindat)
size(testdat)
xlswrite(fileout1,traindat);
xlswrite(fileout2,testdat);

traintarg = [zeros(1,train_coeff*dat_de_ind_off) ones(1,train_coeff*dat_de_ind_on) zeros(1,train_coeff*dat_de_mid_off) zeros(1,train_coeff*dat_de_mid_on) zeros(1,train_coeff*dat_de_thu_off) zeros(1,train_coeff*dat_de_thu_on) zeros(1,train_coeff*dat_god_ind_off) ones(1,train_coeff*dat_god_ind_on) zeros(1,train_coeff*dat_god_mid_off) zeros(1,train_coeff*dat_god_mid_on) zeros(1,train_coeff*dat_god_thu_off) zeros(1,train_coeff*dat_god_thu_on);
             zeros(1,train_coeff*dat_de_ind_off) zeros(1,train_coeff*dat_de_ind_on) zeros(1,train_coeff*dat_de_mid_off) ones(1,train_coeff*dat_de_mid_on) zeros(1,train_coeff*dat_de_thu_off) zeros(1,train_coeff*dat_de_thu_on) zeros(1,train_coeff*dat_god_ind_off) zeros(1,train_coeff*dat_god_ind_on) zeros(1,train_coeff*dat_god_mid_off) ones(1,train_coeff*dat_god_mid_on) zeros(1,train_coeff*dat_god_thu_off) zeros(1,train_coeff*dat_god_thu_on);
             zeros(1,train_coeff*dat_de_ind_off) zeros(1,train_coeff*dat_de_ind_on) zeros(1,train_coeff*dat_de_mid_off) zeros(1,train_coeff*dat_de_mid_on) zeros(1,train_coeff*dat_de_thu_off) ones(1,train_coeff*dat_de_thu_on) zeros(1,train_coeff*dat_god_ind_off) zeros(1,train_coeff*dat_god_ind_on) zeros(1,train_coeff*dat_god_mid_off) zeros(1,train_coeff*dat_god_mid_on) zeros(1,train_coeff*dat_god_thu_off) ones(1,train_coeff*dat_god_thu_on)];
         
testtarg = [zeros(1,test_coeff*dat_de_ind_off) ones(1,test_coeff*dat_de_ind_on) zeros(1,test_coeff*dat_de_mid_off) zeros(1,test_coeff*dat_de_mid_on) zeros(1,test_coeff*dat_de_thu_off) zeros(1,test_coeff*dat_de_thu_on) zeros(1,test_coeff*dat_god_ind_off) ones(1,test_coeff*dat_god_ind_on) zeros(1,test_coeff*dat_god_mid_off) zeros(1,test_coeff*dat_god_mid_on) zeros(1,test_coeff*dat_god_thu_off) zeros(1,test_coeff*dat_god_thu_on);
            zeros(1,test_coeff*dat_de_ind_off) zeros(1,test_coeff*dat_de_ind_on) zeros(1,test_coeff*dat_de_mid_off) ones(1,test_coeff*dat_de_mid_on) zeros(1,test_coeff*dat_de_thu_off) zeros(1,test_coeff*dat_de_thu_on) zeros(1,test_coeff*dat_god_ind_off) zeros(1,test_coeff*dat_god_ind_on) zeros(1,test_coeff*dat_god_mid_off) ones(1,test_coeff*dat_god_mid_on) zeros(1,test_coeff*dat_god_thu_off) zeros(1,test_coeff*dat_god_thu_on);
            zeros(1,test_coeff*dat_de_ind_off) zeros(1,test_coeff*dat_de_ind_on) zeros(1,test_coeff*dat_de_mid_off) zeros(1,test_coeff*dat_de_mid_on) zeros(1,test_coeff*dat_de_thu_off) ones(1,test_coeff*dat_de_thu_on) zeros(1,test_coeff*dat_god_ind_off) zeros(1,test_coeff*dat_god_ind_on) zeros(1,test_coeff*dat_god_mid_off) zeros(1,test_coeff*dat_god_mid_on) zeros(1,test_coeff*dat_god_thu_off) ones(1,test_coeff*dat_god_thu_on)];

traintarg_finger = [ones(1,train_coeff*dat_de_ind_off) ones(1,train_coeff*dat_de_ind_on) zeros(1,train_coeff*dat_de_mid_off) zeros(1,train_coeff*dat_de_mid_on) zeros(1,train_coeff*dat_de_thu_off) zeros(1,train_coeff*dat_de_thu_on) ones(1,train_coeff*dat_god_ind_off) ones(1,train_coeff*dat_god_ind_on) zeros(1,train_coeff*dat_god_mid_off) zeros(1,train_coeff*dat_god_mid_on) zeros(1,train_coeff*dat_god_thu_off) zeros(1,train_coeff*dat_god_thu_on);
                    zeros(1,train_coeff*dat_de_ind_off) zeros(1,train_coeff*dat_de_ind_on) ones(1,train_coeff*dat_de_mid_off) ones(1,train_coeff*dat_de_mid_on) zeros(1,train_coeff*dat_de_thu_off) zeros(1,train_coeff*dat_de_thu_on) zeros(1,train_coeff*dat_god_ind_off) zeros(1,train_coeff*dat_god_ind_on) ones(1,train_coeff*dat_god_mid_off) ones(1,train_coeff*dat_god_mid_on) zeros(1,train_coeff*dat_god_thu_off) zeros(1,train_coeff*dat_god_thu_on);
                    zeros(1,train_coeff*dat_de_ind_off) zeros(1,train_coeff*dat_de_ind_on) zeros(1,train_coeff*dat_de_mid_off) zeros(1,train_coeff*dat_de_mid_on) ones(1,train_coeff*dat_de_thu_off) ones(1,train_coeff*dat_de_thu_on) zeros(1,train_coeff*dat_god_ind_off) zeros(1,train_coeff*dat_god_ind_on) zeros(1,train_coeff*dat_god_mid_off) zeros(1,train_coeff*dat_god_mid_on) ones(1,train_coeff*dat_god_thu_off) ones(1,train_coeff*dat_god_thu_on)];
                
testtarg_finger = [ones(1,test_coeff*dat_de_ind_off) ones(1,test_coeff*dat_de_ind_on) zeros(1,test_coeff*dat_de_mid_off) zeros(1,test_coeff*dat_de_mid_on) zeros(1,test_coeff*dat_de_thu_off) zeros(1,test_coeff*dat_de_thu_on) ones(1,test_coeff*dat_god_ind_off) ones(1,test_coeff*dat_god_ind_on) zeros(1,test_coeff*dat_god_mid_off) zeros(1,test_coeff*dat_god_mid_on) zeros(1,test_coeff*dat_god_thu_off) zeros(1,test_coeff*dat_god_thu_on);
                   zeros(1,test_coeff*dat_de_ind_off) zeros(1,test_coeff*dat_de_ind_on) ones(1,test_coeff*dat_de_mid_off) ones(1,test_coeff*dat_de_mid_on) zeros(1,test_coeff*dat_de_thu_off) zeros(1,test_coeff*dat_de_thu_on) zeros(1,test_coeff*dat_god_ind_off) zeros(1,test_coeff*dat_god_ind_on) ones(1,test_coeff*dat_god_mid_off) ones(1,test_coeff*dat_god_mid_on) zeros(1,test_coeff*dat_god_thu_off) zeros(1,test_coeff*dat_god_thu_on);
                   zeros(1,test_coeff*dat_de_ind_off) zeros(1,test_coeff*dat_de_ind_on) zeros(1,test_coeff*dat_de_mid_off) zeros(1,test_coeff*dat_de_mid_on) ones(1,test_coeff*dat_de_thu_off) ones(1,test_coeff*dat_de_thu_on) zeros(1,test_coeff*dat_god_ind_off) zeros(1,test_coeff*dat_god_ind_on) zeros(1,test_coeff*dat_god_mid_off) zeros(1,test_coeff*dat_god_mid_on) ones(1,test_coeff*dat_god_thu_off) ones(1,test_coeff*dat_god_thu_on)];
               
traintarg_onoff = [zeros(1,train_coeff*dat_de_ind_off) ones(1,train_coeff*dat_de_ind_on) zeros(1,train_coeff*dat_de_mid_off) ones(1,train_coeff*dat_de_mid_on) zeros(1,train_coeff*dat_de_thu_off) ones(1,train_coeff*dat_de_thu_on) zeros(1,train_coeff*dat_god_ind_off) ones(1,train_coeff*dat_god_ind_on) zeros(1,train_coeff*dat_god_mid_off) ones(1,train_coeff*dat_god_mid_on) zeros(1,train_coeff*dat_god_thu_off) ones(1,train_coeff*dat_god_thu_on)];

testtarg_onoff = [zeros(1,test_coeff*dat_de_ind_off) ones(1,test_coeff*dat_de_ind_on) zeros(1,test_coeff*dat_de_mid_off) ones(1,test_coeff*dat_de_mid_on) zeros(1,test_coeff*dat_de_thu_off) ones(1,test_coeff*dat_de_thu_on) zeros(1,test_coeff*dat_god_ind_off) ones(1,test_coeff*dat_god_ind_on) zeros(1,test_coeff*dat_god_mid_off) ones(1,test_coeff*dat_god_mid_on) zeros(1,test_coeff*dat_god_thu_off) ones(1,test_coeff*dat_god_thu_on)];


xlswrite('Data\Finger\Training\traintarget.xlsx',traintarg);
xlswrite('Data\Finger\Training\testtarget.xlsx',testtarg);
xlswrite('Data\Finger\Training\traintarget_finger.xlsx',traintarg_finger);
xlswrite('Data\Finger\Training\testtarget_finger.xlsx',testtarg_finger);
xlswrite('Data\Finger\Training\traintarget_onoff.xlsx',traintarg_onoff);
xlswrite('Data\Finger\Training\testtarget_onoff.xlsx',testtarg_onoff);