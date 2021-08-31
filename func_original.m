function func_original(filename, sampling_frequency, length_of_signal, trail,  sensor_number)
    
    ALL_SAMPLE = 6000;
    
    TT = readmatrix(filename);
    
    T1 = TT(((trail-1)*ALL_SAMPLE+1):ALL_SAMPLE*trail, sensor_number+1);
%     T1 = TT(1:ALL_SAMPLE, sensor_number+1);
    S = T1((ALL_SAMPLE-length_of_signal+1):ALL_SAMPLE,1); % Also work: S = T1(27501:30000);
    
    Fs = sampling_frequency;            % Sampling frequency
    T = 1/Fs;             % Sampling period
    L = length_of_signal;             % Length of signal
    t = (0:L-1)*T;        % Time vector
    
    plot(100*t(1:100),S(1:100))
    title('Original Signal')
    xlabel('0.01s/ frame')
    ylabel('X(t)')

end