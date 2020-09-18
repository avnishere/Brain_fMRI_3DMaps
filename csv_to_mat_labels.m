% Converting csv labels to mat files feeding the neural networks

%loading the file
bp = csvread('raw_csv_labels/hibp_target_matlab.csv');

chol = csvread('raw_csv_labels/chol_target_matlab.csv');

dia = csvread('raw_csv_labels/dia_target_matlab.csv');

cvd = csvread('raw_csv_labels/cvd_target_matlab.csv');

gen = csvread('raw_csv_labels/gender_label.csv');

all_dis = csvread('raw_csv_labels/target_mat_all_diseases.csv');


%transposing the labels for feed
bp = bp';
chol = chol';
dia = dia';
cvd = cvd';
gen =gen';

% All disease file is not transposed as it is being fed into the keras and
% tensorflow framework at google cloud compute.

%saving the mat files
save labels/bp_label.mat bp
save labels/chol_label.mat chol
save labels/dia_label.mat dia
save labels/cvd_label.mat cvd
save labels/gen_label.mat gen
save labels/all_dis_label.mat all_dis