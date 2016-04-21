god_index_on = zeros(1,10);
 for i = 1:10;
str = int2str(i);
filename = strcat('god_index_off',str,'.lvm');
lvm_import(filename);
temp = ans.Segment1.data;
god_index_on = [god_index_on;temp];
end
