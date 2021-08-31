% AMP = load('AMP.mat')
% FREQ = load('FREQ.mat')
% FREQ = struct2array(FREQ);
% AMP = struct2array(AMP);
START_IND = 5
END_IND = 20
INTERVAL =  END_IND - START_IND +1;

FREQ_10 = FREQ(:, START_IND:END_IND, :);
x = (START_IND:END_IND) *0.01;
x = 1./x;

for i =1:2
    for j=1:5
        I = (i-1)*5 + j;
        subplot(2,5,I);
        plot(x, reshape(FREQ_10(I,:,1), [1 INTERVAL]))
        
        hold on 
        plot(flip(x),flip(x), 'r')
%         xlim([2 20])
%         ylim([2 20])
        
        title("input-output frequency")
        xlabel("Input frequency (s^{-1})")
        ylabel("Output frequency (s^{-1})")
    end
end