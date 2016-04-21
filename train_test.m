dind_on = 'D:\study_material\Industry_oriented_problem\Final_Codes\Data\Finger\Rahul\Input\De\ind_on\ind_on_tt.xlsx';
dind_off = 'D:\study_material\Industry_oriented_problem\Final_Codes\Data\Finger\Rahul\Input\De\ind_off\ind_off_tt.xlsx';
dmid_on = 'D:\study_material\Industry_oriented_problem\Final_Codes\Data\Finger\Rahul\Input\De\mid_on\mid_on_tt.xlsx';
dmid_off = 'D:\study_material\Industry_oriented_problem\Final_Codes\Data\Finger\Rahul\Input\De\mid_off\mid_off_tt.xlsx';
dthumb_on = 'D:\study_material\Industry_oriented_problem\Final_Codes\Data\Finger\Rahul\Input\De\thumb_on\thumb_on_tt.xlsx';
dthumb_off = 'D:\study_material\Industry_oriented_problem\Final_Codes\Data\Finger\Rahul\Input\De\thumb_off\thumb_off_tt.xlsx';
ind_on = xlsread(dind_on,1);
ind_off = xlsread(dind_off,1);
mid_on = xlsread(dmid_on,1);
mid_off = xlsread(dmid_off,1);
thumb_off = xlsread(dthumb_off,1);
thumb_on = xlsread(dthumb_on,1);
train_indon = ind_on(1:floor(.8*size(ind_on,1)),:);
test_indon = ind_on(floor(.8*size(ind_on,1))+1:size(ind_on,1),:);
train_midon = mid_on(1:floor(.8*size(mid_on,1)),:);
test_midon = mid_on(floor(.8*size(mid_on,1))+1:size(mid_on,1),:);
train_thumbon = thumb_on(1:floor(.8*size(thumb_on,1)),:);
test_thumbon = thumb_on(floor(.8*size(thumb_on,1))+1:size(thumb_on,1),:);
train_indoff = ind_off(1:floor(.8*size(ind_off,1)),:);
test_indoff = ind_off(floor(.8*size(ind_off,1))+1:size(ind_off,1),:);
train_midoff = mid_off(1:floor(.8*size(mid_off,1)),:);
test_midoff = mid_off(floor(.8*size(mid_off,1))+1:size(mid_off,1),:);
train_thumboff = thumb_off(1:floor(.8*size(thumb_off,1)),:);
test_thumboff = thumb_off(floor(.8*size(thumb_off,1))+1:size(thumb_off,1),:);

train_data = [train_indon;train_indoff;train_midon;train_midoff;train_thumbon;train_thumboff];
test_data = [test_indon;test_indoff;test_midon;test_midoff;test_thumbon;test_thumboff];
p = train_data(:,1:18);
p = p';
t = train_data(:,19:21)';
net = newff(p,t,40);
net = train(net,p,t);
test = test_data(:,1:18);
y = sim(net,test');
t = test_data(:,19:21);


