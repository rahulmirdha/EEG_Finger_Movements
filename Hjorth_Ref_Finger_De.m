%%Program to calculate parameters for all channels for finger positions
%Created By: Project Team
%Dtae: 13-04-2016

clc
clear all
close all

data_ref = lvm_import('Data\Finger\Input\De\reference.lvm');
val_ref = data_ref.Segment1.data;
s1 = size(val_ref);
ts = 0.005;
w = 16*pi;
filein = 'Data\Finger\Input\De\';
fileout = 'Data\Finger\Refer\De\';
a = 2*w/((w*ts) + 2);
b = ((w*ts) - 2)/((w*ts) + 2);

len_off = 100;
len_on = 50;

%%Index Finger Parameters

str = strcat(filein,'index_off.lvm');
data_main = lvm_import(str);
val_main = data_main.Segment1.data;
s = size(val_main);
for k = 1:len_off
    if k == 1
        val = val_main(1:floor(s(1)/len_off),:);
    else
        val = val_main(floor((k-1)*s(1)/len_off):floor(k*s(1)/len_off),:);
    end
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_index_off',num2str(k),'.xlsx');
    xlswrite(str1,HjorthP);
end

str = strcat(filein,'index_on.lvm');
data_main = lvm_import(str);
val_main = data_main.Segment1.data;
s = size(val_main);
for k = 1:len_on
    if k == 1
        val = val_main(1:floor(s(1)/len_on),:);
    else
        val = val_main(floor((k-1)*s(1)/len_on):floor(k*s(1)/len_on),:);
    end
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_index_on',num2str(k),'.xlsx');
    xlswrite(str1,HjorthP);
end

for k = 1:20
    str = strcat(filein,'index_on',num2str(k),'.lvm');
    data = lvm_import(str);
    val = data.Segment1.data;
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_index_on',num2str(len_on+k),'.xlsx');
    xlswrite(str1,HjorthP);
end


%%Middle Finger Parameters


str = strcat(filein,'middle_off.lvm');
data_main = lvm_import(str);
val_main = data_main.Segment1.data;
s = size(val_main);
for k = 1:len_off
    if k == 1
        val = val_main(1:floor(s(1)/len_off),:);
    else
        val = val_main(floor((k-1)*s(1)/len_off):floor(k*s(1)/len_off),:);
    end
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_middle_off',num2str(k),'.xlsx');
    xlswrite(str1,HjorthP);
end

str = strcat(filein,'middle_on.lvm');
data_main = lvm_import(str);
val_main = data_main.Segment1.data;
s = size(val_main);
for k = 1:len_on
    if k == 1
        val = val_main(1:floor(s(1)/len_on),:);
    else
        val = val_main(floor((k-1)*s(1)/len_on):floor(k*s(1)/len_on),:);
    end
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_middle_on',num2str(k),'.xlsx');
    xlswrite(str1,HjorthP);
end

for k = 1:20
    str = strcat(filein,'middle_on',num2str(k),'.lvm');
    data = lvm_import(str);
    val = data.Segment1.data;
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_middle_on',num2str(len_on+k),'.xlsx');
    xlswrite(str1,HjorthP);
end


%%Thumb Parameters


len_off = 50;
len_on = 50;
str = strcat(filein,'thumb_off.lvm');
data_main = lvm_import(str);
val_main = data_main.Segment1.data;
s = size(val_main);
for k = 1:len_off
    if k == 1
        val = val_main(1:floor(s(1)/len_off),:);
    else
        val = val_main(floor((k-1)*s(1)/len_off):floor(k*s(1)/len_off),:);
    end
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_thumb_off',num2str(k),'.xlsx');
    xlswrite(str1,HjorthP);
end

for k = 1:20
    str = strcat(filein,'thumb_off',num2str(k),'.lvm');
    data = lvm_import(str);
    val = data.Segment1.data;
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_thumb_off',num2str(len_off+k),'.xlsx');
    xlswrite(str1,HjorthP);
end

str = strcat(filein,'thumb_on.lvm');
data_main = lvm_import(str);
val_main = data_main.Segment1.data;
s = size(val_main);
for k = 1:len_on
    if k == 1
        val = val_main(1:floor(s(1)/len_on),:);
    else
        val = val_main(floor((k-1)*s(1)/len_on):floor(k*s(1)/len_on),:);
    end
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_thumb_on',num2str(k),'.xlsx');
    xlswrite(str1,HjorthP);
end

for k = 1:20
    str = strcat(filein,'thumb_on',num2str(k),'.lvm');
    data = lvm_import(str);
    val = data.Segment1.data;
    s2 = size(val);
    if s1(1) < s2(1)
        s3 = s1;
    else
        s3 = s2;
    end
    val = val(1:s3(1),:) - val_ref(1:s3(1),:);
    deriv1 = zeros(s3(1) - 1,10);
    deriv2 = zeros(s3(1) - 2,10);
    activity = zeros(1,10);
    mobility = zeros(1,10);
    complexity = zeros(1,10);
    rmsv = zeros(1,10);
    stdev = zeros(1,10);
    avg = zeros(1,10);
    for i = 1:10
        sigma_a = std(val(:,i));
        for j = 1:s3(1) - 1
            if j == 1
                deriv1(j,i) = a*(val(j+1,i) - val(j,i));
            else
                deriv1(j,i) = a*(val(j+1,i) - val(j,i)) - b*deriv1(j-1,i);
            end
        end
        for j = 1:s3(1) - 2
            if j == 1
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i));
            else
                deriv2(j,i) = a*(deriv1(j+1,i) - deriv1(j,i)) - b*deriv2(j-1,i);
            end
        end
        sigma_d = std(deriv1(:,i));
        sigma_dd = std(deriv2(:,i));
        activity(i) = sigma_a*sigma_a;
        mobility(i) = sigma_d/sigma_a;
        complexity(i) = (sigma_dd/sigma_d)/mobility(i);
        rmsv(i) = rms(val(:,i));
        stdev(i) = std(val(:,i));
        avg(i) = mean(val(:,i));
    end
    HjorthP = [activity;
          mobility;
          complexity;
          rmsv;
          stdev;
          avg];
    str1 = strcat(fileout,'de_thumb_on',num2str(len_on+k),'.xlsx');
    xlswrite(str1,HjorthP);
end