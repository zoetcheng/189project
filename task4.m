%% Task 4a
% making a scatter plot of stimulus and response data
stim = [0 5 6 7 10 15 20];
response = [.2 4.59 5.71 97.87 100.8 102.07 102.5];
plot(stim,response,'-o')
xlabel('stimulus (mV)')
ylabel('response (mV)')
title('Stimulus vs Reponse HH Neuron Model')

%% Task 4b
% hyperpolarizing shocks
stimhyp = [0 -5 -10 -15 -20 -25];
responsehyp = [.2 1.16 2.22 3.65 98.33 101.34];
plot(stimhyp,responsehyp,'-o')
xlabel('stimulus (mV)')
ylabel('response (mV)')
title('Response to Hyperpolarizing Shocks')