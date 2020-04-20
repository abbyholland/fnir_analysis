%% Blood Pressure and Oxygen Percentage Analysis
% Functions: 
% - Directly compares the oxygen percentage averages 
%   for each state (rest, left, and right) and for
%   each trial (both Motor Imagery and Motor 
%   Execution)
% Inputs:
% - all oxygen percentage values
% - discrete blood pressure value for each participant
% Outputs:
% - Figures displaying each relevant channel separately

function compare_participants(y_lim, y_label, ch, left_ch, right_ch, sp_x, sp_y, rest_time, rest_samples, event_time, event_samples, bl_p, rest_p1, rest_p2, left_p1, left_p2, right_p1, right_p2)

% Rest
figure()
for i=1:length(ch) % number of channels; use this to define which channels to print
    subplot(sp_x*2,sp_y,i)
    plot(linspace(0, rest_time, rest_samples), rest_p1(:,i)) %define certain channels or average across?
    hold on
    plot(linspace(0, rest_time, rest_samples), rest_p2(:,i)) %define certain channels or average across?
    tit = sprintf('Rest,MI: Channel %.f', ch(i));
    title(tit)
    xlabel('Time (seconds)')
    ylabel(y_label)
    legend(bl_p)
%     ylim(y_lim)
%     xlim([0,3000])
end

% Left
figure()
for i=1:length(left_ch) 
    subplot(sp_x,sp_y,i)
    plot(linspace(0, event_time, event_samples), left_p1(:,i)) 
    hold on
    plot(linspace(0, event_time, event_samples), left_p2(:,i)) 
    tit = sprintf('L,MI: Channel %.f', ch(i));
    title(tit)
    legend(bl_p)
    xlabel('Time (seconds)')
    ylabel(y_label)
%     ylim(y_lim)
%     xlim([0,3000])
end

% Right
figure()
for i=1:length(right_ch)
    subplot(sp_x,sp_y,i)
    plot(linspace(0, event_time, event_samples), right_p1(:,i)) 
    hold on
    plot(linspace(0, event_time, event_samples), right_p2(:,i)) 
    tit = sprintf('R,MI: Channel %.f', ch(i));
    title(tit)
    xlabel('Time (seconds)')
    ylabel(y_label)
    legend(bl_p)
%     ylim(y_lim)
%     xlim([0,3000])
end

% Differences
right_diff = right_p1 - right_p2;
left_diff = left_p1 - left_p2;
rest_diff = rest_p1 - rest_p2;

figure()
subplot(1,3,1)
plot(linspace(0, event_time, event_samples), right_diff)
title('Participant Differences with the Right Movement State')
xlabel('Time (seconds)')
ylabel(y_label)
subplot(1,3,2)
plot(linspace(0, event_time, event_samples), left_diff)
title('Participant Differences with the Left Movement State')
xlabel('Time (seconds)')
ylabel(y_label)
subplot(1,3,3)
plot(linspace(0, rest_time, rest_samples), rest_diff)
title('Participant Differences with the Rest Movement State')
xlabel('Time (seconds)')
ylabel(y_label)
end