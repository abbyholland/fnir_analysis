%% Processing Script
% Functions:
% - Filters Data
% - Calculates blood volume and oxgen percentage
% - Averages the results from each stimulus over a given window
% 
% Inputs:
% - relevant data structure (.mat file)
% - event_samples (int)
% - rest_samples (int)
% 
% Outputs:
% - time
% - oxy_filt
% - deoxy_filt
% - bl_vol
% - p_oxy
% - all averaged values for oxy, deoxy, bl_vol, 
%   p_oxy for right, left, and rest condtions

function [onset, time, oxy, oxy_filt, deoxy_filt, bl_vol, p_oxy, rest_oxy_avg, rest_deoxy_avg, rest_bl_vol_avg, rest_p_oxy_avg, left_oxy_avg, left_deoxy_avg, left_bl_vol_avg, left_p_oxy_avg, right_oxy_avg, right_deoxy_avg, right_bl_vol_avg, right_p_oxy_avg] = process(file, event_samples, rest_samples, fs, fc)

load(file)

% Global MI Variables
time = nirs_data.time;

% Local MI Variables
oxy = nirs_data.oxyvals;
deoxy = nirs_data.dxyvals;
onset = nirs_data.events.onsets; % Relevant Stimulus Onset Indices 

% Edit data if need be 
i=0;
while max(onset{1,1})>length(time)
    disp('Error! The left stimulus index values exceed the time index values')
    onset{1,1}(end-i)=length(time);
    i=i+1;
end
left_trials = onset{1,1}(1:end-i);

i=0;
while max(onset{1,2})>length(time)
    disp('Error! The rest stimulus index values exceed the time index values')
    onset{1,2}(end-i)=length(time);
    i=i+1;
end
rest_trials = onset{1,1}(1:end-i);

i=0;
while max(onset{1,3})>length(time)
    disp('Error! The right stimulus index values exceed the time index values')
    onset{1,3}(end-i)=length(time);
    i=i+1;
end
right_trials = onset{1,1}(1:end-i);

%% Apply Signal Processing
% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.
% All frequency values are in Hz.
N  = 10;  % Order
% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass('N,F3dB', N, fc, fs);
Hd = design(h, 'butter');

for i = 1:length(onset{1,1})
    oxy_filt(:,i) = filter(Hd, oxy(:,i));
    deoxy_filt(:,i) = filter(Hd, deoxy(:,i));
end

%% Calculated Variables

bl_vol = oxy_filt+deoxy_filt;
p_oxy = 100*(oxy_filt./bl_vol);

%% Epochs 
% Set the epochs for the window (event_samples) length of the relevant
% location (starting at the onset)
% here i is equivalent to number of event trials (onset{1,1})
for i = 1:length(left_trials)-1
    left_start = onset{1,1}(i);
    left_finish = left_start+(event_samples-1);
    
    if left_finish > length(time)
        display('window goes past experiment')
        break 
    end
    left_oxy(:,:,i) = oxy_filt(left_start:left_finish, :);
    left_deoxy(:,:,i) = deoxy_filt(left_start:left_finish, :);
    left_bl_vol(:,:,i) = bl_vol(left_start:left_finish, :);
    left_p_oxy(:,:,i) = p_oxy(left_start:left_finish, :);
end
for i = 1:length(right_trials)
    right_start = onset{1,3}(i);
    right_finish = right_start+(event_samples-1);
    if right_finish > length(time)
        display('window goes past experiment')
        break
    end
    right_oxy(:,:,i) = oxy_filt(right_start:right_finish, :);
    right_deoxy(:,:,i) = deoxy_filt(right_start:right_finish, :);
    right_bl_vol(:,:,i) = bl_vol(right_start:right_finish, :);
    right_p_oxy(:,:,i) = p_oxy(right_start:right_finish, :);

end

% here i is equivalent to number of event trials (onset{1,1})
for i = 1:length(onset{1,2})-1
    rest_start = onset{1,2}(i);
    rest_finish = rest_start+(rest_samples-1);
    if rest_finish > length(time)
        display('window goes past experiment')
        break
    end
    rest_oxy(:,:,i) = oxy_filt(rest_start:rest_finish, :);
    rest_deoxy(:,:,i) = deoxy_filt(rest_start:rest_finish, :);
    rest_bl_vol(:,:,i) = bl_vol(rest_start:rest_finish, :);
    rest_p_oxy(:,:,i) = p_oxy(rest_start:rest_finish, :);
end

for i = 1:event_samples
    for counter = 1:20
        left_oxy_avg(i,counter) = mean(left_oxy(i, counter, :));
        left_deoxy_avg(i,counter) = mean(left_deoxy(i, counter, :));
        left_bl_vol_avg(i,counter) = mean(left_bl_vol(i, counter, :));
        left_p_oxy_avg(i,counter) = mean(left_p_oxy(i, counter, :));
    end
    for counter = 1:20
        right_oxy_avg(i,counter) = mean(right_oxy(i, counter, :));
        right_deoxy_avg(i,counter) = mean(right_deoxy(i, counter, :));
        right_bl_vol_avg(i,counter) = mean(right_bl_vol(i, counter, :));
        right_p_oxy_avg(i,counter) = mean(right_p_oxy(i, counter, :));

    end
end

for i = 1:rest_samples
    for counter = 1:20
        rest_oxy_avg(i,counter) = mean(rest_oxy(i, counter, :));
        rest_deoxy_avg(i,counter) = mean(rest_deoxy(i, counter, :));
        rest_bl_vol_avg(i,counter) = mean(rest_bl_vol(i, counter, :));
        rest_p_oxy_avg(i,counter) = mean(rest_p_oxy(i, counter, :));

    end
end

end