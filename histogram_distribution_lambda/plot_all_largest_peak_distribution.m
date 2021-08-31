peak_entropies = [];
figure;
for ai=1:2
    for aj=1:5
        I = (ai-1)*5+aj;
        lr = 0.1-(I-1)*0.01;
        T1 = TT((30000*(I-1)+1):(30000*I), 4);
        largest_peak = [];
        cal_largest_peak_distribution;
%         scatter([lr], largest_peak);
        scatter([lr], largest_peak, 1, 'k')
        hold on
        peak_entropies(I) = peak_entropy;
        
    end
end

% saveas(gcf, append("largest_peak_", string(datetime),".png"));

figure;
plot(peak_entropies);
