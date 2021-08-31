
trails = 10;
input_list = cell(trails, 1);

datapath = 'data/seed1/layer1.txt'

% number_of_lists = length(fn)
mkdir temporal_files
for trail=1:trails
    disp("Now processing --------> trail "+ trail)
    figure('Renderer', 'painters', 'Position', [10 10 2500 1000]);
%     
%     set(gcf, 'PaperUnits', 'inches');
%     set(gcf, 'PaperSize', [20 10]);
%     set(gcf, 'PaperPositionMode', 'manual');
%     set(gcf, 'PaperPosition', [0 0 4 2]);
%     
    for i=1:2
        for j=1:9
            I = ((i-1)*9+(j-1)+1);
            subplot(2,9,I)
            func_original(datapath, 100, 2500,trail, I)
%             function func_original(filename, sampling_frequency, length_of_signal, sensor_number)
            ylim([-1, 1])
        end
    end
    
    filename = append('temporal_files/',int2str(trail), '.png');
    saveas(gcf, filename);
    close;
    input_list(trail) = {filename};
    
end

% append_pdfs(("output_plot_all_original "+datestr(datetime('now'))+".pdf"), input_list{:})
% [status, message, messageid] = rmdir('temporal_files', 's');
