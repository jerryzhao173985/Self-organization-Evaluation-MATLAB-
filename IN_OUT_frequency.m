% TIME = 1./FREQ
x = 1:100;

x = x*0.01;
x = 1./x

y = FREQ;
% y=FREQ;
plot2styles = {'-b';'-g'; '-r'};
for i = 1:3
plt2invis = plot(0,0,plot2styles{i});
set( plt2invis, 'visible', 'off');
end
shadedErrorBar(x,y,{@mean,@std},'lineprops','-b','transparent',true,'patchSaturation',0.9)
%Make red line non-transparent
shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075)
hold on
% plot(smooth(MEAN_FREQ))
plot(x, smooth(mean(y)),"b",'LineWidth',5, 'Marker', '*', 'MarkerSize', 10)

% legend(['shaded errorbar';'smoothed'],'location','northwest')
% legend
legend('mean','smoothed','location','northwest' )

hold on
% xlabel("T/0.01s")
% ylabel("Hz/s^{-1}")
% title("Output frequency trend with respect to input time")
