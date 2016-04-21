clc;
prompt = 'Input test data for thumb(atleast 1500 instances):';
test_data = input(prompt);
ind_centroid = [-9.24157070057005,-5.81613633223325,-5.95432241794177,8.42968565216522,7.02312244684468,0.598088247924792,-5.73241009550955,-6.57959118871889,-6.11961082908293,-7.82897650325036;
    -1.31684109339066,-5.76317447575245,-6.26412358214178,-6.10125040925908,6.93564993840615,6.29484903409657,-5.37680817258276,-5.50733253464655,-5.39203913378663,-7.60028531376865];
ce2 = ind_centroid(2,:);
ce1 = ind_centroid(1,:);
ce2 = repmat(ce2,[size(test_data,1),1]);
ce1 = repmat(ce1,[size(test_data,1),1]);
diff1 = test_data-ce1;
diff2 = test_data-ce2;
diff1 = diff1.^2;
diff2 = diff2.^2;
d1 = sum(sum(diff1));
d2 = sum(sum(diff2));
fprintf('if data is for on, out should be = 1..\n')
fprintf('if data is for off, out should be = 0..\n') 
fprintf('\n')
if d1<d2
    out = 1;
    fprintf('%s data corresponding to ON,  output= %d\n','',out);

else
    out = 0;
    fprintf('%s data corresponding to OFF, output = %d\n','',out);
end

