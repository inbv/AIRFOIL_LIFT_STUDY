# -------------------------------------------------------------------
# Airfoil project, IB-Program
#
# DESCRIPTION
#  - visualize lift force data
#  - compute average force
#
# REFERENCES
#
# AUTHORSHIP
# Ivan B., 68478358+inbv@users.noreply.github.com
# Script Version: 0.1.1
#
# Date: 16-Jul-2020, 14:45
#
# -------------------------------------------------------------------



close all force   # close all figures
clear             # clean RAM

# NOTE: files ARE w/o extensions
run01= 'Data/WindSpeedExploration01-1';        # my data file name
run02= 'Data/WindSpeedExploration02-1';        # my data file name
run03= 'Data/WindSpeedExploration03-1';        # my data file name

# load my data

# it is me who said load content of file with name given in variable run01
# to the f1 variable
f1= load(run01);   # 50%
f2= load(run02);   # 75%
f3= load(run03);   # 100%

################################################################################
#RAW DATA
#UNCOMMENT below if want to see raw data!! vvv

figure(1)  # below is figure 1 (raw data)    

subplot(311)
plot(f1)
title ('50% Motor Load Capacity Raw Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(312)
plot(f2)
title ('75% Motor Load Capacity Raw Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

subplot(313)
plot(f3)
title ('100% Motor Load Capacity Raw Lift Force Data')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 0.5g')
grid

################################################################################

# DATA EXPLORATION and chosen ?dataset?

# 'magic number' like 15 came from manual data exploration using command window
# it is only possible using my eyes first
f1b=f1(f1>16);

# plot((f2(f2>20))(60:end), 'o')
f2b= f2(f2>20);
f2b= f2b(60:end);

#plot(f3(f3>21), 'o')
f3b= f3(f3>21);

################################################################################

s1b= 1:length(f1b);
s2b= 1:length(f2b);
s3b= 1:length (f3b);

#means:

mf1 = mean(f1b); 
mf1v= mf1 * ones(1, length(s1b));

mf2 = mean(f2b); 
mf2v= mf2 * ones(1, length(s2b));

mf3 = mean(f3b); 
mf3v= mf3 * ones(1, length(s3b));

std1= std(f1b);
std2= std(f2b);
std3= std(f3b);

snr1= mf1/std1;
snr2= mf2/std2;
snr3= mf3/std3;


# plot refined data (tidy data) on a new plot
figure(2)
plot(s1b, f1b, 'r', s1b, mf1v, 'r', 
   s2b, f2b, 'g', s2b, mf2v, 'g', 
   s3b, f3b, 'b', s3b, mf3v, 'b')
axis ([0 600 0 40])  # I want to set such an axis for all my 3 plots. Should be noted r & b are cut off!
                     # buuuuut the mean includes all the values of each dataset.
xlabel ('Sample Number')
ylabel ('Lift Force, g, (+/-) 0.5g')
title('Wind Speed Exploration. Motor Load: Red = 50% , Green = 75%, Blue = 100%')
grid                 # If you want full data, change axis to 800!!



figure(3) #below are histograms

subplot(311)
hist(f1b)
axis([17 36 0 250])   #axis for all histograms; makes them visually comparable
title('Histogram of Motor at 50% Load Capacity')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(312)
hist(f2b)
axis([17 36 0 250])
title('Histogram of Motor at 75% Load Capacity')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid

subplot(313)
hist(f3b)
axis([17 36 0 250])
title('Histogram of Motor at 100% Load Capacity')
xlabel('Lift Force, g, (+/-) 0.5g')
ylabel ('Number of Samples')
grid


mfmessage= 'meaan forces:';
stdmessage= 'standard deviation:';
snrmessage= 'SNR(signal-to-noise ratio):';

disp('(50%, 75%, 100%)')
disp(mfmessage)
disp([mf1 mf2 mf3 ])

disp(stdmessage)
disp([std1 std2 std3 ])

disp(snrmessage)
disp([snr1 snr2 snr3 ])

# --- END ---

