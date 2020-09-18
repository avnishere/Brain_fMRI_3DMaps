# -*- coding: utf-8 -*-
"""
Created on Tue Sep 10 03:16:24 2019

@author: avnis
"""
import glob
import pandas as pd
import numpy as np
from scipy.misc import imsave
import matplotlib


files = glob.glob("*.csv")

for index, file in enumerate(files):
    print(file)
    print(index)
    
    
data = pd.read_csv('LBC360013.csv') 

data = data.values

data = np.delete(data, 0, axis = 1)

data = data.reshape((300000,))

#data = np.interp(data, (data.min(), data.max()), (0, 255))

#matplotlib.image.imsave('name.png', data)
#imsave('try.jpeg', data)