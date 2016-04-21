clc;
clear all;
close all;
prompt = 'Enter directory having marked data folders:';
dirIn = input(prompt);
di = dir(dirIn);
di = di(3:length(di));

paths = {};
for i = 1:length(di)
    paths{i} = strcat(dirIn,'\',di(i).name);
end

for i = 1:length(paths)
    dataprep1(paths{i},paths{i});
    features(paths{i},paths{i});
    train_target(paths{i},paths{i});   
end

[train_data test_data net target output] = train_test_final(paths,di);