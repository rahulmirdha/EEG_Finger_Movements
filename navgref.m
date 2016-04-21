function datan = navgref(filename)
data = lvm_import(filename);
datan = sum(data)./size(data,1);
datan = repmat(datan,size(data,1),1);
datan = data-datan;
end