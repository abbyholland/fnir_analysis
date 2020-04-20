%% PPG Processing Script
% Functions:
% - Filters Data
% - Calculates 1st and 2nd Derivatives
% - Determines heart rate and peak to peak values
% 
% Inputs:
% - relevant data structure (.mat file)
% 
% Outputs:
% - time
% - ppg_filt [samples by channels]
% - peak_to_peak
% - heart_rate
% - 1_deriv, 2_deriv

function [time, fs, bp, ppg, ppg_filt, deriv1, deriv2, peak_to_peak, heart_rate] = ppg_process(file, fnir_fs)
%%
test_biopac = load(file);
% clear all
time = (linspace(0,length(test_biopac.data)*test_biopac.isi/1000, length(test_biopac.data)))'; %ms
ppg = test_biopac.data(:,1);
bp = test_biopac.data(:,2);
fs = int64(length(ppg)/time(end));

figure()
% subplot(1,2,1)
plot(time, bp)
title('Blood Pressure over Time')
xlabel('Time')
ylabel('Blood Pressure')
% subplot(1,2,2)
figure()
plot(time,ppg)
title('PPG Signal over Time')
xlabel('Time')
ylabel('PPG Signal')


%% Downsample to 256 Hz
% time = (linspace(0,length(test_biopac.data)*test_biopac.isi/1000, length(test_biopac.data)))'; %ms
% ppg = test_biopac.data(:,1);
% bp = test_biopac.data(:,2);
% fs = int64(length(ppg)/time(end));
% 
% ds_factor = fs/fnir_fs;
% 
% time = downsample(time,ds_factor)
% ppg = downsample(ppg,ds_factor)
% bp = downsample(bp,ds_factor)
% fs = int64(length(ppg)/time(end))

%% Apply Signal Processing
% Butterworth 59-61 notch filter designed using FDESIGN.LOWPASS.
% All frequency values are in Hz.
notch = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',59,'HalfPowerFrequency2',61, ...
               'DesignMethod','butter','SampleRate',fs);

ppg_filt = filter(notch, ppg);
figure()
subplot(1,2,1)
plot(time,ppg)
title('Unfiltered Data')
subplot(1,2,2)
plot(time,ppg_filt)
title('Filtered Data')


% PSD Check for PPG Data Filtering
figure()
subplot(1,2,1)
periodogram(ppg)
title('Unfiltered PPG Data Periodogram')
subplot(1,2,2)
periodogram(ppg_filt)
title('Filtered PPG Data Periodogram')

%% Calculate and Display Derivatives
% % 1st derivative
% diff(time)
% diff(ppg_filt)
% diff(ppg_filt)./diff(time)
% disp(time)
deriv1 = diff(ppg_filt)./diff(time);
figure()
plot(time(1:end-1),deriv1)
title('PPG First Derivative')
xlabel('Time')
ylabel('Filtered PPG Derivative')
% 
% % 2nd derivative
deriv2 = diff(ppg_filt,2)./diff(time,2);
figure()
plot(time(1:end-2),deriv2)
title('PPG Second Derivative')
xlabel('Time')
ylabel('Filtered 2nd PPG Derivative')
ylim([-1000 1000])

%% Beat count for heart rate
% Heart Rate Calculation created by Thinh Nguyen in April 2015, reachable
% at mecheng.hn@gmail.com

window = fs/4; % quarter second, in samples

% Moving average filter for window size
for i=1:(length(ppg_filt)-window)
    local_sum=0;
    for j=1:window
        local_sum=local_sum+ppg_filt(i+j);
    end
        y(i)=local_sum/window;
end

figure()
plot(time(1:length(y)),y)
ylim([-0.05 0.05])
title('Moving Average Filter Results')

% Find peaks
leap=0;
peak_i=1;
disp(length(y)-fs)
while leap<=(length(y)-fs)
    for i=1:fs
        yy(i) = y(i+leap);
    end

    local_i_max = 1;
    local_max = yy(local_i_max);
%     local_max = min(yy);
    for i=2:fs
        if local_max<yy(i)
            local_i_max = i;
            local_max = yy(i);
        end
    end

    peak(peak_i)=leap+local_i_max;
    peak_i=peak_i+1;
    leap =leap + window;
end

beat = 0;
beat_i = 1;
for i=1:length(peak)-1
    if peak(i)<(peak(i+1)-10)    
        beat=beat+(fs/(peak(i+1)-peak(i)))*60;
        beat_i=beat_i+1;
    end
end

if beat_i>1
    heart_rate=beat/(beat_i-1);
end
size(peak)
figure()
plot(time, ppg_filt)
hold on 
vline(time(peak))
title('Identified Local Peaks')
xlabel('Time')
ylabel('PPG Signal')

peak_to_peak = diff(peak);

end