% Notice for the following :
% size(T1) =  30000    1
% T1 = TT(1:30000,3);
function derivitive_cal_plot(T1, index)
    for i = index:0.1:( (index+1)-0.1 )
        arr = T1( ((i-1)*1000+1) : (i*1000) );
        data = arr;
        data = (data-min(data))./ (max(data)-min(data));
        figure; 
        dis = histfit(data,100,'kernel'); 
        % saveas(gcf, append(int2str(i), '.pdf'))
        
        %aa=sprintf('%.3f',i);
        %file_peak = append('fig/peak-',aa, '.png');
        %saveas(gcf, file_peak);
        

        X = get(dis(2),'XData');
        Y = get(dis(2),'YData');
        % close  % disable plot

        figure
        plot(X, Y)
        [pks, locs]= findpeaks(Y, X);
        hold on
        xline(locs,'--r',{'P E A K'});
        
        a=sprintf('%.3f',i);
        file_dis = append('fig/dis-',a, '.png');
        saveas(gcf, file_dis);
        locs
    %     locs   % the value of the peak which the first derivitive is 0
                 % and the second derivitive of which must be negative!


        y1=diff(Y)./diff(X);
    %     d2ydx2 = diff(Y,2)./diff(X,2);
        d2ydx2 = diff(diff(Y)./diff(X))./diff(X(2:length(X)));
        
        first_derivitive = [];
        second_derivitive = [];

        for k=1:numel(locs)
            value = locs(k);    
            idx = (X == value);
            first_derivitive(k) = y1(idx);
            second_derivitive(k) = d2ydx2(idx);
        end

        first_derivitive
        second_derivitive


        figure
        plot(y1)
        figure
        plot(d2ydx2)
        
        close all;


    end
    