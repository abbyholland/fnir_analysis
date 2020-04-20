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
% - ch : relevant channel numbers
% 
% Outputs:
% - time
% - oxy_filt [samples by channels]
% - deoxy_filt
% - bl_vol
% - p_oxy
% - all averaged values for oxy, deoxy, bl_vol, 
%   p_oxy for right, left, and rest condtions

function [onset, time, oxy, oxy_filt, deoxy_filt, bl_vol, p_oxy, p_oxy_filt, p_oxy_deriv, rest_oxy_avg, rest_deoxy_avg, rest_bl_vol_avg, rest_p_oxy_avg, left_oxy_avg, left_deoxy_avg, left_bl_vol_avg, left_p_oxy_avg, right_oxy_avg, right_deoxy_avg, right_bl_vol_avg, right_p_oxy_avg] = process(baseline, file, event_samples, rest_samples, fs, fc, ch, left_ch, right_ch)

load(file)

label = {'Rx1-Tx1', 'Rx1-Tx2', 'Rx1-Tx3', 'Rx2-Tx1', 'Rx2-Tx3', 'Rx3-Tx4', 'Rx3-Tx2', 'Rx3-Tx3', 'Rx4-Tx2', 'Rx4-Tx4', 'Rx1-Tx5', 'Rx1-Tx6', 'Rx1-Tx7', 'Rx2-Tx5', 'Rx2-Tx7', 'Rx3-Tx8', 'Rx3-Tx6', 'Rx3-Tx7', 'Rx4-Tx6', 'Rx4-Tx8'};

% Global MI Variables
time = nirs_data.time;

% Local MI Variables
oxy = nirs_data.oxyvals(:,ch);
deoxy = nirs_data.dxyvals(:,ch);
onset = nirs_data.events.onsets; % Relevant Stimulus Onset Indices 

%% Manipulate Corrupted Data
% Noise Corruption Signal Removal
oxy(oxy>10)=10;
oxy(oxy<-10)=-10;
deoxy(deoxy>10)=10;
deoxy(deoxy<-10)=-10;

% Manually filter corrupted or inaccessible channel data for test data
for i=1:length(ch)
    if mean(oxy(:,i))>5 || mean(oxy(:,i))<-5
        oxy(:,i) = oxy(:,i)-mean(oxy(:,i));
        fprintf('For file %s, oxy data for channel %.f has been manually corrected \n',file, i)
    end
    if mean(deoxy(:,i))>5 || mean(deoxy(:,i))<-5
        deoxy(:,i) = deoxy(:,i)-mean(deoxy(:,i));
        fprintf('For %s, deoxy data for channel %.f has been manually corrected \n',file, i)
    end
end

%% Apply Signal Processing
% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.
% All frequency values are in Hz.
N  = 10;  % Order
% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass('N,F3dB', N, fc, fs);
Hd = design(h, 'butter');

for i = 1:length(ch)
    oxy_filt(:,i) = filter(Hd, oxy(:,i));
    deoxy_filt(:,i) = filter(Hd, deoxy(:,i));
end

%% Calculated Variables

% bl_vol = abs(deoxy_filt)+abs(oxy_filt);
bl_vol = deoxy_filt+oxy_filt;
p_oxy = 100*((oxy_filt)./(bl_vol)); %100*((oxy_filt+baseline)./(bl_vol+baseline)); 

%% Oxygen Percentage Processing

window = fs*3;
p_oxy_filt = p_oxy;
for i=1:length(ch)
    for j=1:length(p_oxy_filt(:,i))-window
        local_epoch = p_oxy_filt(j:j+window,i);
        local_variance = max(local_epoch)-min(local_epoch);
        if local_variance > 30
            p_oxy_filt(j:j+window,i)= NaN;
        end
    end
    p_oxy_deriv(:,i) = diff(p_oxy_filt(:,i))./diff(time);
end

p_oxy_filt(p_oxy_filt>100)=100; 
p_oxy_filt(p_oxy_filt<0)=0; 


%% Manually edit data if need be
% counteract software problems when 
% converting from the oxymon system to a MATLAB data structure

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

%% Epochs 
% Set the epochs for the window (event_samples) length of the relevant
% location (starting at the onset)

% Redefine each measured variable by relevant channels and updated
% structure size
% here i is equivalent to number of event trials (onset{1,1})
for i = 1:length(left_trials)-1
    left_start = onset{1,1}(i);
    left_finish = left_start+(event_samples-1);
    
    if left_finish > length(time)
        display('window goes past experiment')
        break 
    end
    left_oxy(:,:,i) = oxy_filt(left_start:left_finish, left_ch);
    left_deoxy(:,:,i) = deoxy_filt(left_start:left_finish, left_ch);
    left_bl_vol(:,:,i) = bl_vol(left_start:left_finish, left_ch);
    left_p_oxy(:,:,i) = p_oxy_filt(left_start:left_finish, left_ch);
end
for i = 1:length(right_trials)
    right_start = onset{1,3}(i);
    right_finish = right_start+(event_samples-1);
    if right_finish > length(time)
        display('window goes past experiment')
        break
    end
    right_oxy(:,:,i) = oxy_filt(right_start:right_finish, right_ch);
    right_deoxy(:,:,i) = deoxy_filt(right_start:right_finish, right_ch);
    right_bl_vol(:,:,i) = bl_vol(right_start:right_finish, right_ch);
    right_p_oxy(:,:,i) = p_oxy_filt(right_start:right_finish, right_ch);
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
    rest_p_oxy(:,:,i) = p_oxy_filt(rest_start:rest_finish, :);
end

% Define averaged epochs
for i = 1:event_samples
    for counter = 1:length(left_ch)
        left_oxy_avg(i, counter) = mean(left_oxy(i, counter, :));
        left_deoxy_avg(i, counter) = mean(left_deoxy(i, counter, :));
        left_bl_vol_avg(i, counter) = mean(left_bl_vol(i, counter, :));
        left_p_oxy_avg(i, counter) = nanmean(left_p_oxy(i, counter, :));
    end
    for counter = 1:length(right_ch)
        right_oxy_avg(i, counter) = mean(right_oxy(i, counter, :));
        right_deoxy_avg(i, counter) = mean(right_deoxy(i, counter, :));
        right_bl_vol_avg(i, counter) = mean(right_bl_vol(i, counter, :));
        right_p_oxy_avg(i, counter) = nanmean(right_p_oxy(i, counter, :));
    end
end

for i = 1:rest_samples
    for counter = 1:length(ch)
        rest_oxy_avg(i, counter) = mean(rest_oxy(i, counter, :));
        rest_deoxy_avg(i, counter) = mean(rest_deoxy(i, counter, :));
        rest_bl_vol_avg(i, counter) = mean(rest_bl_vol(i, counter, :));
        rest_p_oxy_avg(i, counter) = nanmean(rest_p_oxy(i, counter, :));
    end
end

end