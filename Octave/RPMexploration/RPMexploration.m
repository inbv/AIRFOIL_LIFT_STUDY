# -------------------------------------------------------------------
# Airfoil project, IB-Program
# RPMexploration
#
# DESCRIPTION
#  



#
# REFERENCES
#
# AUTHORSHIP
# Ivan B., 68478358+inbv@users.noreply.github.com
# Script Version: 0.3.4 1:1      the 1:1 means that this script is for that airfoil
#
# Date: 19-Jul-2020, 17:13
#
# -------------------------------------------------------------------



close all force   # close all figures
clear             # clean RAM

# NOTE: files ARE w/o extensions
run01= '19Jul2020_01/run01/run01';        # my data file name, put data file in space!
run02= '19Jul2020_01/run02/run02';
run03= '19Jul2020_01/run03/run03';
run04= '19Jul2020_01/run04/run04';
run05= '19Jul2020_01/run05/run05';
run06= '19Jul2020_01/run06/run06';

# load my data

f1= load(run01); 
f2= load(run02);
f3= load(run03);
f4= load(run04);
f5= load(run05);
f6= load(run06); 

################################################################################
#RAW DATA

figure(1)  # below is figure 1 (raw data)    

subplot(611)
plot(f1)
title ('Run 1 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(612)
plot(f2)
title ('Run 2 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(613)
plot(f3)
title ('Run 3 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(614)
plot(f4)
title ('Run 4 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(615)
plot(f5)
title ('Run 5 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(616)
plot(f1)
title ('Run 6 Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

################################################################################

# DATA EXPLORATION and chosen ?dataset?

# 'magic number' came from manual data exploration using command window
# it is only possible using my eyes first

idx= 1:730;     # this index represents the values that you want to process
                  # in my case, the values before 400 and after 900 are 0

 f1b= f1(idx);
 f2b= f2(idx);
 f3b= f3(idx);
 f4b= f4(idx);
 f5b= f5(idx);
 f6b= f6(idx);

################################################################################
### PROCESSED data vvv

s1b= 1:length(f1b);
s2b= 1:length(f2b);
s3b= 1:length(f3b);
s4b= 1:length(f4b);
s5b= 1:length(f5b);
s6b= 1:length(f6b);

#means:

mf1 = mean(f1); 
mf1v= mf1 * ones(1, length(s1b));      # this makes the mean line for the graph ( the v stands for vector).

mf2 = mean(f2); 
mf2v= mf2 * ones(1, length(s2b));

mf3 = mean(f3); 
mf3v= mf3 * ones(1, length(s3b));

mf4 = mean(f4); 
mf4v= mf4 * ones(1, length(s4b));

mf5 = mean(f5); 
mf5v= mf5 * ones(1, length(s5b));

mf6 = mean(f6); 
mf6v= mf6 * ones(1, length(s6b));


################################################################################
### BELOW is standard deviation (std) and SNR (signal-to-noise ratio):

std1= std(f1b);
std2= std(f2b);
std3= std(f3b);
std4= std(f4b);
std5= std(f5b);
std6= std(f6b);

snr1= mf1/std1;
snr2= mf2/std2;
snr3= mf3/std3;
snr4= mf4/std4;
snr5= mf5/std5;
snr6= mf6/std6;


################################################################################




# plot refined data (tidy data) on a new plot

figure(2)
plot(s1b, f1b, 'r', s1b, mf1v, 'r', 
   s2b, f2b, 'g', s2b, mf2v, 'g', 
   s3b, f3b, 'b', s3b, mf3v, 'b',
   s4b, f4b, 'm', s4b, mf4v, 'm',
   s5b, f5b, 'y', s5b, mf5v, 'y',
   s6b, f6b, 'c', s6b, mf6v, 'c')
#axis ([0 600 0 40])  # I want to set such an axis for all my 5 plots. 
                     # the mean includes all the values of each dataset.
xlabel ('Sample Number')
ylabel ('Lift Force, g, (+/-) 0.5g')
title('')   # name title to your choosing
grid                 

################################################################################


figure(3) #below are histograms

histaxis= ([19 35 0 300]);    # change this to whichever axis you want for the histograms

subplot(611)
hist(f1b)
axis(histaxis)   #axis for all histograms; makes them visually comparable
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(612)
hist(f2b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(613)
hist(f3b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(614)
hist(f4b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(615)
hist(f5b)
axis(histaxis)
title('')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(616)
hist(f6b)
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

disp('(run01, run02, run03, run04, run05, run06)')
disp(mfmessage)
disp([mf1 mf2 mf3 mf4 mf5 mf6])

disp(stdmessage)
disp([std1 std2 std3 std4 std5 std6])

disp(snrmessage)
disp([snr1 snr2 snr3 snr4 snr5 snr6])


################################################################################

###RPM FROM OUTSIDE SOURCE vvv

rpm1= mean([4260, 4128])
rpm2= mean([4336, 4065])
rpm3= mean([4216, 3945])
rpm4= mean([4000, 3885])
rpm5= mean([3960, 3825])
rpm6= mean([4015, 3800])




#------------------------------------ END --------------------------------------

