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
% 
% Label Legend:
% ME: black
% MI: green

function compare_action(rest_samples, event_samples, rest_oxy_avg_MI, rest_deoxy_avg_MI, rest_bl_vol_avg_MI, rest_p_oxy_avg_MI, left_oxy_avg_MI, left_deoxy_avg_MI, left_bl_vol_avg_MI, left_p_oxy_avg_MI, right_oxy_avg_MI, right_deoxy_avg_MI, right_bl_vol_avg_MI, right_p_oxy_avg_MI, rest_oxy_avg_ME, rest_deoxy_avg_ME, rest_bl_vol_avg_ME, rest_p_oxy_avg_ME, left_oxy_avg_ME, left_deoxy_avg_ME, left_bl_vol_avg_ME, left_p_oxy_avg_ME, right_oxy_avg_ME, right_deoxy_avg_ME, right_bl_vol_avg_ME, right_p_oxy_avg_ME)

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
subplot(2,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_oxy_diff)
title('Resting Oxygen Differences across ME and MI')
subplot(2,3,2)
plot(linspace(0, event_samples, event_samples), left_oxy_diff)
title('Left Hand Oxygen Differences across ME and MI')
subplot(2,3,3)
plot(linspace(0, event_samples, event_samples), right_oxy_diff)
title('Right Hand Oxygen Differences across ME and MI')
subplot(2,3,4)
plot(linspace(0, rest_samples, rest_samples), rest_oxy_avg_ME, '.k')
title('Resting Oxygen for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), rest_oxy_avg_MI, '.gr')
hold off
subplot(2,3,5)
plot(linspace(0, rest_samples, rest_samples), left_oxy_avg_ME, '.k')
title('Left Hand Oxygen for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), left_oxy_avg_MI, '.gr')
hold off
subplot(2,3,6)
plot(linspace(0, rest_samples, rest_samples), right_oxy_avg_ME, '.k')
title('Right Hand Oxygen for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), right_oxy_avg_MI, '.gr')
hold off

figure()
subplot(2,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_deoxy_diff)
title('Resting Deoxygenated Differences')
subplot(2,3,2)
plot(linspace(0, event_samples, event_samples), left_deoxy_diff)
title('Left Hand Deoxygenated Differences')
subplot(2,3,3)
plot(linspace(0, event_samples, event_samples), right_deoxy_diff)
title('Right Hand Deoxygenated Differences')
subplot(2,3,4)
plot(linspace(0, rest_samples, rest_samples), rest_deoxy_avg_ME, '.k')
title('Resting Deoxygenated for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), rest_deoxy_avg_MI, '.gr')
hold off
subplot(2,3,5)
plot(linspace(0, rest_samples, rest_samples), left_deoxy_avg_ME, '.k')
title('Left Hand Deoxygenated for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), left_deoxy_avg_MI, '.gr')
hold off
subplot(2,3,6)
plot(linspace(0, rest_samples, rest_samples), right_deoxy_avg_ME, '.k')
title('Right Hand Deoxygenated for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), right_oxy_avg_MI, '.gr')
hold off

figure()
subplot(2,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_bl_vol_diff)
title('Resting Blood Volume Differences')
subplot(2,3,2)
plot(linspace(0, event_samples, event_samples), left_bl_vol_diff)
title('Left Hand Blood Volume Differences')
subplot(2,3,3)
plot(linspace(0, event_samples, event_samples), right_bl_vol_diff)
title('Right Hand Blood Volume Differences')
subplot(2,3,4)
plot(linspace(0, rest_samples, rest_samples), rest_bl_vol_avg_ME, '.k')
title('Resting Blood Volume for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), rest_bl_vol_avg_MI, '.gr')
hold off
subplot(2,3,5)
plot(linspace(0, rest_samples, rest_samples), left_bl_vol_avg_ME, '.k')
title('Left Hand Blood Volume for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), left_bl_vol_avg_MI, '.gr')
hold off
subplot(2,3,6)
plot(linspace(0, rest_samples, rest_samples), right_bl_vol_avg_ME, '.k')
title('Right Hand Blood Volume for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), right_bl_vol_avg_MI, '.gr')
hold off

figure()
subplot(2,3,1)
plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_diff)
title('Resting Oxygenated Percentage Differences')
subplot(2,3,2)
plot(linspace(0, event_samples, event_samples), left_p_oxy_diff)
title('Left Hand Oxygenated Percentage Differences')
subplot(2,3,3)
plot(linspace(0, event_samples, event_samples), right_p_oxy_diff)
title('Right Hand Oxygenated Percentage Differences')
subplot(2,3,4)
plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg_ME, '.k')
title('Resting Oxygenated Percentage for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg_MI, '.gr')
hold off
subplot(2,3,5)
plot(linspace(0, rest_samples, rest_samples), left_p_oxy_avg_ME, '.k')
title('Left Hand Oxygenated Percentage for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), left_p_oxy_avg_MI, '.gr')
hold off
subplot(2,3,6)
plot(linspace(0, rest_samples, rest_samples), right_p_oxy_avg_ME, '.k')
title('Right Hand Oxygenated Percentage for both ME and MI')
hold on
plot(linspace(0, rest_samples, rest_samples), right_p_oxy_avg_MI, '.gr')
hold off

end