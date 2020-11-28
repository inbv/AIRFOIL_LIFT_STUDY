close all force
clear


run01='11S.txt';
s=load(run01);


figure(1)

plot(s)
axis([100 225 ])
grid




sb    = s(120:205);
sbm   = mean(sb)
sbml  = 1:length(sb);
sbmv  = sbm * ones(1, length(sbml));


figure(2)
plot(sb, sbmv)
axis([0 115 0 10])
grid