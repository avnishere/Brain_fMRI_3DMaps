clear all;
close all;
clc;

% Pick a dataset
disp('Choose a Dataset');
disp('1. Dataset 1: Initial Data');
disp('2. Dataset 2: K-Means Centroid Data');
disp('3. Dataset 3: PCA Applied Data');
dataset = input('Enter the numeric number of the desired option: ');

clc;

% Pick a label
disp('Choose a label');
disp('bp');
disp('cholesterol');
disp('diabetes');
disp('cvd');
disp('gender');
label = input('Enter the label: ','s');


% Assigning the associated datset directory

if dataset == 1
    data_path = 'Datasets/data_som_mat.mat';
end

if dataset == 2
    data_path = 'Datasets/new_data_kmeans.mat';
end

if dataset == 3
    data_path = 'Datasets/new_data_pca.mat';
end

% Assigning the associated label directory

if strcmp(label, 'bp') == 1
    label_path = load('labels/bp_label.mat');
    label = label_path.bp;
end

if strcmp(label, 'cholesterol') == 1
    label_path = load('labels/chol_label.mat');
    label = label_path.chol;
    
end

if strcmp(label, 'diabetes') == 1
    label_path = load('labels/dia_label.mat');
    label = label_path.dia;
    
end

if strcmp(label, 'cvd') == 1
    label_path = load('labels/cvd_label.mat');
    label = label_path.cvd;
    
end

if strcmp(label, 'gender') == 1
    label_path = load('labels/gen_label.mat');
    label = label_path.gen;
    
end


%Implement the neural network with two hidden layers and layer size 20.

%Graphs and network layer and size could be changed from the created 
%neural_net fucntion.

performance = neural_net(data_path, label);
