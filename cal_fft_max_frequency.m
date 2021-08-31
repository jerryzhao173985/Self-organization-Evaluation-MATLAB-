freqs = [];
amps = [];
for trail=1:10
    [freq, amp]  = cal_fft("layer1.txt", 100, 2500, trail, 3);
    freqs(trail) = freq;
    amps(trail) = amp;
end

figure 
plot(freqs)

figure 
plot(amps)