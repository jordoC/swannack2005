% Developed based on cody by: Paulo Abelha
function obj = genStaSusGroups( obj, maxGroupSize)
    
    tmpSusGroups = cell(1);
    for set_idx = 1:length(obj.susSets(1,:))
        S = obj.susSets(set_idx,:);
        rootId = S{set_idx}.id;
        n = numel(S);
        x = 1:n;
        %maxGroupSize= n;
        P_tmp = cell(1,2^maxGroupSize);
        p_ix = 2;
        for nn = 1:maxGroupSize
            a = combnk(x,nn);
            for j=1:size(a,1)
                P_tmp{p_ix} = S(a(j,:));
                p_ix = p_ix + 1;
            end
        end
        P = P_tmp;
        k = 1;
        for i = 1:numel(P_tmp)
            if iscell(P_tmp{1,i})
                if ~cellfun('isempty',P_tmp{1,i})
                    if k == 1
                        P = {P_tmp{1,i}};
                    else
                        P{1,k} = P_tmp{1,i};
                    end
                    k = k+1;
                end
            else
                if length(P_tmp{1,i}) ~= 0
                    if k == 1
                        P = {P_tmp{1,i}};
                    else
                        P{1,k} = {P_tmp{1,i}};
                    end
                    k = k+1;
                end
            end
        end
        if k == 1
            P = {[]};
        end
        
        %This section of code gets rid of SUS groups that don't
        %contain the root STA 
        P_tmp = P;
        P = cell(1,1);
        k = 1;
        for i = 1:numel(P_tmp)
            should_add = true;
            if iscell(P_tmp{1,i})
                for j = 1:length(P_tmp{1,i})
                    if P_tmp{1,i}{1,j}.id == rootId 
                        break;
                    else
                        if j == length(P_tmp{1,i})
                            should_add = false;
                        end
                    end
                end
            else
                should_add = (P_tmp{1,i}.id == rootId);
            end
            if should_add == true
                P{k,1} = P_tmp{i};
                k = k+1;
            end
        end
        tmpSusGroups{set_idx} = P;
    end
    obj.susGroups = tmpSusGroups;
end

