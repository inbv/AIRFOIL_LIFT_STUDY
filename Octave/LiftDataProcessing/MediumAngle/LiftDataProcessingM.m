# -------------------------------------------------------------------
# IB Physics Extended Essay
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
# Script Version: 1.7.6M
#    
# Date: 16-oct-2020 7:32
#
# -------------------------------------------------------------------



close all force   # close all figures
clear             # clean RAM

# NOTE: files ARE w/o extensions
run01= '1M.txt';        # datasets for each run 
run02= '17M2516.txt';        
run03= '16M52.txt';
run04= '4M.txt';
run05= '5M.txt';

# load my data

f1= load(run01);        # load datasets
f2= load(run02);
f3= load(run03);
f4= load(run04);
f5= load(run05);  

################################################################################

#figure(1)

#plot(f1(145:225))      # Temporary figure to find out the range of proper analyzeable datapoints (i.e. non-zero)
#plot(f2(170:230))
#plot(f3(115:300))
#plot(f4(130:210))
#plot(f5(130:240))

################################################################################

 f1b= f1(145:225);      # range of proper data (i.e, non-zero)
 f2b= f2;
 f3b= f3;
 f4b= f4(130:210);
 f5b= f5(130:240);
 
 ################################################################################

figure(1)               # This first figure displays the rough graph for each dataset. 

subplot(511)
plot(f1b)
title ('1:1 M Lift Force')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 1g')
axis([0 90 2 8])         # the axis can be set for eacth dataset
grid

subplot(512)
plot(f2b)
title ('25:16 M Lift Force')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 1g')
axis([0 65 11 19])
grid

subplot(513)
plot(f3b)
title ('5:2 M Lift Force')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 1g')
axis([0 60 10 20])
grid

subplot(514)
plot(f4b)
title ('4:1 M Lift Force')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 1g')
axis([0 90 14 23])
grid

subplot(515)
plot(f5b)
title ('6:1 M Lift Force')
xlabel('Sample Number')
ylabel('Lift Force, g, (+/-) 1g')
axis([0 120 11 20])
grid

################################################################################

s1b= 1:length(f1b);     #This part is not necessary anymore, but it is easier to leave it, as it does not mess with the code
s2b= 1:length(f2b);
s3b= 1:length(f3b);
s4b= 1:length(f4b);
s5b= 1:length(f5b);

################################################################################

mf1 = mean(f1b);                       # finds and sets mean force
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

std1= std(f1b);         # finding and stating standard deviation
std2= std(f2b);
std3= std(f3b);
std4= std(f4b);
std5= std(f5b);

snr1= mf1/std1;         # calculating and setting signal-to-noise ratio (SNR) 
snr2= mf2/std2;
snr3= mf3/std3;
snr4= mf4/std4;
snr5= mf5/std5;

################################################################################

# plot refined data (tidy data) on a new plot

figure(2)                        # plots superimposed datasets with mean lines, color-coded
plot(f1b, 'r', mf1v, 'r', 
   f2b, 'g', mf2v, 'g', 
   f3b, 'b', mf3v, 'b',
   f4b, 'k', mf4v, 'k',
   f5b, 'm', mf5v, 'm')
axis ([0 115 0 24])              # sets axes for all 5 datasets 
xlabel ('Sample Number')
ylabel ('Lift Force, g, (+/-) 1g')    
title('Medium AOK | Red: 1:1  Green: 25:16  Blue: 5:2 Black: 4:1  Magenta: 6:1')    # title and legend
grid                 

################################################################################

figure(3)                     # plots histograms (in subplots) for each dataset

histaxis= ([0 24 0 50]);      # sets geneeral axis used for all histograms, so they are comparable

subplot(511)
hist(f1b)
axis(histaxis)  
title('1:1 M Histogram')
xlabel('Lift Force, g, (+/-) 1g')
ylabel ('Number of Samples')
grid

subplot(512)
hist(f2b)
axis(histaxis)
title('25:16 M Histogram')
xlabel('Lift Force, g, (+/-) 1g')
ylabel ('Number of Samples')
grid

subplot(513)
hist(f3b)
axis(histaxis)
title('5:2 M Histogram')
xlabel('Lift Force, g, (+/-) 1g')
ylabel ('Number of Samples')
grid

subplot(514)
hist(f4b)
axis(histaxis)
title('4:1 M Histogram')
xlabel('Lift Force, g, (+/-) 1g')
ylabel ('Number of Samples')
grid

subplot(515)
hist(f5b)
axis(histaxis)
title('6:1 M Histogram')
xlabel('Lift Force, g, (+/-) 1g')           
ylabel ('Number of Samples')
grid

################################################################################
### Final summary "message"

mfmessage= 'mean forces:';
stdmessage= 'standard deviation:';
snrmessage= 'SNR(signal-to-noise ratio):';

disp('(1:1, 25:16, 5:2, 4:1, 6:1)')       # displays mean forces, standard deviations, and SNR
disp(mfmessage)
disp([mf1 mf2 mf3 mf4 mf5])

disp(stdmessage)
disp([std1 std2 std3 std4 std5])

disp(snrmessage)
disp([snr1 snr2 snr3 snr4 snr5])

################################################################################

fig4mx=([1 25/16 5/2 4 6]);               # final figure (4; below) plots mean force vs. thickness ratio (in decimal form)
fig4axis= ([0 7 0 24]);                   # refer to LiftDataProcessingA for more detail on how this works. It is much more simple than the other code.
fig4plot= ([mf1 mf2 mf3 mf4 mf5]);

figure(4)                           

plot(fig4mx, fig4plot, fig4mx, fig4plot, 'bo')
axis(fig4axis)
title('Medium AOK Lift Force Summary')
xlabel('Top to Bottom Thickness Ratio')
ylabel('Mean Force')
grid

#------------------------------------ END --------------------------------------

