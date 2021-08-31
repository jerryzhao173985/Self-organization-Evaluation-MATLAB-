for i=1:2
    for j=1:5
        subplot(2,5,((i-1)*5+(j-1)+1))
        func_fft('layer1.txt', 100, 2500, ((i-1)*5+(j-1)+1))
        ylim([0, 0.3])
    end
end