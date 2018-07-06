function intersection = recurIntsct(vec, start_idx)
    if (start_idx == length(vec))
        intersection = vec(end).val;
    else 
        intersection = intersect(vec(start_idx).val,recurIntsct(vec,start_idx+1))
    end
end
