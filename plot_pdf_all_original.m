% TT = readmatrix('../layer1.txt');
% T1 = TT(1:30000,3);
N = 30;
input_list = cell(N, 1);

mkdir temporal_files
for i=1:N
    arr = T1( ((i-1)*1000+1) : (i*1000) );
    data = arr;
    data = (data-min(data))./ (max(data)-min(data));
    figure; 
    dis = histfit(data,100,'kernel'); 
    filename = append('temporal_files/',int2str(i), '.pdf');
    saveas(gcf, filename);
    close;
    input_list(i) = {filename};
end

append_pdfs('output.pdf', input_list{:})
[status, message, messageid] = rmdir('temporal_files', 's');
