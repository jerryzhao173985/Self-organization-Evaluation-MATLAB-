% clc;clear all;close all

COVERAGE = []

fn = getfn(pwd, 'terrain_coverage.txt$')
% fn = fn(41:50)
% number_of_lists = length(fn)

for k=1:length(fn)
    disp("Now processing --------> "+fn{k})
    datapath = fn{k};
    filedata = readmatrix(datapath);
    coverage = filedata(:,1);
    
    COVERAGE(k,:) = coverage;
    
end

MEAN_COVERAGE = mean(COVERAGE)
STD_COVERAGE = std(COVERAGE)


figure
plot(smooth(MEAN_COVERAGE))
title('smoothed coverage change')
xlabel('trail number')
ylabel('area of bins')



fh1 = figure();

x = linspace(1,100,100);
% x = linspace(1,10,10);
e = errorbar(x,MEAN_COVERAGE,STD_COVERAGE,'-s','MarkerSize',10,...
    'MarkerEdgeColor','red','MarkerFaceColor','red');

title('Mean Coverage change')
xlabel('trail number')
ylabel('area of bins')


fh2 = figure();
plot(COVERAGE');
hold on
plot(MEAN_COVERAGE,"r",'LineWidth',5, 'Marker', '*', 'MarkerSize', 10)
