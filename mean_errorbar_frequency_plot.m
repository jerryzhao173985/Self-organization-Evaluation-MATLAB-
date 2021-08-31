fh1 = figure();
plot(MEAN_FREQ)
title('Mean Frequency change')
xlabel('trail number')
ylabel('f (Hz)')

x = linspace(1,100,100);
% x = linspace(1,10,10);
e = errorbar(x,MEAN_FREQ,STD_FREQ,'-s','MarkerSize',10,...
    'MarkerEdgeColor','red','MarkerFaceColor','red');
% Use e to access properties of the errorbar object after it is created.
% e.Marker = '*';
% e.MarkerSize = 10;
% e.Color = 'red';
% e.CapSize = 15;


fh2 = figure();
plot(FREQ');
hold on
plot(MEAN_FREQ,"r",'LineWidth',5, 'Marker', '*', 'MarkerSize', 10)



% figure
% e2 = errorbar(x,mean(AMP), std(AMP),'-s','MarkerSize',10,...
%     'MarkerEdgeColor','red','MarkerFaceColor','red');
% title("Mean Amplitude of peak frequency")

% Later if you want to change from figure2 to figure1:
% figure(fh1)