
clear all;
close all;
clc;

% Perform Principal component Analysis with single value decomposition.
% The first thirty principal components are taken to map the original data.
% As observed these cover 99.9286% of the variance in the data. 

%load the k-means data
load('Datasets/new_data_kmeans.mat');

% the loaded dataset is 90x540, thus transpose is used while appying pca 
% to get the observations as rows.

% apply pca on the dataset

[coefficents, scores, latents, tsquare, variance_cover] = pca(data');

% show variance covered by the first thirty principal components
var_cov = sum(variance_cover(1:30));

disp('The variance coverd by first 30 components is: ');
var_cov
% The PCA reduced dataset
new_data_pca = scores(:,1:30);
% Our new dataset is now 540x30 dataset.

%Visualizations

%Plot the first three principal components to visualize the data
X = new_data_pca(:,1);
Y = new_data_pca(:,2);
Z = new_data_pca(:,3);

scatter3(X,Y,Z, 'red');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
zlabel('Principal Component 3');
title('First Three Principal Components Data')

data = new_data_pca';
%Save the PCA dataset
save Datasets/new_data_pca.mat data



