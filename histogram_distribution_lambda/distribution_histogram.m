data = T1;
data = (data-min(data))./ (max(data)-min(data));

% histfit(T1)
dis = histfit(data,100,'kernel');
% set(dis(1),'facecolor',[.8 .8 1]);
% set(dis(2), 'color' ,'b');

X = get(dis(2),'XData');
Y = get(dis(2),'YData');

figure
%plot(X, Y)
findpeaks(Y, X)
xlim([0 1])
ylim([0 inf])
% findpeaks(Y)