function datacn = cnavgref(filename)
data = cavgref(filename);
datacn = sum(data)./size(data,1);
datacn = repmat(datacn,size(data,1),1);
datacn = data-datacn;
end