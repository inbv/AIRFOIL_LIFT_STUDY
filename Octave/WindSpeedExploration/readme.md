# WindSpeedExploration Octave Code

## Purpose of WindSpeedExploration

The purpose of this exploration is to determine what motor load creates the most optimal results. The code for this experiment will process the lift force the airfoil produces depending on the motor load, which is recorded using Tera Term and saved as a no-extension file. 

## What the code does

The code will take the three different files and:
- Make a graph showing the raw data for each dataset
- Graph a second plot which includes the wanted values of each dataset with their mean lines. This allows for visual comparison of each run. 
- Make a final figure which includes the histograms (how many times each value was recorded) of each runthrough with comparable axes.
- Finally, it will display an output message containing the mean average, standard deviation, and SNR (signal-to-noise ratio) for every motor load.  

## Make it your own

If you want to use this code for your own data analysis, you will have to take into account several things:

First of all, you'll need to change the loaded files to your own. After seeing the raw data plotted, you will be able to visually change the axes for each set of values and create the 'b' variable for each of them. If you want to keep the dataset as is, simply make every value the same as it's refined version. For example: 

    f1b= f1(f1) #this will make the value for f1b the same as f1, which does not refine the initial values. 

