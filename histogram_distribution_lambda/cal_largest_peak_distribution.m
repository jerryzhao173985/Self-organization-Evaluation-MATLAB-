largest_peak = [];
peak_entropy = 0;
% for i=1:30
%     peak = PEAKS{i};
%     largest_peak(i) = max(peak);
% end
% plot(ratios)

N_BINS = 1000;

counter1 = 0;
for i=1:0.01:30
    counter1 = counter1+1;
    arr = T1( ((i-1)*1000+1) : (i*1000) );
    data = arr;
    data = (data-min(data))./ (max(data)-min(data));
%     figure; 
%     dis = histfit(data,100,'kernel'); 
%     figure;
%     dis1 = histogram(data, N_BINS);
    hist_values = histcounts(data, N_BINS);
    [max1, ind1] = max(hist_values);
    %restore the data!
    original_value = (ind1/N_BINS) * (max(arr)-min(arr)) + min(arr);
    largest_peak(counter1) = original_value;
%     close
    
end

peak_entropy = Entropy_Array(largest_peak)
% scatter([1], largest_peak)