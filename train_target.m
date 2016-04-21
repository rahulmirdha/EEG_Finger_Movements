function data = train_target(dirIn,dirOut)
files = dir( fullfile(dirIn,'*.xlsx') );%# list all *.xyz files
file = files(1).name;
file = strcat(dirIn,'\',file);
data = xlsread(file,1);
%normalization features...
avg =  mean(data);
mx = max(data);
mn = min(data);
rn = mx-mn;
data = data - repmat(avg,size(data,1),1);
rows = size(data,1);
denom = repmat(rn, [rows, 1]);
% Do the division
data = data./ denom;
%%
l = length(dirOut);
 ch = dirOut(l);
 filename = ch;
 while ch ~= '\'
     ch = dirOut(l-1);
     filename = strcat(filename,ch);
     l = l-1;
 end
filename = fliplr(filename);
 
target = zeros(size(data,1),3);
switch filename
    case '\ind_on'
        target(:,1) = 1;
    case '\mid_on'
        target(:,2) = 1;
    case '\thumb_on'
        target(:,3) =1;
    otherwise
        target = zeros(size(data,1),3);
end
 data = [data target];
 dirOut = strcat(dirOut,filename,'_tt.xlsx');
 xlswrite(dirOut,data);
end