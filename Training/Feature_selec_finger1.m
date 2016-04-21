%%Program for Feature Matrix Formation of Input Data
%Created By: Project Team
%Date: 14-04-2016

clc
clear all
close all

filein = 'Data\Finger\Refer\De\';
fileout = 'Data\Finger\Training\de_features1.xlsx';

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

n = 6;  %number of channels
f = 6;  %number of features per channel
traindat_de = zeros(f*n,(dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off+dat_de_thu_on));
traindat_god = zeros(f*n,(dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off+dat_god_thu_on));


%%De's Training Data


for k = 1:dat_de_ind_off
    l = 1;
    str = strcat(filein,'de_index_off',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_de(l,k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 51:dat_de_ind_on
    l = 1;
    str = strcat(filein,'de_index_on',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_de(l,dat_de_ind_off+k-50) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 1:dat_de_mid_off
    l = 1;
    str = strcat(filein,'de_middle_off',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_de(l,dat_de_ind_off+dat_de_ind_on-50+k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 51:dat_de_mid_on
    l = 1;
    str = strcat(filein,'de_middle_on',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_de(l,dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+k-100) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 51:dat_de_thu_off
    l = 1;
    str = strcat(filein,'de_thumb_off',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_de(l,dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+k-150) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 51:dat_de_thu_on
    l = 1;
    str = strcat(filein,'de_thumb_on',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_de(l,dat_de_ind_off+dat_de_ind_on+dat_de_mid_off+dat_de_mid_on+dat_de_thu_off+k-200) = num(i,j);
                l = l + 1;
            end
        end
    end
end

xlswrite(fileout,traindat_de);

%%God's Training Data


filein = 'Data\Finger\Refer\God\';
fileout = 'Data\Finger\Training\god_features1.xlsx';
for k = 1:dat_god_ind_off
    l = 1;
    str = strcat(filein,'god_index_off',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_god(l,k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 1:dat_god_ind_on
    l = 1;
    str = strcat(filein,'god_index_on',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_god(l,dat_god_ind_off+k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 1:dat_god_mid_off
    l = 1;
    str = strcat(filein,'god_middle_off',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_god(l,dat_god_ind_off+dat_god_ind_on+k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 1:dat_god_mid_on
    l = 1;
    str = strcat(filein,'god_middle_on',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_god(l,dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 1:dat_god_thu_off
    l = 1;
    str = strcat(filein,'god_thumb_off',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_god(l,dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

for k = 1:dat_god_thu_on
    l = 1;
    str = strcat(filein,'god_thumb_on',num2str(k),'.xlsx');
    [num text row] = xlsread(str);
    for j = 1:10
        %if j == 4 || j == 5 || j == 6
        if j == 2 || j == 3 || j == 4 || j == 7 || j == 9 || j == 10
            for i = 1:f
                traindat_god(l,dat_god_ind_off+dat_god_ind_on+dat_god_mid_off+dat_god_mid_on+dat_god_thu_off+k) = num(i,j);
                l = l + 1;
            end
        end
    end
end

xlswrite(fileout,traindat_god);