%for plotting the best fit "blue" curve with the true data

%l = input('The number for which experiment? ');

%for l = [1,3,16,21,24,26,35,36,38,41,43,45,53,55,58,60,61,67,68,69,70,72,78,80,83]
%for l = [3,9,16,26,35,38,41,43,45,55,58,60,61,68,69,70,72,78,80,83,85,88,93,94,96,100]

freq = squeeze(squeeze(info_HHH(1,5,:,:))); % magic data? You first need to run info_MUT_finding.m

kends = k; % this is where the plot stops, for now we just go to the last available day

for l = 1:6
    
x = 1:1:k;

wmut1 = squeeze((1/N)*DATA_info_MUT{i}(1,2,:,l));
wmut2 = squeeze((1/N)*DATA_info_MUT{i}(1,3,:,l));
wmut3 = squeeze((1/N)*DATA_info_MUT{i}(1,4,:,l));


rmut1 = squeeze((1/N)*DATA_info_MUT{i}(2,2,:,l));
rmut2 = squeeze((1/N)*DATA_info_MUT{i}(2,3,:,l));
rmut3 = squeeze((1/N)*DATA_info_MUT{i}(2,4,:,l));


Fig(l) = figure;  %old figure

plot(x,freq(:,l),'r',x,wmut1,':',x,wmut2,':k',x,wmut3,':',x,rmut1,':',x,rmut2,':',x,rmut3,':','LineWidth',2)
%plot(x,freq(:,l),'r',x,W_new_1(:,l),x,wmut1,':',x,wmut2,':',x,wmut3,':',x,rmut1,':',x,rmut2,':',x,rmut3,':','LineWidth',2)
%plot(x,freq(:,l),'r',x,W_new_1(:,l),'b',x,wmut1,'--',x,wmut2,'--',x,wmut3,'--',x,wmut4,'--',x,rmut1,'--',x,rmut2,'--',x,rmut3,'--',x,rmut4,'--b','LineWidth',2)


%line([best_new_1_tau(l),best_new_1_tau(l)],[0,1]);
%text(best_new_1_tau(l), 0.10, ['tau1=', num2str(best_new_1_tau(l))]);
%text(best_new_1_tau(l),0.15,['n1=', num2str(best_new_1_N_mut(l))]);
%text(best_new_1_tau(l),0.20,['s1=', num2str(best_new_1_S(l))]);

%line([true_tau1(l),true_tau1(l)],[0,1]);
%text(true_tau1(l), 0.10, ['truT1=', num2str(true_tau1(l))]);
%text(true_tau1(l),0.15,['truN1=', num2str(true_num1(l))]);
%text(true_tau1(l),0.20,['truS1=', num2str(true_S1(l))]);


%if best_new_2_S2(l)>0.02 && best_new_2_S2(l)<0.198
%line([best_new_2_tau2(l),best_new_2_tau2(l)],[0,1]);
%text(best_new_2_tau2(l), 0.25, ['tau2=', num2str(best_new_2_tau2(l))]);
%text(best_new_2_tau2(l),0.30,['n2=', num2str(best_new_2_N_mut2(l))]);
%text(best_new_2_tau2(l),0.35,['s2=', num2str(best_new_2_S2(l))]);
%end

%line([Tmin1(l),Tmin1(l)],[0,1]);
%text(Tmin1(l), 0.05, ['Tmin1=', num2str(Tmin1(l))]);

%line([Tmax1(l),Tmax1(l)],[0,1]);
%text(Tmax1(l), 0.05, ['Tmax1=', num2str(Tmax1(l))]);



%title(['Net White Frequency - High Order 1-Fit vs Observed - Run# ',num2str(l)]);
title(['Net White Frequency with Individual Mutant Frequencies - Run# ',num2str(l)]);
xlabel('days');
ylabel('frequency');

axis([0 kends 0 1.0]);
legend({'observed','w1','w2','w3','r1','r2','r3'},'Location','northwest');
%legend({'observed','1-event fit','2-event fit','w1','w2','w3','r1','r2','r3'},'Location','northwest');
%legend({'observed','1-event fit','w1','w2','w3','r1','r2','r3'},'Location','northwest');
%legend({'observed','best-fit','w1','w2','w3','w4','r1','r2','r3','r4'},'Location','northwest');
%legend({'observed','fit2','w1','w2','w3','r1','r2','r3'},'Location','northwest');


%filename=['High Order 1 Event Fit with Mutants ' num2str(l) '.pdf'];
%saveas(Fig(l),filename);
%close
end


