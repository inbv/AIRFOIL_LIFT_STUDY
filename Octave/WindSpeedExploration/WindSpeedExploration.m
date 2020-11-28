# -------------------------------------------------------------------
# Airfoil project, IB-Program
#
# DESCRIPTION
#  - visualize lift force data of 3 different motor loads in 3 different ways
#  - compute mean force, standard deviation, and signal-to-noise ratio (SNR)
#
# AUTHORSHIP
# Ivan B., 68478358+inbv@users.noreply.github.com
# Script Version: 0.1.3
#
# Date: 15-Oct-2020, 10:11
#
# -------------------------------------------------------------------


close all force   # close all figures
clear             # clean RAM

# NOTE: files ARE w/o extensions
run01= 'r20.txt';        # name of data files
run02= 'r19.txt';        
run03= 'r18.txt';        

f1= load(run01);   # Load datafiles:   50%   motor Load
f2= load(run02);   #                   75%   motor load
f3= load(run03);   #                   100%  motor load

################################################################################

figure(1)                              # Figure 1 plots the raw data for each run    

subplot(311)
plot(f1)
title ('50% Motor Load Capacity Raw Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
axis([0 500 3 7])                       # the axis is set individually for each dataset             
grid

subplot(312)
plot(f2)
title ('75% Motor Load Capacity Raw Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
axis([0 350 9 16])
grid

subplot(313)
plot(f3)
title ('100% Motor Load Capacity Raw Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
axis([0 300 22 34])
grid

################################################################################

f1b=f1;        # for this code, all of my f1, f2, and f3 files resulted to be valid, containing no 0 values.
f2b=f2;        # however, if you want to exclude some values, this is where you modify the range of each dataset.
f3b=f3;

s1b= 1:length(f1b);
s2b= 1:length(f2b);
s3b= 1:length (f3b);

mf1 = mean(f1b);                       # finds and attributs mean force of selected dataset to a variable.
mf1v= mf1 * ones(1, length(s1b));      # makes the mean a vector, meaning that it can be used as a mean line when plotted (later steps).

mf2 = mean(f2b); 
mf2v= mf2 * ones(1, length(s2b));

mf3 = mean(f3b); 
mf3v= mf3 * ones(1, length(s3b));

std1= std(f1b);                        # calculates and attribues standard deviation of select dataset to a variable. 
std2= std(f2b);
std3= std(f3b);

snr1= mf1/std1;                        # calculates the signal-to-noise ratio (SNR) of select dataset and appoints it to a variable.
snr2= mf2/std2;
snr3= mf3/std3;

################################################################################

figure(2)                               # plots superimposed datasets with mean lines on a plot, color-coded
plot(s1b, f1b, 'r', s1b, mf1v, 'r', 
   s2b, f2b, 'g', s2b, mf2v, 'g', 
   s3b, f3b, 'b', s3b, mf3v, 'b')
axis ([0 500 0 34])                     # sets the general axis for all datasets. Note that some datasets might be cut off, but the mean takes the whole file into account. 
xlabel ('Sample Number')
ylabel ('Lift Force, g, (+/-) 0.5g')
title('Wind Speed Exploration. Motor Load: Red = 50% , Green = 75%, Blue = 100%')
grid                 

################################################################################

histogramaxis= ([3 34 0 400]);           # sets axis for all histograms, in order for them to be comparable.

figure(3)                                # Figure 3 sub-plots the 3 histograms of the datasets. 

subplot(311)
hist(f1b)
axis(histogramaxis)  
title('Histogram of Motor at 50% Load Capacity')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(312)
hist(f2b)
axis(histogramaxis)
title('Histogram of Motor at 75% Load Capacity')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(313)
hist(f3b)
axis(histogramaxis)
title('Histogram of Motor at 100% Load Capacity')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

################################################################################

mfmessage= 'meaan forces:';                  # this concluding message outputs the mean average force, standard deviaiton, and SNR.
stdmessage= 'standard deviation:';
snrmessage= 'SNR(signal-to-noise ratio):';

disp('(50%, 75%, 100%)')
disp(mfmessage)
disp([mf1 mf2 mf3 ])

disp(stdmessage)
disp([std1 std2 std3 ])

disp(snrmessage)
disp([snr1 snr2 snr3 ])

# ------------------------------------ END ------------------------------------

