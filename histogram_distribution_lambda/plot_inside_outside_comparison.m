QQ = [];
for i=1:30
    QQ(i) = INSIDE_SUMS{i}*1.5 - OUTSIDE_SUMS{i};
end
plot(QQ)
hold on
QZ = [];
for i=1:30
    QZ(i) = 0;
end
plot(QZ)
hold on
title('INSIDE AREA*1.5 - OUTSIDE AREA')
% hold on
% xline(15.47,'--',{'INSIDE AREA*1.5=OUTSIDE AREA'});

hold on
average_y = mean(QQ);
yline(average_y,'--',{'AVG'});

saveas(gcf, append("INSIDE_OUTSIDE_", string(datetime),".png"));