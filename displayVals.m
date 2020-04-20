%% Individual Data Display Script
% Function:
% - prints main graphs for an individual dataset 
% 
% Inputs:
% - most of the data from process.m
% 
% Outputs:
% - 7 figures from the single trial for individual analysis

function displayVals(baseline, time, sp_x, sp_y, oxy, oxy_filt, deoxy_filt, bl_vol, p_oxy, p_oxy_filt, p_oxy_deriv, rest_oxy_avg, rest_deoxy_avg, rest_bl_vol_avg, rest_p_oxy_avg, left_oxy_avg, left_deoxy_avg, left_bl_vol_avg, left_p_oxy_avg, right_oxy_avg, right_deoxy_avg, right_bl_vol_avg, right_p_oxy_avg, onset, event_samples, rest_samples, event_time, rest_time, ch, fs)

label = {'Rx1-Tx1', 'Rx1-Tx2', 'Rx1-Tx3', 'Rx2-Tx1', 'Rx2-Tx3', 'Rx3-Tx4', 'Rx3-Tx2', 'Rx3-Tx3', 'Rx4-Tx2', 'Rx4-Tx4', 'Rx1-Tx5', 'Rx1-Tx6', 'Rx1-Tx7', 'Rx2-Tx5', 'Rx2-Tx7', 'Rx3-Tx8', 'Rx3-Tx6', 'Rx3-Tx7', 'Rx4-Tx6', 'Rx4-Tx8'};
label = label(ch);
names = {'Left Hand Movement', 'Rest', 'Right Hand Movement'};

%% Efficiency of Filter
% Oxygen
figure()
subplot(1,2,1)
plot(time, oxy(:,1))
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
title('Unfiltered Oxygenation Data')
% ylim([-10 10])
hold on
subplot(1,2,2)
plot(time, oxy_filt(:,1))
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
title('Filtered Oxygenation Data')
% ylim([-10 10])
% legend('Unfiltered','Filtered')
% xlabel('Time (seconds)')
% ylabel('Oxygenation Hemoglobin Concentration')
% title('Oxygenation Data')
% legend(label)

% Percentage Oxygen

figure()
subplot(1,2,1)
plot(time, p_oxy(:,1))
hold on
% legend('Oxy. Conc.','Blood Volume','Oxy. Percentage')
title('Raw Oxy. Percentage Calculation for Channel 1')
xlabel('Time (seconds)')
ylabel('Concentration Percentage')
ylim([0 120])

subplot(1,2,2)
plot(time, p_oxy_filt(:,1))
hold on
title('Filtered Oxy. Percentage Calculation for Channel 1')
xlabel('Time (seconds)')
ylabel('Concentration Percentage')
ylim([0 120])

figure()
plot(time(1:length(p_oxy_deriv)), p_oxy_deriv)
title('Derived Oxygen Percentage')
ylim([-100 100])

figure()
plot(time, oxy_filt(:,1))
hold on
plot(time, deoxy_filt(:,1))
plot(time, bl_vol(:,1))
legend('Oxy. Conc.','Deoxy. Conc.','Blood Volume')
title('Blood Volume Calculation for Channel 1')
xlabel('Time (seconds)')
ylabel('Hemoglobin Concentration')

figure()
plot(time, oxy_filt(:,1))
hold on
plot(time, bl_vol(:,1))
plot(time, p_oxy_filt(:,1))
legend('Oxy. Conc.','Blood Volume','Oxy. Percentage')
title('Oxy. Percentage Calculation for Channel 1')
xlabel('Time (seconds)')
ylabel('Hemoglobin Concentration')

%% Total Values
figure()
% Oxygenated Blood
% subplot(1,2,1)
figure()
plot(time, oxy_filt)
xlabel('Time (seconds)')
ylabel('Oxygenated Blood')
title('Oxygenated Blood as a Function of Time')
% ylim([-10 +10])
legend(label)
% hold on;
% vline(time(onset{1,1}), 'r:', names(1))
% vline(time(onset{1,2}), 'k', names(2))
% vline(time(onset{1,3}), 'b:', names(3))
% hold off;

% Deoxygenated Blood
% subplot(1,2,2)
figure()
plot(time, deoxy_filt)
xlabel('Time (seconds)')
ylabel('Deoxygenated Blood')
title('Dexygenated Blood as a Function of Time')
% ylim([-10 +10])
legend(label)
% hold on;
% vline(time(onset{1,1}), 'r:', names(1))
% vline(time(onset{1,2}), 'k', names(2))
% vline(time(onset{1,3}), 'b:', names(3))
% hold off;

figure()
% Blood Volume
% subplot(1,2,1)
figure()
plot(time, bl_vol)
xlabel('Time (seconds)')
ylabel('Total Blood Volume')
title('Total Blood Volume as a Function of Time')
% ylim([0 +15])
legend(label)
% hold on;
% vline(time(onset{1,1}), 'r:', names(1))
% vline(time(onset{1,2}), 'k', names(2))
% vline(time(onset{1,3}), 'b:', names(3))
% hold off;

% Percentage of Oxygenated Blood
% subplot(1,2,2)
figure()
plot(time, p_oxy)
xlabel('Time (seconds)')
ylabel('Percentage of Oxygenated Blood')
title('Oxygenated Percentage as a Function of Time')
legend(label)
% ylim([-100 100])
% hold on;
% vline(time(onset{1,1}), 'r:', names(1))
% vline(time(onset{1,2}), 'k', names(2))
% vline(time(onset{1,3}), 'b:', names(3))
% hold off;

% Percentage of Oxygenated Blood by Channel
figure()
for i=1:length(ch) % number of channels; use this to define which channels to print
    subplot(sp_x*2,sp_y,i)
    plot(time, p_oxy(:,i)) %define certain channels or average across?
    tit = sprintf('Oxygen Percentage Channel %.f', ch(i));
    title(tit)
%     ylim([-100 100])
end

%% Epochs 
figure()
subplot(1,3,1)
plot(linspace(0, rest_time, rest_samples), rest_oxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
title('Resting Averaged Oxygenated Hemoglobin Concentration')
% ylim([-1 1])
subplot(1,3,2)
plot(linspace(0, event_time, event_samples), left_oxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
title('Left Hand Averaged Oxygen Hemoglobin Concentration')
% ylim([-1 1])
subplot(1,3,3)
plot(linspace(0, event_time, event_samples), right_oxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
title('Right Hand Averaged Oxygenated Hemoglobin Concentration')
% ylim([-1 1])

figure()
subplot(1,3,1)
plot(linspace(0, rest_time, rest_samples), rest_deoxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')
title('Resting Averaged Deoxygenated Hemoglobin Concentration')
% ylim([-1 1])
subplot(1,3,2)
plot(linspace(0, event_time, event_samples), left_deoxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')
title('Left Hand Averaged Deoxygenated Hemoglobin Concentration')
% ylim([-1 1])
subplot(1,3,3)
plot(linspace(0, event_time, event_samples), right_deoxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')
title('Right Hand Averaged Deoxygenated Hemoglobin Concentration')
% ylim([-1 1])

figure()
subplot(1,3,1)
plot(linspace(0, rest_time, rest_samples), rest_bl_vol_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Blood Volume')
title('Resting Averaged Blood Volume')
% ylim([0 6])
subplot(1,3,2)
plot(linspace(0, event_time, event_samples), left_bl_vol_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Blood Volume')
title('Left Hand Averaged Blood Volume')
% ylim([0 6])
subplot(1,3,3)
plot(linspace(0, event_time, event_samples), right_bl_vol_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Blood Volume')
title('Right Hand Averaged Blood Volume')
% ylim([0 6])

figure()
subplot(1,3,1)
plot(linspace(0, rest_time, rest_samples), rest_p_oxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')
title('Resting Averaged Oxygenated Percentage')
% ylim([-100 100])
subplot(1,3,2)
plot(linspace(0, event_time, event_samples), left_p_oxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')
title('Left Hand Averaged Oxygenated Percentage')
% ylim([-100 100])
subplot(1,3,3)
plot(linspace(0, event_time, event_samples), right_p_oxy_avg)
legend(label)
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')
title('Right Hand Averaged Oxygenated Percentage')
% ylim([-100 100])

end