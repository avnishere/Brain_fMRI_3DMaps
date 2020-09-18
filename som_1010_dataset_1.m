clear all;close all; clc;


% Self-Organizing Map implementation for Dataset 1 (300000x540)
% The dataset with all the non-empty voxels.

load('Datasets/data_som_mat.mat')

%   foo - input data from mat file.
x = foo;

% Create a 2D Self-Organizing Map of 10x10 dimension
dimension1 = 10;
dimension2 = 10;

%Creating the net
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

% Visualization

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
    % Generate a Simulink diagram for simulation or deployment.
    gensim(net);
end