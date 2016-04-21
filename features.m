function data  = features(dirIn,dirOut)
files = dir( fullfile(dirIn,'*.mat') );%# list all *.xyz files
data = [];
for i = 1:size(files,1)
    file = files(i).name;
    file = strcat(dirIn,'\',file);
    temp = load(file);
    data = [data;temp.data];
end
 len = size(data,1);
 inlen = 25;
 num_samples = floor(len/inlen);
 data = data(1:num_samples*inlen,:);
 
 chan = 3:5;%channels used
 data = data(:,chan);%channel 3,4,5
 num_chan = length(chan);
 x = mat2cell(data,repmat(25,num_samples,1),num_chan);
 
% hjorth parameters constants  
ts = 0.005;
w = 16*pi;
a = 2*w/((w*ts) + 2);
b = ((w*ts) - 2)/((w*ts) + 2);
HjorthP = zeros(1,18);
 for i=1:num_samples
     rmsv = sum(x{i}.*x{i})/inlen;
     avg = mean(x{i});
     stdv = std(x{i});
     activity = stdv.*stdv;
     
   deriv1 = zeros(inlen,num_chan);
   deriv2 = zeros(inlen,num_chan);
        for j = 1:inlen - 1
            if j == 1
                deriv1(j,:) = a*(x{i}(j+1,:) - x{i}(j,:));
            else
                deriv1(j,:) = a*(x{i}(j+1,:) - x{i}(j,:)) - b*deriv1(j-1,:);
            end
        end
        for j = 1:inlen - 2
            if j == 1
                deriv2(j,:) = a*(deriv1(j+1,:) - deriv1(j,:));
            else
                deriv2(j,:) = a*(deriv1(j+1,:) - deriv1(j,:)) - b*deriv2(j-1,:);
            end
        end
        sigma_d = std(deriv1);
        sigma_dd = std(deriv2);
        
        mobility = sigma_d./stdv;
        complexity = (sigma_dd./sigma_d)./mobility;
        
    temp = [activity mobility complexity rmsv stdv avg];
    HjorthP = [HjorthP;temp];
 end
 l = length(dirOut);
 ch = dirOut(l);
 filename = ch;
 while ch ~= '\'
     ch = dirOut(l-1);
     filename = strcat(filename,ch);
     l = l-1;
 end
 filename = fliplr(filename);
 dirOut = strcat(dirOut,filename,'.xlsx');
 HjorthP = HjorthP(2:size(HjorthP,1),:);
 data = HjorthP;
 xlswrite(dirOut,HjorthP);
end
 
 
   