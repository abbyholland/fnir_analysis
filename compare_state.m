%% State Analysis 
% Functions:
% - Compares the different states of individual trials for analysis
% 
% Inputs:
% - all averaged values for oxy, deoxy, bl_vol, 
%   p_oxy for right, left, and rest condtions
%
% Outputs:
% - Figure displaying comparison results

function compare_state(rest_time, rest_oxy_avg, rest_deoxy_avg, rest_bl_vol_avg, rest_p_oxy_avg, left_oxy_avg, left_deoxy_avg, left_bl_vol_avg, left_p_oxy_avg, right_oxy_avg, right_deoxy_avg, right_bl_vol_avg, right_p_oxy_avg, left_ch, right_ch)

label = {'Rx1-Tx1', 'Rx1-Tx2', 'Rx1-Tx3', 'Rx2-Tx1', 'Rx2-Tx3', 'Rx3-Tx4', 'Rx3-Tx2', 'Rx3-Tx3', 'Rx4-Tx2', 'Rx4-Tx4', 'Rx1-Tx5', 'Rx1-Tx6', 'Rx1-Tx7', 'Rx2-Tx5', 'Rx2-Tx7', 'Rx3-Tx8', 'Rx3-Tx6', 'Rx3-Tx7', 'Rx4-Tx6', 'Rx4-Tx8'};

% Define differences for each stimulus averaged trial
rest_left_oxy = rest_oxy_avg(:, left_ch)-left_oxy_avg;
rest_right_oxy = rest_oxy_avg(:, right_ch)-right_oxy_avg;
rest_left_deoxy = rest_deoxy_avg(:, left_ch)-left_deoxy_avg;
rest_right_deoxy = rest_deoxy_avg(:, right_ch)-right_deoxy_avg;
rest_left_bl_vol = rest_bl_vol_avg(:, left_ch)-left_bl_vol_avg;
rest_right_bl_vol = rest_bl_vol_avg(:, right_ch)-right_bl_vol_avg;
rest_left_p_oxy = rest_p_oxy_avg(:, left_ch)-left_p_oxy_avg;
rest_right_p_oxy = rest_p_oxy_avg(:, right_ch)-right_p_oxy_avg;

% Display results
figure()
subplot(2,1,1)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_left_oxy)
title('Rest and Left Comparison for Oxygenated Hemoglobin Concentration')
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
legend(label(left_ch))
subplot(2,1,2)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_right_oxy)
title('Rest and Right Comparison for Oxygenated Hemoglobin Concentration')
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
legend(label(right_ch))

% figure()
% subplot(2,1,1)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_oxy_avg)
% title('Rest and Left Oxy Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), left_oxy_avg)
% hold off
% subplot(2,1,2)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_oxy_avg)
% title('Rest and Right Oxy Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), right_oxy_avg)
% hold off

figure()
subplot(2,1,1)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_left_deoxy)
title('Rest and Left Comparison for Deoxygenated Hemoglobin Concentration')
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')
legend(label(left_ch))
subplot(2,1,2)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_right_deoxy)
title('Rest and Right Comparison for Deoxygenated Hemoglobin Concentration')
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')
legend(label(right_ch))

% figure()
% subplot(2,1,1)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_deoxy_avg)
% title('Rest and Left Deoxy Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), left_deoxy_avg)
% hold off
% subplot(2,1,2)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_deoxy_avg)
% title('Rest and Right Deoxy Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), right_deoxy_avg)
% hold off

figure()
subplot(2,1,1)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_left_bl_vol)
title('Rest and Left Comparison for Blood Volume')
xlabel('Time (seconds)')
ylabel('Blood Volume')
legend(label(left_ch))
subplot(2,1,2)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_right_bl_vol)
title('Rest and Right Comparison for Blood Volume')
xlabel('Time (seconds)')
ylabel('Blood Volume')
legend(label(right_ch))

% figure()
% subplot(2,1,1)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_bl_vol_avg)
% title('Rest and Left Blood Volume Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), left_bl_vol_avg)
% hold off
% subplot(2,1,2)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_bl_vol_avg)
% title('Rest and Right Blood Volume Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), right_bl_vol_avg)
% hold off

figure()
subplot(2,1,1)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_left_p_oxy)
title('Rest and Left Comparison for Oxygen Percentage')
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')
subplot(2,1,2)
plot(linspace(0, rest_time, length(rest_left_oxy)), rest_right_p_oxy)
title('Rest and Right Comparison for Oxygen Percentage')
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')

% figure()
% subplot(2,1,1)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_p_oxy_avg)
% title('Rest and Left Oxygen Percentage Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), left_p_oxy_avg)
% hold off
% subplot(2,1,2)
% plot(linspace(0, rest_time, length(rest_left_oxy)), rest_p_oxy_avg)
% title('Rest and Right Oxygen Percentage Values')
% hold on 
% plot(linspace(0, rest_time, length(rest_left_oxy)), right_p_oxy_avg)
% hold off

end