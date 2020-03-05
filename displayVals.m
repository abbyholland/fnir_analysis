%% Individual Data Display Script
% Function:
% - prints main graphs for an individual dataset 
% 
% Inputs:
% - most of the data from process.m
% 
% Outputs:
% - 7 figures from the single trial for individual analysis

function displayVals(time, oxy, oxy_filt, deoxy_filt, bl_vol, p_oxy, rest_oxy_avg, rest_deoxy_avg, rest_bl_vol_avg, rest_p_oxy_avg, left_oxy_avg, left_deoxy_avg, left_bl_vol_avg, left_p_oxy_avg, right_oxy_avg, right_deoxy_avg, right_bl_vol_avg, right_p_oxy_avg, onset, event_samples, rest_samples)

label = {'Rx1-Tx1', 'Rx1-Tx2', 'Rx1-Tx3', 'Rx2-Tx1', 'Rx2-Tx3', 'Rx3-Tx4', 'Rx3-Tx2', 'Rx3-Tx3', 'Rx4-Tx2', 'Rx4-Tx4', 'Rx1-Tx5', 'Rx1-Tx6', 'Rx1-Tx7', 'Rx2-Tx5', 'Rx2-Tx7', 'Rx3-Tx8', 'Rx3-Tx6', 'Rx3-Tx7', 'Rx4-Tx6', 'Rx4-Tx8'};
names = {'Left Hand Movement', 'Rest', 'Right Hand Movement'};

% Efficiency of Filter
disp('in display')
figure()
plot(time, oxy, time, oxy_filt);
legend(label, label)
title('Filtered Oxygenation Data vs Unfiltered Oxygenation Data')

figure()
% Oxygenated Blood
subplot(1,2,1)
plot(time, oxy_filt)
xlabel('Time')
ylabel('Oxygenated Blood')
title('Oxygenated Blood as a Function of Time')
legend(label)
hold on;
vline(time(onset{1,1}), 'r:', names(1))
vline(time(onset{1,2}), 'k', names(2))
vline(time(onset{1,3}), 'b:', names(3))
hold off;

% Deoxygenated Blood
subplot(1,2,2)
plot(time, deoxy_filt)
xlabel('Time')
ylabel('Deoxygenated Blood')
title('Dexygenated Blood as a Function of Time')
legend(label)
hold on;
vline(time(onset{1,1}), 'r:', names(1))
vline(time(onset{1,2}), 'k', names(2))
vline(time(onset{1,3}), 'b:', names(3))
hold off;

figure()
% Blood Volume
subplot(1,2,1)
plot(time, bl_vol)
xlabel('Time')
ylabel('Total Blood Volume')
title('Total Blood Volume as a Function of Time')
legend(label)
hold on;
vline(time(onset{1,1}), 'r:', names(1))
vline(time(onset{1,2}), 'k', names(2))
vline(time(onset{1,3}), 'b:', names(3))
hold off;

% Percentage of Oxygenated Blood
subplot(1,2,2)
plot(time, p_oxy)
xlabel('Time')
ylabel('Percentage of Oxygenated Blood')
title('Oxygenated Percentage as a Function of Time')
legend(label)
ylim([-0.2e07 0.2e07])
hold on;
vline(time(onset{1,1}), 'r:', names(1))
vline(time(onset{1,2}), 'k', names(2))
vline(time(onset{1,3}), 'b:', names(3))
hold off;

% Epochs 
figure()
subplot(1,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_oxy_avg)
title('Resting Averaged Oxygenation Level')
subplot(1,3,2)
plot(linspace(0, event_samples, event_samples), left_oxy_avg)
title('Left Hand Averaged Oxygenation Level')
subplot(1,3,3)
plot(linspace(0, event_samples, event_samples), right_oxy_avg)
title('Right Hand Averaged Oxygenation Level')

figure()
subplot(1,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_deoxy_avg)
title('Resting Averaged Deoxygenation Level')
subplot(1,3,2)
plot(linspace(0, event_samples, event_samples), left_deoxy_avg)
title('Left Hand Averaged Deoxygenation Level')
subplot(1,3,3)
plot(linspace(0, event_samples, event_samples), right_deoxy_avg)
title('Right Hand Averaged Deoxygenation Level')

figure()
subplot(1,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_bl_vol_avg)
title('Resting Averaged Blood Volume')
subplot(1,3,2)
plot(linspace(0, event_samples, event_samples), left_bl_vol_avg)
title('Left Hand Averaged Blood Volume')
subplot(1,3,3)
plot(linspace(0, event_samples, event_samples), right_bl_vol_avg)
title('Right Hand Averaged Blood Volume')

figure()
subplot(1,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg)
title('Resting Averaged Oxygenated Percentage')
subplot(1,3,2)
plot(linspace(0, event_samples, event_samples), left_p_oxy_avg)
title('Left Hand Averaged Oxygenated Percentage')
subplot(1,3,3)
plot(linspace(0, event_samples, event_samples), right_p_oxy_avg)
title('Right Hand Averaged Oxygenated Percentage')


end