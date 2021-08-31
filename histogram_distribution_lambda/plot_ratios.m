ratios = [];
for i=1:30
    peak = PEAKS{i};
    if(length(peak)==1)
        ratio = 1;
    else
        [sorted_arr, ind] = sort(peak);
        second_largest = sorted_arr(end-1);
        second_largest_index = ind(end-1);
        largest_index = ind(end);
        if(second_largest_index < largest_index )
            ratio = second_largest;
        elseif(second_largest_index > largest_index)
            ratio = 1/second_largest;
        end
            
    end
    ratios(i) = ratio;
end
plot(ratios)

for k=1:30
    z(k) = 1;
end
hold on 
plot(z)