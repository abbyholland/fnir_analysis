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

clc; clear all; close all; clf;

%% Global Manual Input Variables
fs = 256; % Sample Frequency [Hz]
event_time = 10; % Seconds
rest_time = 10; % Seconds
event_samples = fs*event_time;
rest_samples = fs*rest_time;
fc = 0.2; % Cutoff frequency for butterworth lowpass filter

%% Required Manual Data about each Participant
% Make an array of each participant's blood pressure
bl_p = {'120/80', '120/70'};

%% 
% Load Blood Pressure and PPG Data
% test_biopac = load('ppg_test.mat');
test_biopac = load('abby_testtest.mat');
time = linspace(0,length(test_biopac.data)*test_biopac.isi/1000, length(test_biopac.data)); %ms
ppg = test_biopac.data(:,1);
bp = test_biopac.data(:,2);

figure()
subplot(1,2,1)
plot(linspace(0,length(bp),length(bp)),bp)
title('Blood Pressure over Time')
subplot(1,2,2)
plot(linspace(0,length(ppg),length(ppg)),ppg)
title('PPG Signal over Time')

%% Load the MI Data and Identify each Relevant Variable
% Motor Imagery Data
test_p1_MI = '20082019MI.mat';
[onset_p1_MI, time_p1_MI, oxy_p1_MI, oxy_filt_p1_MI, deoxy_filt_p1_MI, bl_vol_p1_MI, p_oxy_p1_MI, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI] = process(test_p1_MI, event_samples, rest_samples, fs, fc);
test_p2_MI = '23082019MI.mat';
[onset_p2_MI, time_p2_MI, oxy_p2_MI, oxy_filt_p2_MI, deoxy_filt_p2_MI, bl_vol_p2_MI, p_oxy_p2_MI, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI] = process(test_p2_MI, event_samples, rest_samples, fs, fc);

% Motor Execution Data
test_p1_ME = '20082019ME.mat';
[onset_p1_ME, time_p1_ME, oxy_p1_ME, oxy_filt_p1_ME, deoxy_filt_p1_ME, bl_vol_p1_ME, p_oxy_p1_ME, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME] = process(test_p1_ME, event_samples, rest_samples, fs, fc);
test_p2_ME = '23082019ME.mat';
[onset_p2_ME, time_p2_ME, oxy_p2_ME, oxy_filt_p2_ME, deoxy_filt_p2_ME, bl_vol_p2_ME, p_oxy_p2_ME, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME] = process(test_p2_ME, event_samples, rest_samples, fs, fc);

%% Total Plots of Potential Points of Interest
displayVals(time_p1_MI, oxy_p1_MI, oxy_filt_p1_MI, deoxy_filt_p1_MI, bl_vol_p1_MI, p_oxy_p1_MI, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI, onset_p1_MI, event_samples, rest_samples)
displayVals(time_p1_ME, oxy_p1_ME, oxy_filt_p1_ME, deoxy_filt_p1_ME, bl_vol_p1_ME, p_oxy_p1_ME, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME, onset_p1_ME, event_samples, rest_samples)
displayVals(time_p2_MI, oxy_p2_MI, oxy_filt_p2_MI, deoxy_filt_p2_MI, bl_vol_p2_MI, p_oxy_p2_MI, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI, onset_p2_MI, event_samples, rest_samples)
displayVals(time_p2_ME, oxy_p2_ME, oxy_filt_p2_ME, deoxy_filt_p2_ME, bl_vol_p2_ME, p_oxy_p2_ME, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME, onset_p2_ME, event_samples, rest_samples)

%% Check out Resting compared to Active States
compare_state(rest_samples, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI)
compare_state(rest_samples, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME)
compare_state(rest_samples, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI)
compare_state(rest_samples, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME)

%% ME and MI Comparison
compare_action(rest_samples, event_samples, rest_oxy_avg_p1_MI, rest_deoxy_avg_p1_MI, rest_bl_vol_avg_p1_MI, rest_p_oxy_avg_p1_MI, left_oxy_avg_p1_MI, left_deoxy_avg_p1_MI, left_bl_vol_avg_p1_MI, left_p_oxy_avg_p1_MI, right_oxy_avg_p1_MI, right_deoxy_avg_p1_MI, right_bl_vol_avg_p1_MI, right_p_oxy_avg_p1_MI, rest_oxy_avg_p1_ME, rest_deoxy_avg_p1_ME, rest_bl_vol_avg_p1_ME, rest_p_oxy_avg_p1_ME, left_oxy_avg_p1_ME, left_deoxy_avg_p1_ME, left_bl_vol_avg_p1_ME, left_p_oxy_avg_p1_ME, right_oxy_avg_p1_ME, right_deoxy_avg_p1_ME, right_bl_vol_avg_p1_ME, right_p_oxy_avg_p1_ME)
compare_action(rest_samples, event_samples, rest_oxy_avg_p2_MI, rest_deoxy_avg_p2_MI, rest_bl_vol_avg_p2_MI, rest_p_oxy_avg_p2_MI, left_oxy_avg_p2_MI, left_deoxy_avg_p2_MI, left_bl_vol_avg_p2_MI, left_p_oxy_avg_p2_MI, right_oxy_avg_p2_MI, right_deoxy_avg_p2_MI, right_bl_vol_avg_p2_MI, right_p_oxy_avg_p2_MI, rest_oxy_avg_p2_ME, rest_deoxy_avg_p2_ME, rest_bl_vol_avg_p2_ME, rest_p_oxy_avg_p2_ME, left_oxy_avg_p2_ME, left_deoxy_avg_p2_ME, left_bl_vol_avg_p2_ME, left_p_oxy_avg_p2_ME, right_oxy_avg_p2_ME, right_deoxy_avg_p2_ME, right_bl_vol_avg_p2_ME, right_p_oxy_avg_p2_ME)

%% Blood Pressure and Oxygen Percentage Analysis

% Motor Imagery Trials
% Rest
figure()
for i=1:20 % number of channels; use this to define which channels to print
    subplot(5,4,i)
    plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg_p1_MI(:,i)) %define certain channels or average across?
    hold on
    plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg_p2_MI(:,i)) %define certain channels or average across?
    legend(bl_p)
    ylim([-1000,1000])
end

% Left
figure()
for i=1:20 % number of channels; use this to define which channels to print
    subplot(5,4,i)
    plot(linspace(0, event_samples, event_samples), left_p_oxy_avg_p1_MI(:,i)) %define certain channels or average across?
    hold on
    plot(linspace(0, event_samples, event_samples), left_p_oxy_avg_p2_MI(:,i)) %define certain channels or average across?
    legend(bl_p)
    ylim([-1000,1000])
end

% Right
figure()
for i=1:20 % number of channels; use this to define which channels to print
    subplot(5,4,i)
    plot(linspace(0, event_samples, event_samples), right_p_oxy_avg_p1_MI(:,i)) %define certain channels or average across?
    hold on
    plot(linspace(0, event_samples, event_samples), right_p_oxy_avg_p2_MI(:,i)) %define certain channels or average across?
    legend(bl_p)
    ylim([-1000,1000])
end

% Motor Execution Trials
% Rest
figure()
for i=1:20 % number of channels; use this to define which channels to print
    subplot(5,4,i)
    plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg_p1_ME(:,i)) %define certain channels or average across?
    hold on
    plot(linspace(0, rest_samples, rest_samples), rest_p_oxy_avg_p2_ME(:,i)) %define certain channels or average across?
    legend(bl_p)
    ylim([-1000,1000])
end

% Left
figure()
for i=1:20 % number of channels; use this to define which channels to print
    subplot(5,4,i)
    plot(linspace(0, event_samples, event_samples), left_p_oxy_avg_p1_ME(:,i)) %define certain channels or average across?
    hold on
    plot(linspace(0, event_samples, event_samples), left_p_oxy_avg_p2_ME(:,i)) %define certain channels or average across?
    legend(bl_p)
    ylim([-1000,1000])
end

% Right
figure()
for i=1:20 % number of channels; use this to define which channels to print
    subplot(5,4,i)
    plot(linspace(0, event_samples, event_samples), right_p_oxy_avg_p1_ME(:,i)) %define certain channels or average across?
    hold on
    plot(linspace(0, event_samples, event_samples), right_p_oxy_avg_p2_ME(:,i)) %define certain channels or average across?
    legend(bl_p)
    ylim([-1000,1000])
end





