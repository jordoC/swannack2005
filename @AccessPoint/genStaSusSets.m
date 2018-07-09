function obj = genStaSusSets(obj, orthThresh, snrLower, snrUpper)
    num_pot_stas = length(obj.potAssocStas);
    %num_pot_stas = 2;
    orth_val =[];
    sus_created = false;
    for i = 1: num_pot_stas
        sta = obj.potAssocStas(i);
        stas_vec = [];
        for j = 1 : num_pot_stas
            if i == j
                tmp = 0; %may want to put SNR requirement here
                if (i == 1)
                    stas_mat = {obj.potAssocStas(j)}
                    sus_created = true;
                    %break;
                else
                    stas_mat{i,j} = obj.potAssocStas(j);
                end
            else
                %orth_val = calcOrth(obj.potAssocStas(i), obj.potAssocStas(j)); 
                H1 = zeros(length(obj.potAssocStas(i).channel(1).h),length(obj.potAssocStas(i).channel));
                H2 = zeros(length(obj.potAssocStas(j).channel(1).h),length(obj.potAssocStas(j).channel));
                for k = length(H1(1,:))
                    H1(:,k) = obj.potAssocStas(i).channel(k).h;
                    H2(:,k) = obj.potAssocStas(j).channel(k).h;
                end
                orth_val = abs(sum(sum(ctranspose(H1)*H2)))/length(H1(:,1));
                if orth_val < orthThresh
                    stas_mat{i,j} = obj.potAssocStas(j);
                end
                %if orth_val < orthThresh
                %    if length(stas_vec) == 0
                %        stas_vec=  obj.potAssocStas(j);
                %    else
                %        stas_vec = [ stas_vec obj.potAssocStas(j)];
                %        %whos stas_vec;
                %    end
                %end 
            end 
        end
        %if i == 1
        %    stas_mat = { stas_vec };
        %    %break;
        %else
        %    stas_mat{i,1} = stas_vec;
        %end
    end
    %for i = 1:length(stas_mat)
    %    tmp = stas_mat(i,:);
    %    stas_mat(i,:) = tmp(~cellfun('isempty',tmp));
    %end
    obj.susGroups= stas_mat;
end
