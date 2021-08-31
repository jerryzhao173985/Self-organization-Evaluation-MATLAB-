
all_freq = [];
all_amp = [];

for i=1:10
    
    [freq, amp] = cal_fft(datapath, 100, 2500, i, 1);
    if isempty(freq)
        break
    end
    if length(freq)>1
        [freq, ind] = max(freq)
        amp = amp(ind)
    end
    
    all_freq(i) = freq;
    all_amp(i) = amp;

end

figure
plot(all_freq)
title('Frequency change')
xlabel('trail number')
ylabel('f (Hz)')

figure
plot(all_amp)
title('Amplitude Trend')
xlabel('trail number')
ylabel('Amp')

all_freq
all_amp
        