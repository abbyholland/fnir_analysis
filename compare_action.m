%% Motor Trial Analysis 
% Functions:
% - Compares the different states of individual trials for analysis
% 
% Inputs:
% - all averaged values for oxy_MI, deoxy_MI, bl_vol_MI, 
%   p_oxy for right_MI, left_MI, and rest condtions
%
% Outputs:
% - Figure displays differences between the ME and MI values for each
% stimulus
% - Figure displays both MI and ME average values for each stimulus

function compare_action(rest_time, event_time, rest_oxy_avg_MI, rest_deoxy_avg_MI, rest_bl_vol_avg_MI, rest_p_oxy_avg_MI, left_oxy_avg_MI, left_deoxy_avg_MI, left_bl_vol_avg_MI, left_p_oxy_avg_MI, right_oxy_avg_MI, right_deoxy_avg_MI, right_bl_vol_avg_MI, right_p_oxy_avg_MI, rest_oxy_avg_ME, rest_deoxy_avg_ME, rest_bl_vol_avg_ME, rest_p_oxy_avg_ME, left_oxy_avg_ME, left_deoxy_avg_ME, left_bl_vol_avg_ME, left_p_oxy_avg_ME, right_oxy_avg_ME, right_deoxy_avg_ME, right_bl_vol_avg_ME, right_p_oxy_avg_ME, ch, left_ch, right_ch)

label = {'Rx1-Tx1', 'Rx1-Tx2', 'Rx1-Tx3', 'Rx2-Tx1', 'Rx2-Tx3', 'Rx3-Tx4', 'Rx3-Tx2', 'Rx3-Tx3', 'Rx4-Tx2', 'Rx4-Tx4', 'Rx1-Tx5', 'Rx1-Tx6', 'Rx1-Tx7', 'Rx2-Tx5', 'Rx2-Tx7', 'Rx3-Tx8', 'Rx3-Tx6', 'Rx3-Tx7', 'Rx4-Tx6', 'Rx4-Tx8'};

% Left
left_oxy_diff = left_oxy_avg_ME - left_oxy_avg_MI;
left_deoxy_diff = left_deoxy_avg_ME - left_deoxy_avg_MI;
left_bl_vol_diff = left_bl_vol_avg_ME - left_bl_vol_avg_MI;
left_p_oxy_diff = left_p_oxy_avg_ME - left_p_oxy_avg_MI;

% Rest
rest_oxy_diff = rest_oxy_avg_ME - rest_oxy_avg_MI;
rest_deoxy_diff = rest_deoxy_avg_ME - rest_deoxy_avg_MI;
rest_bl_vol_diff = rest_bl_vol_avg_ME - rest_bl_vol_avg_MI;
rest_p_oxy_diff = rest_p_oxy_avg_ME - rest_p_oxy_avg_MI;

% Right
right_oxy_diff = right_oxy_avg_ME - right_oxy_avg_MI;
right_deoxy_diff = right_deoxy_avg_ME - right_deoxy_avg_MI;
right_bl_vol_diff = right_bl_vol_avg_ME - right_bl_vol_avg_MI;
right_p_oxy_diff = right_p_oxy_avg_ME - right_p_oxy_avg_MI;

figure()
subplot(1,3,1)
plot(linspace(0, rest_time, length(rest_oxy_diff)), rest_oxy_diff)
title('Resting Oxygen Differences')
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')

legend(label(ch))
subplot(1,3,2)
plot(linspace(0, event_time, length(left_oxy_diff)), left_oxy_diff)
title('Left Hand Oxygen Differences')
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
legend(label(left_ch))
subplot(1,3,3)
plot(linspace(0, event_time, length(left_oxy_diff)), right_oxy_diff)
title('Right Hand Oxygen Differences')
xlabel('Time (seconds)')
ylabel('Oxygenated Hemoglobin Concentration')
legend(label(right_ch))

% figure()
% subplot(3,1,1)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_oxy_avg_ME)
% title('Resting Oxygen for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_oxy_avg_MI)
% hold off
% subplot(3,1,2)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_oxy_avg_ME)
% title('Left Hand Oxygen for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_oxy_avg_MI)
% hold off
% subplot(3,1,3)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_oxy_avg_ME)
% title('Right Hand Oxygen for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_oxy_avg_MI)
% hold off

figure()
subplot(1,3,1)
plot(linspace(0, rest_time, length(rest_oxy_diff)), rest_deoxy_diff)
title('Resting Deoxygenated Differences')
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')
subplot(1,3,2)
plot(linspace(0, event_time, length(left_oxy_diff)), left_deoxy_diff)
title('Left Hand Deoxygenated Differences')
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')
subplot(1,3,3)
plot(linspace(0, event_time, length(left_oxy_diff)), right_deoxy_diff)
title('Right Hand Deoxygenated Differences')
xlabel('Time (seconds)')
ylabel('Deoxygenated Hemoglobin Concentration')

% figure()
% subplot(3,1,1)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_deoxy_avg_ME)
% title('Resting Deoxygenated for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_deoxy_avg_MI)
% hold off
% subplot(3,1,2)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_deoxy_avg_ME)
% title('Left Hand Deoxygenated for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_deoxy_avg_MI)
% hold off
% subplot(3,1,3)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_deoxy_avg_ME)
% title('Right Hand Deoxygenated for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_oxy_avg_MI)
% hold off

figure()
subplot(1,3,1)
plot(linspace(0, rest_time, length(rest_oxy_diff)), rest_bl_vol_diff)
title('Resting Blood Volume Differences')
xlabel('Time (seconds)')
ylabel('Blood Volume')
legend(label(ch))
subplot(1,3,2)
plot(linspace(0, event_time, length(left_oxy_diff)), left_bl_vol_diff)
title('Left Hand Blood Volume Differences')
xlabel('Time (seconds)')
ylabel('Blood Volume')
legend(label(left_ch))
subplot(1,3,3)
plot(linspace(0, event_time, length(left_oxy_diff)), right_bl_vol_diff)
title('Right Hand Blood Volume Differences')
xlabel('Time (seconds)')
ylabel('Blood Volume')
legend(label(right_ch))

% figure()
% subplot(1,3,1)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_bl_vol_avg_ME)
% title('Resting Blood Volume for both ME and MI')
% xlabel('Time (seconds)')
% ylabel('Blood Volume')
% legend(label(ch))
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_bl_vol_avg_MI)
% hold off
% subplot(1,3,2)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_bl_vol_avg_ME)
% title('Left Hand Blood Volume for both ME and MI')
% xlabel('Time (seconds) ')
% ylabel('Blood Volume')
% legend(label(left_ch))
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_bl_vol_avg_MI)
% hold off
% subplot(1,3,3)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_bl_vol_avg_ME)
% title('Right Hand Blood Volume for both ME and MI')
% xlabel('Time (seconds) ')
% ylabel('Blood Volume')
% legend(label(right_ch))
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_bl_vol_avg_MI)
% hold off

figure()
subplot(1,3,1)
plot(linspace(0, rest_time, length(rest_oxy_diff)), rest_p_oxy_diff)
title('Resting Oxygenated Percentage Differences')
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')
legend(label(ch))
subplot(1,3,2)
plot(linspace(0, event_time, length(left_oxy_diff)), left_p_oxy_diff)
title('Left Hand Oxygenated Percentage Differences')
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')
legend(label(left_ch))
subplot(1,3,3)
plot(linspace(0, event_time, length(left_oxy_diff)), right_p_oxy_diff)
title('Right Hand Oxygenated Percentage Differences')
xlabel('Time (seconds)')
ylabel('Oxygen Percentage')
legend(label(right_ch))

% figure()
% subplot(3,1,1)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_p_oxy_avg_ME)
% title('Resting Oxygenated Percentage for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), rest_p_oxy_avg_MI)
% hold off
% subplot(3,1,2)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_p_oxy_avg_ME)
% title('Left Hand Oxygenated Percentage for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), left_p_oxy_avg_MI)
% hold off
% subplot(3,1,3)
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_p_oxy_avg_ME)
% title('Right Hand Oxygenated Percentage for both ME and MI')
% hold on
% plot(linspace(0, length(rest_oxy_diff), length(rest_oxy_diff)), right_p_oxy_avg_MI)
% hold off

end