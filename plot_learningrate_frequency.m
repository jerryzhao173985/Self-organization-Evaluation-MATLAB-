TT = readmatrix("layer1.txt");

for i=1:2
    for j=1:5
        I = ((i-1)*5+(j-1)+1);
        T1 = TT((30000*(I-1)+1):(30000*I), 4);
        subplot(2,5,I)
        func_fft(T1, 100, 2500);
        ylim([0, 0.5])
    end
end

% T1 = TT(1:30000, sensor_number+1);