function obj = pollStaSusSetExistence(obj, orthThresh, snrLower, snrUpper, groupSize, numStas)
    %num_pot_stas = min(numStas,length(obj.potAssocStas));
    num_pot_stas = numStas;
    potStas = [];
    sta_idx_vec = randperm(length(obj.potAssocStas),num_pot_stas);
    for i = 1:num_pot_stas
        sta_idx = sta_idx_vec(i);
        if i == 1
            potStas = obj.potAssocStas(sta_idx);
        else
            potStas = [ potStas obj.potAssocStas(sta_idx) ];
        end
    end
    %num_pot_stas = 2;
    excl_stas = [];
    sus_created = false;
    for i = 1:num_pot_stas
        stas_vec = [];
        for j = 1:num_pot_stas
            H1 = zeros(length(potStas(i).channel(1).h),length(potStas(i).channel));
            H2 = zeros(length(potStas(j).channel(1).h),length(potStas(j).channel));
            for k = 1:length(H1(1,:))
                H1(:,k) = potStas(i).channel(k).h;
                H2(:,k) = potStas(j).channel(k).h;
            end
            if i == j
                %H2*ctranspose(H1)
                %abs(trace(H2*ctranspose(H1))/length(H1(:,1)))
                norm_val = datasample(diag(H2*ctranspose(H1)),1);
                %norm_val = abs(trace(ctranspose(H1)*H2)/length(H1(:,1)));
                %norm_val = ((H2*ctranspose(H1))/length(H1(1,:)));
                %(ctranspose(H1)*H2)/length(H1(:,1))
                %(trace(ctranspose(H1)*H2))/length(H1(:,1))
                %norm_val = sum(sum(ctranspose(H1)*H2))/length(H1(:,1))
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
                        excl_stas = i;
                        sus_created = true;
                    else
                        excl_stas = [excl_stas i];
                    end
                end
            end
        end
    end
    for i = 1:num_pot_stas
        stas_vec = [];
        for j = 1:num_pot_stas
            H1 = zeros(length(potStas(i).channel(1).h),length(potStas(i).channel));
            H2 = zeros(length(potStas(j).channel(1).h),length(potStas(j).channel));
            for k = 1:length(H1(1,:))
                H1(:,k) = potStas(i).channel(k).h;
                H2(:,k) = potStas(j).channel(k).h;
            end
            if i ~= j
                %orth_val = calcOrth(potStas(i), potStas(j)); 
                %orth_val = (H2*ctranspose(H1))/length(H1(1,:));
                orth_val = (H2*ctranspose(H1));
                orth_samp = abs(datasample(diag(orth_val),1));
                %norm_val = vecnorm(orth_val)/length(H1(:,1));
                %mean_norm_val = mean(abs(orth_val));
                %mean_norm_val = mean(mean(abs(orth_val)));
                %mean_norm_val = mean(norm_val) ;
                %orth_val = abs(trace((ctranspose(H1)*H2)))/length(H1(:,1));
                %orth_val = cov(H1,H2)
                if (orth_samp < orthThresh) && ~(any(excl_stas==j))
                    stas_mat{i,j} = potStas(j);
                else
                    stas_mat{i,j} = [];
                end
            end 
        end
    end
    obj.susPollSets = stas_mat;
end
