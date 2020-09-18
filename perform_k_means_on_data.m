
clear all;
close all;
clc
% Data_som_mat is 300000x540 data of non-empty voxel locations of all the
% cases with each coloumn belonging to a paitent case. 
load('Datasets/data_som_mat.mat');

%Transpose the data to take each row as a patient case. foo is the variable
%inside the mat file.
data =data';

% Declare a matrix to store all the cases, 
% each with the k-means centroid data with 30 clusters
new_data = [];

% Looping around each case
for i = 1: size(data,1)
    
    % Decalare a matrix to temporarily store the location coordinates of
    % non-empty voxels of a patient case as columns.
    data_temp=[];
    
    %taking a patient case as 
    temp = data(i,:);
    
    %Looping around data within each case to retrieve each non-empty voxel
    %coordinates in a row.
    for j= 1: 100000
        
        data_temp = [data_temp; temp(:,3*(j-1)+1:3*(j))]; 
        % taking three columns at a time for XYZ cord.
    end
    
        % Appying k-means clustering on the data of a patient case
        
        [idx, c] = kmeans(data_temp,30); % idx is the label index,
        % c is the centroid point of each cluster
        
% In case you wish to visualize plots
%figure 1 plots the 10th patient case 30 centroid points in a 3d space.

    if i == 10
        figure(1)
        scatter3(c(:,1),c(:,2),c(:,3));
        xlabel('X Coordinates');
        ylabel('Y Coordinates');
        zlabel('Z Coordinates');
        title('K-means Centroid Data - Sample Case')
    end


        c=c'; % transpose each coordinate in 'c' to be rows.
        
        %convert to a single row of data for a patient case
        c = reshape(c,[1,90]); 

        
% In case you wish to visualize plots
% figure 2 plots the original non-empty voxel positions of the 10th case sample.

  
    if i== 10
        figure(2)
        scatter3(data_temp(:,1),data_temp(:,2),data_temp(:,3));
        xlabel('X Coordinates');
        ylabel('Y Coordinates');
        zlabel('Z Coordinates');
        title('Non-Empty Voxels - Sample Case')
    end
    
    % storing values of k-means centroid data for each case to
    %get the over all reduced feature set 
    new_data = [new_data; c];
    
    % Print the iteration number
    clc;
    fprintf('K-means is executed on: %d cases.\n', i);
    disp('Processing next case.....')
   
end

% Transposing to columns as observations
new_data = new_data';
data = new_data;
% save the k-means reduced dataset
save Datasets/new_data_kmeans.mat data; 
