# -------------------------------------------------------------------
# Airfoil project, IB-Program
# LiftDataProcessing
#
# DESCRIPTION
#  - visualize lift force data of all runs in both raw form and comparable,
#  processed form. 
#  - find their mean, standard deviation, and signal-to-noise ration (SNR)
#    - display these results in a summery text message
#
# REFERENCES
#
# AUTHORSHIP
# Ivan B., 68478358+inbv@users.noreply.github.com
# Script Version: 0.3 1:1      the 1:1 means that this script is for that airfoil
#
# Date: 18-Jul-2020, 14:45
#
# -------------------------------------------------------------------



close all force   # close all figures
clear             # clean RAM

# NOTE: files ARE w/o extensions
run01= '18Jul2020_01/Run01/run01';        # my data file name, put data file in space!
run02= '18Jul2020_01/Run02/run02';
run03= '18Jul2020_01/Run03/run03';
run04= '18Jul2020_01/Run04/run04';
run05= '18Jul2020_01/Run05/run05';

# load my data

f1= load(run01); 
f2= load(run02);
f3= load(run03);
f4= load(run04);
f5= load(run05);  

################################################################################
#RAW DATA

figure(1)  # below is figure 1 (raw data)    

subplot(511)
plot(f1)
title ('Run 1 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(512)
plot(f2)
title ('Run 2 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(513)
plot(f3)
title ('Run 3 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(514)
plot(f4)
title ('Run 4 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(515)
plot(f5)
title ('Run 5 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

################################################################################

# DATA EXPLORATION and chosen ?dataset?

# 'magic number' came from manual data exploration using command window
# it is only possible using my eyes first

idx= 400:900;     # this index represents the values that you want to process
                  # in my case, the values before 400 and after 900 are 0

 f1b= f1(idx);
 f2b= f2(idx);
 f3b= f3(idx);
 f4b= f4(idx);
 f5b= f5(idx);

################################################################################
### PROCESSED data vvv

s1b= 1:length(f1b);
s2b= 1:length(f2b);
s3b= 1:length(f3b);
s4b= 1:length(f4b);
s5b= 1:length(f5b);

#means:

mf1 = mean(f1b); 
mf1v= mf1 * ones(1, length(s1b));      # this makes the mean line for the graph ( the v stands for vector).

mf2 = mean(f2b); 
mf2v= mf2 * ones(1, length(s2b));

mf3 = mean(f3b); 
mf3v= mf3 * ones(1, length(s3b));

mf4 = mean(f4b); 
mf4v= mf4 * ones(1, length(s4b));

mf5 = mean(f5b); 
mf5v= mf5 * ones(1, length(s5b));


################################################################################
### BELOW is standard deviation (std) and SNR (signal-to-noise ratio):

std1= std(f1b);
std2= std(f2b);
std3= std(f3b);
std4= std(f4b);
std5= std(f5b);

snr1= mf1/std1;
snr2= mf2/std2;
snr3= mf3/std3;
snr4= mf4/std4;
snr5= mf5/std5;


################################################################################




# plot refined data (tidy data) on a new plot

figure(2)
plot(#s1b, f1b, 'r', s1b, mf1v, 'r', 
   s2b, f2b, 'g', s2b, mf2v, 'g', 
   s3b, f4b, 'b', s4b, mf4v, 'b',
   s4b, f3b, 'm', s3b, mf3v, 'm')
   #s5b, f5b, 'y', s5b, mf5v, 'y')
#axis ([0 600 0 40])  # I want to set such an axis for all my 5 plots. 
                     # the mean includes all the values of each dataset.
xlabel ('Sample Number')
ylabel ('Lift Force, g, (+/-) 0.5g')
title('')   # name title to your choosing
grid                 

################################################################################


figure(3) #below are histograms

histaxis= ([17 36 0 250]);    # change this to whichever axis you want for the histograms

subplot(511)
hist(f1b)
axis(histaxis)   #axis for all histograms; makes them visually comparable
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(512)
hist(f2b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(513)
hist(f3b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(514)
hist(f4b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(515)
hist(f5b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid


################################################################################
### Final summary "message" vvv


mfmessage= 'mean forces:';
stdmessage= 'standard deviation:';
snrmessage= 'SNR(signal-to-noise ratio):';

disp('(run01, run02, run03, run04, run05)')
disp(mfmessage)
disp([mf1 mf2 mf3 mf4 mf5])

disp(stdmessage)
disp([std1 std2 std3 std4 std5])

disp(snrmessage)
disp([snr1 snr2 snr3 snr4 snr5])


################################################################################
#------------------------------------ END --------------------------------------

