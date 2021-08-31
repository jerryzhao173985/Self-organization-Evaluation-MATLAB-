
all_freq = [];
all_amp = [];


for i=1:100
    for sensor_num=1:18
        [freq, amp] = cal_max(datapath, 100, 1000, i, sensor_num);
        all_freq(i,sensor_num) = freq;
        all_amp(i,sensor_num) = amp;
    end
    
%     if length(freq)>1
%         [freq, ind] = max(freq)
%         amp = amp(ind)
%     end

end

% figure
% plot(all_freq)
% title('Frequency change')
% xlabel('trail number')
% ylabel('f (Hz)')
% 
% figure
% plot(all_amp)
% title('Amplitude Trend')
% xlabel('trail number')
% ylabel('Amp')
% 
% all_freq
% all_amp
        