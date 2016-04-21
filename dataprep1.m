function data = dataprep1(dirIn,dirOut)
%dirIn = 'D:\study_material\Industry_oriented_problem\Final_Codes\Data\Finger\Rahul\Input\De\ind_off';              %# folder path
files = dir( fullfile(dirIn,'*.lvm') );   %# list all *.xyz files
for i = 1:size(files,1)
    filename = files(i).name;
    filename = strcat(dirIn,'\\',filename);
    data = cnavgref(filename);
    [pathstr, name, ext] = fileparts(filename);
    save_loc = strcat(dirOut,'\',name,'.mat');
    save(save_loc,'data');
end
    

