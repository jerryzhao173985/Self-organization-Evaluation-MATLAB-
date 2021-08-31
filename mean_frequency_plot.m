% clc;clear all;close all

FREQ = []
AMP = []

% fn = getfn(pwd, 'layer1.txt$')
fn = getfn(pwd, 'layer1_extract.txt$')
% fn = fn(41:50)
% number_of_lists = length(fn)

for k=1:length(fn)
    disp("Now processing --------> "+fn{k})
    datapath = fn{k};
    max_frequency_plot;
%     frequency_lambda_plot;
%     if length(all_freq)~= 10
%         max_frequency_plot;
%     end
    AMP(k,:, :) = all_amp;
    FREQ(k,:, :) = all_freq;
    
end

MEAN_FREQ = [];
MEAN_AMP = [];
STD_FREQ = [];
STD_AMP = [];

size_FREQ = size(FREQ);
for sensor_id=1:18
   FREQ_sensor = reshape(FREQ(sensor_id,:,:), [size_FREQ(2), size_FREQ(3)]);
   MEAN_FREQ(sensor_id,:) = mean(FREQ_sensor)
   STD_FREQ(sensor_id,:) = mean(FREQ_sensor)
   
   AMP_sensor = reshape(AMP(sensor_id,:,:), [size_FREQ(2), size_FREQ(3)]);
   MEAN_AMP(sensor_id,:) = mean(AMP_sensor)
   STD_AMP(sensor_id,:) = mean(AMP_sensor)
end
% 
% MEAN_FREQ = mean(FREQ)
% MEAN_AMP = mean(AMP)
% STD_FREQ = std(FREQ)
% STD_AMP = std(AMP)

figure
% plot(smooth(MEAN_FREQ))
plot(MEAN_FREQ')
title('Frequency change')
xlabel('trail number')
ylabel('f (Hz)')

figure
% plot(smooth(MEAN_AMP))
plot(MEAN_AMP')
title('Amplitude Trend')
xlabel('trail number')
ylabel('Amp')

mean_errorbar_frequency_plot;