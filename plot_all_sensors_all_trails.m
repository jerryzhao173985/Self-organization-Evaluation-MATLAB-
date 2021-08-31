trails = 10;
input_list = cell(trails, 1);
ALL_SAMPLE = 30000;

datapath = 'data/seed1/layer1.txt'
TT = readmatrix(datapath);

% number_of_lists = length(fn)
mkdir temporal_files
for trail=1:trails
    disp("Now processing --------> trail "+ trail)
    figure('Renderer', 'painters', 'Position', [10 10 2500 1000]);


    for i=1:2
        for j=1:9
            I = ((i-1)*9+(j-1)+1);
            subplot(2,9,I)
            T1 = TT(((trail-1)*ALL_SAMPLE+1):ALL_SAMPLE*trail, I+1);
            func_fft(T1, 100, 2500)
            ylim([0, 0.5])
            xlim([0,  20])
        end
    end
    
    
end