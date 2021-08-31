for ai=1:2
    for aj=1:5
        I = (ai-1)*5+aj;
        lr = 0.1-(I-1)*0.01;
        subplot(2,5,I);
        hold on
        T1 = TT((30000*(I-1)+1):(30000*I), 4);
        derivitive_cal;
        plot_inside_outside_comparison
        title(["learning rate: ", lr])
    end
end