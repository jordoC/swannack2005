% By Paulo Abelha
%
% Returns the powerset of set S
%
% S is a cell array
% P is a cell array of cell arrays
function [ P ] = PowerSet( S, numEnt )
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
    P = P_tmp;
    %k = 1;
    %for i = 1:numel(P_tmp)
    %    if iscell(P_tmp{1,i})
    %        if ~cellfun('isempty',P_tmp{1,i})
    %            if k == 1
    %                P = {P_tmp{1,i}};
    %            else
    %                P{1,k} = {P_tmp{1,i}};
    %            end
    %            k = k+1;
    %        end
    %    else
    %        if length(P_tmp{1,i}) ~= 0
    %            if k == 1
    %                P = {P_tmp{1,i}};
    %            else
    %                P{1,k} = {P_tmp{1,i}};
    %            end
    %            k = k+1;
    %        end
    %    end
    %end
    %if k == 1
    %    P = {[]};
    %end
end

