NOVEL ALGORITHMS FOR 3D MAPS ANALYSIS IN BRAIN MRI IMAGES	

-- AUTHOR -> AVNISH KUMAR

-----------READ ME-----------

!!!Do Not Alter the Directory Structure!!!

Folders:

1. Datasets: Contains mat files of the three datasets Dataset 1, 2, 3. Original data, Kmeans centroid data, PCA data

2. img_csv: A csv database of filenames same as of original 3d maps of cases. Each of the csv file contains
   the locations of the non-empty voxels from the stacked single image of a case. Thus 540 of such files.

3. labels: Contains mat files of labels of each of the diseases and gender. Also contains labels of all diseases
   together for multi-label classification

4. Python_Preprocessing: Contains python jupyterlab scripts made to retrieve stacked images from raw images of each case, extract non-empty-voxels
   locations and store them in csv files. These files work with a definite directory structure. Since the original database is very large, the scripts
   require to be edited with the modified directory paths and names.

5. raw_csv_labels: csv format labels of each diseases and gender including a csv file for all disease labels.

Files:

som_1010_Dataset_x : Three such matlab files exist for datasets 1, 2 and 3. Each of them execute a 10x10 2d self-organizing map and plot the clusters.

csv_to_mat_labels: The matlab file converts the csv format target lalbels of each disease and gender to mat files in order to feed it to the network.

perform_k_means_on_data: The matlab file takes the initial data matrix containinbg all the non-empty voxel locations of each case amd performs k-means clustering
			 for each of the case to output a 90x540 dataset.

perform_pca_on_kmeans_data: The matlab file computes pca on the kmeans centroid data to output a 30x540 data and plots the principal components.

neural_net: This is a matlab function created to take dataset and target label as input and perform network training and evaluation. It is run using the
            implement_nn file. [No direct use- edit for change in network layer/ layer size/ performance func. etc]  
       
implement_nn = The matlab script takes user feed of dataset choice and target label to execute the neural_net function.

multi_label_classify: The python based jupyterlab notebook takes the designated dataset (edit in the code) and all disease label as input to peform multi-label
                      classification on the data using the keras and tensorFlow framework. The results are published within theh notebook.


For any queries or suggestions, kindly contact: avnish.cic@gmail.com 