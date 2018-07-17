% By Paulo Abelha
%
% Returns the powerset of set S
%
% S is a cell array
% P is a cell array of cell arrays
function [ P ] = PowerSet( S, numEnt,rootId )
    n = numel(S);
    x = 1:n;
    %numEnt = n;
    P_tmp = cell(1,2^numEnt);
    p_ix = 2;
    for nn = 1:numEnt
        a = combnk(x,nn);
        for j=1:size(a,1)
            P_tmp{p_ix} = S(a(j,:));
            p_ix = p_ix + 1;
        end
    end

    %This section of code gets rid of null cells
    P= P_tmp;
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

%     %This section of code gets rid of duplicate cells
%     P_tmp = P';
%     P = cell(1,1);
%     k = 1;
%     for i = 1:numel(P_tmp)
%         should_add = true;
%         for j = i+1:numel(P_tmp)
%             if length(P_tmp{1,i}) == length(P_tmp{1,j})
%                 if iscell(P_tmp{1,i})
%                     for l = 1:length(P_tmp{1,j})
%                         if P_tmp{1,j}{l,1} ~= P_tmp{1,i}{l,1}
%                             break;
%                         else
%                             if l == length(P_tmp{1,j})
%                                 should_add = false;
%                             end
%                         end
%                     end
%                 else
%                     should_add = (P_tmp{i,1} == P_tmp{j,1});
%                 end
%             end
%         end
%         if should_add == true
%             P{k,1} = P_tmp{i};
%             k = k+1;
%         end
%     end
%     if k == 1
%         P = {[]};
%     end
end

