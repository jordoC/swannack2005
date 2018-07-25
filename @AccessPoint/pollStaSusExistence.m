function obj = pollStaSusSetExistence(obj, orthThresh, snrLower, snrUpper, groupSize, numStas)
    num_pot_stas = min(numStas,length(obj.potAssocStas));
    potStas = [];
    for i = 1:num_pot_stas
        sta_idx = ceil(rand(1)*length(obj.potAssocStas));
        if i == 1
            potStas = obj.potAssocStas(sta_idx);
        else
            potStas = [ potStas obj.potAssocStas(sta_idx) ];
        end
    end
    %num_pot_stas = 2;
    orth_val =[];
    sus_created = false;
    for i = 1:num_pot_stas
        stas_vec = [];
        for j = 1:num_pot_stas
            H1 = zeros(length(potStas(i).channel(1).h),length(potStas(i).channel));
            H2 = zeros(length(potStas(j).channel(1).h),length(potStas(j).channel));
            for k = length(H1(1,:))
                H1(:,k) = potStas(i).channel(k).h;
                H2(:,k) = potStas(j).channel(k).h;
            end
            if i == j
                norm_val = sum(sum(ctranspose(H1)*H2))/length(H1(:,1))
                if (norm_val >= snrLower) && (norm_val<= snrUpper)
                    if (i == 1)
                        stas_mat = {potStas(j)};
                        sus_created = true;
                        %break;
                    else
                        stas_mat{i,j} = potStas(j);
                    end
                else
                    if (i == 1)
                        stas_mat = {};
                        sus_created = true;
                    end
                end
            else
                %orth_val = calcOrth(potStas(i), potStas(j)); 
                orth_val = abs(sum(sum(ctranspose(H1)*H2)))/length(H1(:,1));
                if orth_val < orthThresh
                    stas_mat{i,j} = potStas(j);
                end
            end 
        end
    end
    obj.susPollSets = stas_mat;
end
