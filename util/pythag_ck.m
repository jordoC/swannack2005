%Simple euclidean distance checker
%   
%   Conceptual Notes:
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function is_closer= pythag_ck(x, y, cutoff)
    dist = sqrt((x^2)+y^(2));
    if dist < cutoff
        is_closer = true;
    else
        is_closer = false;
    end
end
