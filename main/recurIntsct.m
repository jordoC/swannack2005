function intersection  = recurIntsct(vec_in, start_idx)
    if (start_idx == length(vec_in))
        intersection = vec_in(end).val;
    else 
        intersection = intersect(vec_in(start_idx).val,recurIntsct(vec_in,start_idx+1));
        filename = strcat('intersection_',string(start_idx),'.mat');
        save(filename,'intersection');

    end
end
