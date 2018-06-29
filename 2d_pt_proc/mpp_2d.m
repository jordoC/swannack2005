%Example for generating 2-D Matern Point Process
%   
%   Conceptual Notes:
%      -Requires an PPP input
%      -Method takes in a set of points from a PPP and an exclusion radius,
%       the output is a thinned version of the PPP that satisfies MPP criteria
%   Implementation Notes:
%      -The algorithm used is brute force. It works its way through the PPP
%       points comparing the set of points to a reference as it goes. Eventually
%       the reference point hits the end of the vector/set of points and the
%       thinning is finished.
%      -To avoid dynamically changing the size of vectors in the loops, 
%       points that need to be removed from the process are marked with (-1,-1)
%       Therefore, the input PPP cannot have these values in it. At the end
%       values that are marked for removal are removed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mpp_pairs = mpp_2d(excl_dist, src_file_path, dst_file_path)
    %file_path = 'ppp_pairs.csv';
    %excl_dist = .5;
    ppp_pairs = csvread(src_file_path);
    num_pairs = length(ppp_pairs(:,1));
    ref_pair = ppp_pairs(1,:);
    mpp_pairs = ppp_pairs;
    num_mpp_pairs = num_pairs;
    %Need to define global reference index so we don't go back to the start
    global_ref_idx = 1;
    for mpp_idx = 1:num_pairs
        for idx = 1:num_pairs
            ref_x = ref_pair(1);
            ref_y = ref_pair(2);
            %Already marked for removal:
            if (mpp_pairs(idx,1) == -1) & (mpp_pairs(idx,1) == -1)
                num_pairs;%nop
            else
                %Check to see if euclidean distance of next point is closer than
                % the exclusion distance. If it is, it must be marked for removal
                cur_x  = mpp_pairs(idx,1);
                cur_y  = mpp_pairs(idx,2);
                x_dist = abs(cur_x - ref_x);
                y_dist = abs(cur_y - ref_y);
                if (x_dist ~= 0) & (y_dist ~= 0)
                    is_closer = pythag_ck(x_dist, y_dist, excl_dist);
                    if is_closer == true
                        mpp_pairs(idx,:) = -1; %mark for removal
                    end
                end  
            end
        end
        %Note that the reference pointer never goes back to the start
        for ref_idx = global_ref_idx:num_pairs
            cur_ref_x = ref_x;
            cur_ref_y = ref_y;
            
            ref_search_x = mpp_pairs(ref_idx,1);
            ref_search_y = mpp_pairs(ref_idx,2);
            if (ref_search_x ~= -1) & (ref_search_y ~= -1)
                if(ref_search_x ~= cur_ref_x) & (ref_search_y ~= cur_ref_y)
                    ref_x = ref_search_x;
                    ref_y = ref_search_y;
                    ref_pair = [ref_x ref_y];
                    global_ref_idx = ref_idx;
                    break;
                end
            end
        end
    end
    old_mpp_pairs = mpp_pairs;
    tmp = mpp_pairs(mpp_pairs~=-1);
    mpp_pairs = reshape(tmp,length(tmp)/2,2) ;
    csvwrite(dst_file_path,mpp_pairs);
end
