
rows=2;
cols=2;
clf

subplot(rows,cols,1)
%Plot the mean and standard deviation then overlay the raw data
y=COVERAGE;
x=1:100;
shadedErrorBar(x,y,{@mean,@std}); 

hold on
plot(x,y,'.','color',[0.5,0.5,0.95])

hold off

grid on




subplot(rows,cols,2)
%Overlay different lines (transparent) lines and change their properties
hold on

plot2styles = {'-b';'-g'; '-r'};
for i = 1:3
  plt2invis = plot(0,0,plot2styles{i});
  set( plt2invis, 'visible', 'off'); 
end
  

shadedErrorBar(x,y,{@mean,@std},'lineprops','-b','transparent',true,'patchSaturation',0.9)


%Make red line non-transparent
shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075)
hold off

grid on




subplot(rows,cols,3)
% Post-hoc modifications of line properties

%Set face and edge properties
if (sum( size(ver('MATLAB'))) > 0  )
 s = shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r');
 set(s.edge,'LineWidth',2,'LineStyle',':')
 s.mainLine.LineWidth = 5;
 s.patch.FaceColor = [0.5,0.25,0.25];
elseif (sum(size(ver('Octave'))) > 0)
 s = shadedErrorBar(x, y, {@mean,@std}, 'lineprops', {'-r','LineWidth',5,'LineStyle',':'});
end
hold on

if (sum( size(ver('MATLAB'))) > 0  )
 plot(s.mainLine.XData, s.mainLine.YData,'or','MarkerFaceColor','w')
end

hold off
grid on

% set(gca,'XTickLabel',[],'YTickLabel',[])





subplot(rows,cols,4)
% Post-hoc modifications of line properties

shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r')


