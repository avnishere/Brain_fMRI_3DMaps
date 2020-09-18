clear all;close all; clc;


% Self-Organizing Map applied on dataset 2  
% The dataset with 30 centroid points of clusterd data using k-means


%load the dataset 2: Centroid k-meamns data
load('Datasets/new_data_kmeans');

%loads variable new_data with shape 90x540
x = new_data;


% Creating a Self-Organizing Map
dimension1 = 10;
dimension2 = 10;
net = selforgmap([dimension1 dimension2]);

% Visulaizations set up
net.plotFcns = {'plotsomtop','plotsomnc','plotsomnd', ...
    'plotsomplanes', 'plotsomhits', 'plotsompos'};


disp('Network training in progress...');
% Training the Network
[net,tr] = train(net,x);
clc;
disp('Training Complete');


% Testing the Network
y = net(x);

% Viewing the Network
view(net)

% Visualize the clusters
% Uncomment these lines to enable various plots.
figure, plotsomtop(net)
%figure, plotsomnc(net)
figure, plotsomnd(net)
%figure, plotsomplanes(net)
figure, plotsomhits(net,x)
figure, plotsompos(net,x)

% Deployment (Ignore if not required)

% Change the (false) values to (true) to enable the following code blocks.
% See the help for each generation function for more information.
if (false)
    % Generate MATLAB function for neural network for application
    % deployment in MATLAB scripts or with MATLAB Compiler and Builder
    % tools, or simply to examine the calculations your trained neural
    % network performs.
    genFunction(net,'myNeuralNetworkFunction');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a matrix-only MATLAB function for neural network code
    % generation.
    genFunction(net,'myNeuralNetworkFunction','MatrixOnly','yes');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    gensim(net);
end
