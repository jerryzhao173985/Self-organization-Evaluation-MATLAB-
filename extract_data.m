% extract_data

% clc;clear all;close all

extracted_data = []
ALL_SAMPLE = 30000
EXTRACTED_SAMPLE = 1000
TRAIL_NUM = 100

fn = getfn(pwd, 'layer1.txt$')
% fn = fn(41:50)
% number_of_lists = length(fn)

for k=1:length(fn)
    disp("Now processing --------> "+fn{k})
    datapath = fn{k};
    new_datapath = datapath(1:end-4)+"_extract.txt";
    TTT = readmatrix(fn{k});
    extracted_data = [];
    for s = 1:TRAIL_NUM
        TTT1 = TTT(((s-1)*ALL_SAMPLE+1): s*ALL_SAMPLE, :);
        extracted_data(((s-1)*EXTRACTED_SAMPLE+1): s* EXTRACTED_SAMPLE,:) = TTT1((ALL_SAMPLE - EXTRACTED_SAMPLE +1) : ALL_SAMPLE, :);
        
    end
    dlmwrite(new_datapath,extracted_data);

    
    
    
end