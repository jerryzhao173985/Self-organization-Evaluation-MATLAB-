% Documentation: https://uk.mathworks.com/help/matlab/ref/fft.html
function func_fft(T1, sampling_frequency, length_of_signal)

    %TT = readmatrix(filename);
    %T1 = TT(1:30000, sensor_number+1);
    
    ALL_SAMPLE = 6000
    
    S = T1((ALL_SAMPLE-length_of_signal+1):ALL_SAMPLE,1); % Also work: S = T1(27501:30000);
    Y = fft(S);

    Fs = sampling_frequency;            % Sampling frequency
    T = 1/Fs;             % Sampling period
    L = length_of_signal;             % Length of signal
    t = (0:L-1)*T;        % Time vector

    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
   
    f = Fs*(0:(L/2))/L;
    plot(f,P1, '-b')
    
    hold on;
    [pks, locs] = findpeaks(P1(10:L/2+1), (10:L/2+1), 'MinPeakProminence',0.1);
    %findpeaks(P1(2:L/2+1), (2:L/2+1), 'MinPeakProminence',0.1);
    %'MinPeakDistance',1000, 'MinPeakProminence',0.1);
    plot(f(locs), pks, 'or')
    transpose(f(locs))
    %max(P1(10:L/2+1))
    %transpose(pks)
    
    title('Single-Sided Amplitude Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')

end