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
# Script Version: 1.7.5M
#    
# Date: 16-oct-2020 7:32
#
# -------------------------------------------------------------------



close all force   # close all figures
clear             # clean RAM

# NOTE: files ARE w/o extensions
run01= 'MediumAngle/1M.txt';        # my data file name, put data file in space!
run02= 'MediumAngle/17M2516.txt';        # 20Jul is 
run03= 'MediumAngle/16M52.txt';
run04= 'MediumAngle/4M.txt';
run05= 'MediumAngle/5M.txt';

###

run06='LargeAngle/6L.txt';
run07='LargeAngle/14L2516.txt';
run08='LargeAngle/13L52.txt';
run09='LargeAngle/9L.txt';
run10='LargeAngle/10L.txt';

# load my data

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


 f1b= f1(145:225);
 f2b= f2;
 f3b= f3;
 f4b= f4(130:210);
 f5b= f5(130:240);
 
 f6b= f6(135:246);
 f7b= f7;
 f8b= f8;
 f9b= f9(140:252);
 f10b= f10(226:311);
 
 mf1 = mean(f1b);
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
### Final summary "message" vv


#mfmessage= 'mean forces:';
#stdmessage= 'standard deviation:';
#snrmessage= 'SNR(signal-to-noise ratio):';

#disp('(1:1, 25:16, 5:2, 4:1, 6:1)')
#disp(mfmessage)
#disp([mf1 mf2 mf3 mf4 mf5])

#disp(stdmessage)
#disp([std1 std2 std3 std4 std5])

#disp(snrmessage)
#disp([snr1 snr2 snr3 snr4 snr5])

################################################################################

fig4mx=([1 25/16 5/2 4 6]);
fig4axis= ([0 7 0 35]);
fig4plot1= ([mf1 mf2 mf3 mf4 mf5]);
fig4plot2= ([mf6 mf7 mf8 mf9 mf10]);

err= ([5 4 4 3 2]);

t1= fig4plot1 + err/2;
b1= fig4plot1 - err/2;

t2= fig4plot2 + err/2;
b2= fig4plot2 - err/2;

figure(1)                           ########### W O R K   O N     T H I S

plot(fig4mx, fig4plot1, 'r-', fig4mx, fig4plot1, 'ro', fig4mx, fig4plot2, 'b:', fig4mx, fig4plot2, 'bo',
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
title('Mean Force vs. Airfoil Model , Red(-): M AOK , Blue (...): L AOK')
xlabel('Top to Bottom Thickness Ratio')
ylabel('Mean Force, g')
grid