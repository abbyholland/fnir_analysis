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
% 
% Label Legend:
% rest: black
% left: blue
% right: red

function compare_state(rest_samples, rest_oxy_avg, rest_deoxy_avg, rest_bl_vol_avg, rest_p_oxy_avg, left_oxy_avg, left_deoxy_avg, left_bl_vol_avg, left_p_oxy_avg, right_oxy_avg, right_deoxy_avg, right_bl_vol_avg, right_p_oxy_avg)

% Define differences for each stimulus averaged trial
rest_left_oxy = rest_oxy_avg-left_oxy_avg;
rest_right_oxy = rest_oxy_avg-right_oxy_avg;
rest_left_deoxy = rest_deoxy_avg-left_deoxy_avg;
rest_right_deoxy = rest_deoxy_avg-right_deoxy_avg;
rest_left_bl_vol = rest_bl_vol_avg-left_bl_vol_avg;
rest_right_bl_vol = rest_bl_vol_avg-right_bl_vol_avg;
rest_left_p_oxy = rest_p_oxy_avg-left_p_oxy_avg;
rest_right_p_oxy = rest_p_oxy_avg-right_p_oxy_avg;

% Display results
figure()
subplot(2,2,1)
plot(linspace(0, rest_samples, rest_samples), rest_left_oxy)
title('Rest and Left Comparison for Oxy')
subplot(2,2,2)
plot(linspace(0, rest_samples, rest_samples), rest_right_oxy)
title('Rest and Right Comparison for Oxy')
subplot(2,2,3)
plot(linspace(0, rest_samples, rest_samples), rest_oxy_avg, '.k')
title('Rest and Left Oxy Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), left_oxy_avg, '.bl')
hold off
subplot(2,2,4)
plot(linspace(0, rest_samples, rest_samples), rest_oxy_avg, '.k')
title('Rest and Right Oxy Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), right_oxy_avg, '.r')
hold off

figure()
subplot(2,2,1)
plot(linspace(0, rest_samples, rest_samples), rest_left_deoxy)
title('Rest and Left Comparison for Deoxy')
subplot(2,2,2)
plot(linspace(0, rest_samples, rest_samples), rest_right_deoxy)
title('Rest and Right Comparison for Deoxy')
subplot(2,2,3)
plot(linspace(0, rest_samples, rest_samples), rest_deoxy_avg, '.k')
title('Rest and Left Deoxy Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), left_deoxy_avg, '.bl')
hold off
subplot(2,2,4)
plot(linspace(0, rest_samples, rest_samples), rest_deoxy_avg, '.k')
title('Rest and Right Deoxy Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), right_deoxy_avg, '.r')
hold off

figure()
subplot(2,2,1)
plot(linspace(0, rest_samples, rest_samples), rest_left_bl_vol)
title('Rest and Left Comparison for Blood Volume')
subplot(2,2,2)
plot(linspace(0, rest_samples, rest_samples), rest_right_bl_vol)
title('Rest and Right Comparison for Blood Volume')
subplot(2,2,3)
plot(linspace(0, rest_samples, rest_samples), rest_bl_vol_avg, '.k')
title('Rest and Left Blood Volume Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), left_bl_vol_avg, '.bl')
hold off
subplot(2,2,4)
plot(linspace(0, rest_samples, rest_samples), rest_bl_vol_avg, '.k')
title('Rest and Right Blood Volume Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), right_bl_vol_avg, '.r')
hold off

figure()
subplot(2,2,1)
plot(linspace(0, rest_samples, rest_samples), rest_left_p_oxy)
title('Rest and Left Comparison for Oxygen Percentage')
subplot(2,2,2)
plot(linspace(0, rest_samples, rest_samples), rest_right_p_oxy)
title('Rest and Right Comparison for Oxygen Percentage')
subplot(2,2,3)
plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg, '.k')
title('Rest and Left Oxygen Percentage Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), left_p_oxy_avg, '.bl')
hold off
subplot(2,2,4)
plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg, '.k')
title('Rest and Right Oxygen Percentage Values')
hold on 
plot(linspace(0, rest_samples, rest_samples), right_p_oxy_avg, '.r')
hold off

end