% Documentation: https://uk.mathworks.com/help/matlab/ref/fft.html
function [freq, amp] = cal_fft(filename, sampling_frequency, length_of_signal, trail_number, sensor_number)

    TT = readmatrix(filename);
    
    ALL_SAMPLE = 30000
    
    % T1 = TT(1:30000, sensor_number+1);
    T1 = TT(((trail_number-1)*ALL_SAMPLE+1):ALL_SAMPLE*trail_number, sensor_number+1);
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
    %plot(f,P1, '-b')
    
    %hold on;
    [pks, locs] = findpeaks(P1(100:L/2+1), (100:L/2+1), 'MinPeakDistance',1000, 'MinPeakProminence',0.05);
    %findpeaks(P1(2:L/2+1), (2:L/2+1), 'MinPeakProminence',0.1);
    %'MinPeakDistance',1000, 'MinPeakProminence',0.1);
    
    freq = f(locs)
    amp = pks
    %transpose(pks)
    
    
    
    

end