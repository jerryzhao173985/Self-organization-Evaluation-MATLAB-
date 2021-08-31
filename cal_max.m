% Documentation: https://uk.mathworks.com/help/matlab/ref/fft.html
function [freq, amp] = cal_max(filename, sampling_frequency, length_of_signal, trail_number, sensor_number)

    TT = readmatrix(filename);
    
    ALL_SAMPLE = 1000
%     ALL_SAMPLE = 30000
    
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
   
%     f = Fs*(0:(L/2))/L;
    
    
    % Average over the frequency vector based on the average every n values
    n = 2;
    P1 = arrayfun(@(i) mean(P1(i:i+n-1)),1:n:length(P1)-n+1)'; % the averaged vector
    
    f = Fs*(0:(length(P1)-1))/L *2;
    
    
    
    %plot(f,P1, '-b')
    

%     START_POINT = 100;
%     END_POINT = 300;
%     L/2+1 == 1251
    
%     range =START_POINT:END_POINT;
%     A = P1(range);     
%     [value index]=max(A);
%     org_index= range(index);
    
    
    %hold on;
%     [pks, locs] = findpeaks(P1(100:L/2+1), (100:L/2+1), 'MinPeakDistance',1000, 'MinPeakProminence',0.05);
%     P1(100:L/2+1)
    
%     [pks, locs] =  max(A);
%     [pks, locs] = findpeaks(P1(10:L/2+1), (10:L/2+1), 'MinPeakProminence',0.05);
    [pks, locs] = findpeaks(P1(2:200), (2:200), 'MinPeakProminence',0.20);
    if isempty(pks)
        [pks, locs] = findpeaks(P1(2:200), (2:200), 'MinPeakProminence',0.15);
    end
    if isempty(pks)
        [pks, locs] = findpeaks(P1(2:200), (2:200), 'MinPeakProminence',0.10);
    end
    if isempty(pks)
        [pks, locs] = findpeaks(P1(2:200), (2:200), 'MinPeakProminence',0.05);
    end

%max( P1(STARTING_POINT:L/2+1) );

    %findpeaks(P1(2:L/2+1), (2:L/2+1), 'MinPeakProminence',0.1);
    %'MinPeakDistance',1000, 'MinPeakProminence',0.1);
    
%     locs= range(locs);
%     locs = locs + STARTING_POINT;
    
    freq = f(locs)
    amp = pks
    
    freq = sum(freq)/length(freq);
    amp = sum(amp)/length(amp);
    
    %transpose(pks)
    
    
    
    

end