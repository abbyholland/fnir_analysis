%% Operating and Participant Comparison Script
% Available Functions!
% process.m:
% - to process individual data sets
% - Filters Data
% - Calculates blood volume and oxgen percentage
% - Averages the results from each stimulus over a given window
% display.m:
% - prints main graphs for an individual dataset 
% compare_state.m:
% - compares the stimulus results across individual datasets (eg rest vs left)
% compare_action.m:
% - compares the results for each stimulus across the different actions (ME vs MI)


% Interesting Things Which Could Be Added:
% - add more filtering into ppg and blood pressure
% - add 60 hz filtering into fnirs data
% - add neural region and neural scattering considerations into the fnirs interpretations
% - ppg analysis for blood volume, blood pressure, oxygen saturation, HRV

clc; clear all; close all; 

%% Global Manual Input Variables

baseline = 10; %set arbitrary initial blood volume level to avoid negative numbers

fnir_fs = 256; % Sample Frequency [Hz]
event_time = 10; % Seconds
rest_time = 10; % Seconds
event_samples = fnir_fs*event_time;
rest_samples = fnir_fs*rest_time;
cali_time = 10000; % Calibration samples for static blood pressure cuff value
fc = 0.2; % Cutoff frequency for butterworth lowpass filter
% Define which channels to focus on
ch = [1:20]; % All Channels
% ch = [1 2 3 4 6 7];
left_ch = [1:10]; % left hemisphere channels
right_ch = [11:20]; % right hemisphere channels

% define subplot dimensions
sp_x = 2; % Subplot x values
sp_y = 5; % Subplot y values


%% BIOPAC Data Processing and Interpreting
% Load Blood Pressure and PPG Data
% test_biopac = load('ppg_test.mat');
test_biopac = 'abby_testtest.mat';
[biopac_time, biopac_fnir_fs, bp, ppg, ppg_filt, deriv1, deriv2, peak_to_peak, heart_rate] = ppg_process(test_biopac, fnir_fs);

%% Required Manual Data about each Participant
% Make an array of each participant's blood pressure
% bl_p_1 = mean(bp(1:cali_time));
% bl_p_2 = mean(bp(1:cali_time));
% bl_p = [bl_p_1, bl_p_2];
bl_p = {'120/80', '110/70'};

%% Load the MI Data and Identify each Relevant Variable
% Motor Imagery Data
test_p1_MI = '20082019MI.mat';
[onset_p1_MI, time_p1_MI, oxy_p1_MI, oxy_filt_p1_MI, deoxy_filt_p1_MI, bl_vol_p1_MI, p_oxy_p1_MI, p_oxy_filt_p1_MI, p_oxy_deriv_p1_MI, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI] = process(baseline, test_p1_MI, event_samples, rest_samples, fnir_fs, fc, ch, left_ch, right_ch);
test_p1_ME = '20082019ME.mat';
[onset_p1_ME, time_p1_ME, oxy_p1_ME, oxy_filt_p1_ME, deoxy_filt_p1_ME, bl_vol_p1_ME, p_oxy_p1_ME, p_oxy_filt_p1_ME, p_oxy_deriv_p1_MI, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME] = process(baseline, test_p1_ME, event_samples, rest_samples, fnir_fs, fc, ch, left_ch, right_ch);

% Motor Execution Data
test_p2_MI = '23082019MI.mat';
[onset_p2_MI, time_p2_MI, oxy_p2_MI, oxy_filt_p2_MI, deoxy_filt_p2_MI, bl_vol_p2_MI, p_oxy_p2_MI, p_oxy_filt_p2_MI, p_oxy_deriv_p1_MI, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI] = process(baseline, test_p2_MI, event_samples, rest_samples, fnir_fs, fc, ch, left_ch, right_ch);
test_p2_ME = '23082019ME.mat';
[onset_p2_ME, time_p2_ME, oxy_p2_ME, oxy_filt_p2_ME, deoxy_filt_p2_ME, bl_vol_p2_ME, p_oxy_p2_ME, p_oxy_filt_p2_ME, p_oxy_deriv_p1_MI, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME] = process(baseline, test_p2_ME, event_samples, rest_samples, fnir_fs, fc, ch, left_ch, right_ch);

%% Total Plots of Potential Points of Interest
displayVals(baseline, time_p1_MI, sp_x, sp_y, oxy_p1_MI, oxy_filt_p1_MI, deoxy_filt_p1_MI, bl_vol_p1_MI, p_oxy_p1_MI, p_oxy_filt_p1_MI, p_oxy_deriv_p1_MI, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI, onset_p1_MI, event_samples, rest_samples, event_time, rest_time, ch, fnir_fs)
% displayVals(baseline, time_p1_ME, sp_x, sp_y, oxy_p1_ME, oxy_filt_p1_ME, deoxy_filt_p1_ME, bl_vol_p1_ME, p_oxy_p1_ME, p_oxy_filt_p1_ME, p_oxy_deriv_p1_MI, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME, onset_p1_ME, event_samples, rest_samples, event_time, rest_time, ch, fnir_fs)
% displayVals(baseline, time_p2_MI, sp_x, sp_y, oxy_p2_MI, oxy_filt_p2_MI, deoxy_filt_p2_MI, bl_vol_p2_MI, p_oxy_p2_MI, p_oxy_filt_p2_MI, p_oxy_deriv_p1_MI, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI, onset_p2_MI, event_samples, rest_samples, event_time, rest_time, ch, fnir_fs)
% displayVals(baseline, time_p2_ME, sp_x, sp_y, oxy_p2_ME, oxy_filt_p2_ME, deoxy_filt_p2_ME, bl_vol_p2_ME, p_oxy_p2_ME, p_oxy_filt_p2_ME, p_oxy_deriv_p1_MI, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME, onset_p2_ME, event_samples, rest_samples, event_time, rest_time, ch, fnir_fs)

%% Check out Resting compared to Active States
compare_state(rest_time, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI, left_ch, right_ch)
% compare_state(rest_samples, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME, left_ch, right_ch)
% compare_state(rest_samples, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI, left_ch, right_ch)
% compare_state(rest_samples, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME, left_ch, right_ch)

%% ME and MI Comparison
compare_action(rest_time, event_time, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME, ch, left_ch, right_ch)
% compare_action(rest_time, event_time, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME, ch, left_ch, right_ch)

%% Static Blood Pressure and Oxygen Percentage Analysis
% Motor Imagery
% bl_vol
y_lim = [-5,5];
y_label = 'MI Blood Volume';
compare_participants(y_lim, y_label, ch, left_ch, right_ch, sp_x, sp_y, rest_time, rest_samples, event_time, event_samples, bl_p, rest_bl_vol_avg_p1_MI, rest_bl_vol_avg_p2_MI, left_bl_vol_avg_p1_MI, left_bl_vol_avg_p2_MI, right_bl_vol_avg_p1_MI, right_bl_vol_avg_p2_MI)

% p_oxy
y_lim = [0,100];
y_label = 'MI Oxygen Percentage';
compare_participants(y_lim, y_label, ch, left_ch, right_ch, sp_x, sp_y, rest_time, rest_samples, event_time, event_samples, bl_p, rest_p_oxy_avg_p1_MI, rest_p_oxy_avg_p2_MI, left_p_oxy_avg_p1_MI, left_p_oxy_avg_p2_MI, right_p_oxy_avg_p1_MI, right_p_oxy_avg_p2_MI)

% % Motor Execution
% bl_vol
% y_lim = [-5,5];
% compare_participants(y_lim, ch, left_ch, right_ch, sp_x, sp_y, rest_time, rest_samples, event_time, event_samples, bl_p, rest_bl_vol_avg_p1_ME, rest_bl_vol_avg_p2_ME, left_bl_vol_avg_p1_ME, left_bl_vol_avg_p2_ME, right_bl_vol_avg_p1_ME, right_bl_vol_avg_p2_ME)

% p_oxy
% y_lim = [-100,100];
% compare_participants(ch, left_ch, right_ch, sp_x, sp_y, rest_time, rest_samples, event_time, event_samples, bl_p, rest_p_oxy_avg_p1_ME, rest_p_oxy_avg_p2_ME, left_p_oxy_avg_p1_ME, left_p_oxy_avg_p2_ME, right_p_oxy_avg_p1_ME, right_p_oxy_avg_p2_ME)

%% Continuous Blood Pressure and Oxygen Percentage Analysis

% average averaged channels to see if there is an overall trend which can
% be compared to the trend of the changing blood pressure and velocity over
% time
% Averages each sample value across all channels to get an approximate
% overall trend
for i=1:length(rest_oxy_avg_p1_MI)
    trend_rest_p_oxy_avg_p1_MI(i) = mean(rest_p_oxy_avg_p1_MI(i,:));
end

for i=1:length(right_oxy_avg_p1_MI)
    trend_right_p_oxy_avg_p1_MI(i) = mean(right_p_oxy_avg_p1_MI(i,:));
end

for i=1:length(left_oxy_avg_p1_MI)
    trend_left_p_oxy_avg_p1_MI(i) = mean(left_p_oxy_avg_p1_MI(i,:));
end

% both blood pressure as a function of time and oxy_p as a function of time
figure()
plot(linspace(0, rest_time, rest_samples), trend_rest_p_oxy_avg_p1_MI-trend_rest_p_oxy_avg_p1_MI(1))
hold on
plot(linspace(0, event_time, event_samples), trend_right_p_oxy_avg_p1_MI-trend_right_p_oxy_avg_p1_MI(1))
plot(linspace(0, event_time, event_samples), trend_left_p_oxy_avg_p1_MI-trend_left_p_oxy_avg_p1_MI(1))
plot(biopac_time,bp-bp(1))
legend('Rest', 'Right', 'Left', 'Blood Pressure')
xlabel('Time (seconds)')
title('Blood Pressure and Oxygen Percentage Trend Analysis')

% both blood velocity and oxy_p as a function of time






