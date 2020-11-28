# -------------------------------------------------------------------
# IB Physics Extended Essay
# LiftDataProcessingA
#
# DESCRIPTION
#  - Compare 2 datasets in a visual way, with uncertainties
#
#
# AUTHORSHIP
# Ivan B., 68478358+inbv@users.noreply.github.com
# Script Version: 1.6.9A
#    
# Date: 16-oct-2020 7:32
#
# -------------------------------------------------------------------



close all force   # close all figures
clear             # clean RAM

run01= 'MediumAngle/1M.txt';        # put datasets from the first set here. In my case, this is the Medium Angle of Attack (AOK)
run02= 'MediumAngle/17M2516.txt';        
run03= 'MediumAngle/16M52.txt';
run04= 'MediumAngle/4M.txt';
run05= 'MediumAngle/5M.txt';

###

run06='LargeAngle/6L.txt';          # put datasets from the second set here. In my case, this is the Large Angle of Attack (AOK)
run07='LargeAngle/14L2516.txt';
run08='LargeAngle/13L52.txt';
run09='LargeAngle/9L.txt';
run10='LargeAngle/10L.txt';

################################################################################
# load files

f1= load(run01); 
f2= load(run02);
f3= load(run03);
f4= load(run04);
f5= load(run05);  

f6= load(run06);
f7= load(run07);
f8= load(run08);
f9= load(run09);
f10= load(run10);

################################################################################

 f1b= f1(145:225);                  # Adjust the range for each dataset here. i.e, the set of datapoints which are valid
 f2b= f2;
 f3b= f3;
 f4b= f4(130:210);
 f5b= f5(130:240);
 
 f6b= f6(135:246);
 f7b= f7;
 f8b= f8;
 f9b= f9(140:252);
 f10b= f10(226:311);
 
################################################################################

 mf1 = mean(f1b);                   # find the mean average for each dataset. 
 mf2 = mean(f2b);
 mf3 = mean(f3b);
 mf4 = mean(f4b);
 mf5 = mean(f5b);
 
 mf6 = mean(f6b);
 mf7 = mean(f7b);
 mf8 = mean(f8b);
 mf9 = mean(f9b);
 mf10 = mean(f10b);

################################################################################

fig4mx=([1 25/16 5/2 4 6]);                 # state x-axis values. In this case, it is the thickness ratio in decimal form
fig4axis= ([0 7 0 35]);                     # state range of x-axis to include all the values in fig4max
fig4plot1= ([mf1 mf2 mf3 mf4 mf5]);         # state the y-values for the first dataset. In this case, it would be the lift force of the Medium AOK.
fig4plot2= ([mf6 mf7 mf8 mf9 mf10]);        # state the y-values for the seecond dataset. In this case, it would be the lift force of the Large AOK.

err= ([5 4 4 3 2]);                         # state the uncertainty for each x-value. Not that this uncertainty is on the y-axis, and is both above and below the datapoint, and will apply to both datasets.

t1= fig4plot1 + err/2;                      # states the (maximum) uncertainty above each datapoint for the first dataset (i.e, M AOK)
b1= fig4plot1 - err/2;                      # states the (minimum) uncertainty below each datapoint for the first dataset (i.e, M AOK)

t2= fig4plot2 + err/2;                      # states the (maximum) uncertainty above each datapoint for the second dataset (i.e, L AOK)
b2= fig4plot2 - err/2;                      # states the (minimum) uncertainty below each datapoint for the second dataset (i.e, L AOK)

################################################################################

figure(1)                           

plot(fig4mx, fig4plot1, 'r-', fig4mx, fig4plot1, 'ro', fig4mx, fig4plot2, 'b:', fig4mx, fig4plot2, 'bo',            # the next is complicated. Summarized, it displays the final plot. As long as the values in the previous section are correct, this figure should turn out fine.
fig4mx, t1, 'r--', fig4mx, b1, 'r--', fig4mx, t2, 'b--', fig4mx, b2, 'b--')

hold on
for i=1:length(fig4mx)
 plot([fig4mx(i) fig4mx(i)], [b1(i) t1(i)], 'r')
end
hold off

hold on
for i=1:length(fig4mx)
 plot([fig4mx(i) fig4mx(i)], [b2(i) t2(i)], 'b:')
end
hold off

axis(fig4axis)                          
title('Mean Force vs. Airfoil Model , Red(-): M AOK , Blue (...): L AOK')           #consider changing these values for you own purposes. 
xlabel('Top to Bottom Thickness Ratio')
ylabel('Mean Force, g')
grid