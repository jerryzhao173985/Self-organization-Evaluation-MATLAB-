TT = readmatrix('data/seed105/layer1.txt');

ALL_SAMPLE = 6000
Length_of_signal = 2500

T1 = TT(1:ALL_SAMPLE,2);
S = T1( (ALL_SAMPLE-Length_of_signal+1):ALL_SAMPLE,1); % Also work: S = T1(27501:30000);
Y = fft(S);

Fs = 100;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = Length_of_signal;             % Length of signal
t = (0:L-1)*T;        % Time vector

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
plot(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')