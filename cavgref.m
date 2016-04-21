function datan = cavgref(filename)
data = lvm_import(filename);
datan = sum(data,2)./10;
datan = repmat(datan,1,10);
datan = data-datan;
end
