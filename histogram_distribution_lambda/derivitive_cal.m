% Notice for the following :
% size(T1) =  30000    1
%T1 = TT(1:30000,3);
INSIDE_SUMS = cell(1,30);
OUTSIDE_SUMS = cell(1,30);

INT_LOCS = cell(1,30);
LOCS = cell(1,30);
PEAKS = cell(1,30);     %% denotes (relative) values for the peaks! which devided by Max(Y).
Y1 = cell(1,30);
Y2 = cell(1,30);
INT = 1:100;

for i=1:30
    arr = T1( ((i-1)*1000+1) : (i*1000) );
    data = arr;
    data = (data-min(data))./ (max(data)-min(data));
    figure; 
    dis = histfit(data,100,'kernel'); 
    % saveas(gcf, append(int2str(i), '.pdf'))
    
    % Get The Histogram data from the first graphic plot
    X_his = get(dis(1),'XData');
    Y_his = get(dis(1),'YData');
    
    X = get(dis(2),'XData');
    Y = get(dis(2),'YData');
    close  % disable plot
    
%     figure
%     plot(X, Y)
    [pks, locs]= findpeaks(Y, X);
%     locs   % the value of the peak which the first derivitive is 0
             % and the second derivitive of which must be negative!
%      max(Y)
    

    y1=diff(Y)./diff(X);
%     d2ydx2 = diff(Y,2)./diff(X,2);
    d2ydx2 = diff(diff(Y)./diff(X))./diff(X(2:length(X)));
    
    first_derivitive = [];  % This is useful! Because otherwise the number 
    second_derivitive = [];  % will always have 3 entries, keep the previous ones!
    LOC = [];
    PEAK = [];
    INT_LOC = [];
    
    %%define a counter
    cnt = 1;
    for k=1:numel(locs)
        
        LOC_state = locs(k);    
        LOC_VALUE = pks(k)/max(Y);
        
        if (LOC_VALUE >=0.25) %second peak should be at least a quarter of the highest peak
            idx = (X == LOC_state);
            first_derivitive(cnt) = y1(idx);   % first_derivitive(k) = y1(idx);
            second_derivitive(cnt) = d2ydx2(idx);
            
            
            INT_LOC(cnt) = INT(idx);
            LOC(cnt) = LOC_state;
            PEAK(cnt) = LOC_VALUE;
            cnt = cnt+1;
        end
        
    end
    
    % store all the current location value, first & second derivitives
    INT_LOCS(i) = {INT_LOC};
    LOCS(i) = {LOC};
    PEAKS(i) = {PEAK};
    Y1(i) = {first_derivitive};
    Y2(i) = {second_derivitive};
    
    if(length(second_derivitive)~=sum(second_derivitive<0))
        fprintf("Found a strange positive second derivitive at iter %d!\n", i);
    end 

%     
%     figure
%     plot(y1)
%     figure
%     plot(d2ydx2)
%     
%     

    % Calculate the inside and outside areas:
    INSIDE_SUM = sum(Y_his(INT_LOC(1):INT_LOC(end)));
    OUTSIDE_SUM = sum(Y_his) - INSIDE_SUM;
    
    INSIDE_SUMS(i) = {INSIDE_SUM};
    OUTSIDE_SUMS(i) = {OUTSIDE_SUM};
    
end

%display cell as tables
cell2table(Y1)
cell2table(Y2)