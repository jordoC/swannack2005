function P = rmDuplicates(cellArray)
    %This section of code gets rid of duplicate cells
    P_tmp = cellArray;
    P = cell(1,1);
    k = 1;
    for root_idx = 1:numel(P_tmp)
        
        for group_idx = 1:numel(P_tmp{1,root_idx})
            should_add = true;
            current_group = P_tmp{1,root_idx}{group_idx,1}
            for group_ck_idx = 1:numel(P)
                %P
                %length(P{group_ck_idx,1})
                if length(P{group_ck_idx,1}) == length(current_group)
                    for sta_idx = 1:length(current_group)
                        current_sta = P_tmp{1,root_idx}{group_idx,1}{sta_idx};
                        current_ck_sta = P{group_ck_idx,1}{sta_idx};
                        if current_sta ~= current_ck_sta;
                            break;
                        else
                            if sta_idx == length(current_group)
                                should_add = false;
                            end
                        end
                    end
                end
            %if length(P_tmp{1,i}) == length(P_tmp{1,j})
            %    if iscell(P_tmp{1,i})
            %        for l = 1:length(P_tmp{1,j})
            %            if P_tmp{1,j}{l,1} ~= P_tmp{1,i}{l,1}
            %                break;
            %            else
            %                if l == length(P_tmp{1,j})
            %                    should_add = false;
            %                end
            %            end
            %        end
            %    else
            %        should_add = (P_tmp{i,1} == P_tmp{j,1});
            %    end
            %end
            end
            if should_add == true
                P{k,1} = current_group;
                k = k+1;
            end
        end
    end
    if k == 1
        P = {[]};
    end
    P = P';
end
