function obj = pollStaSusSetExistence(obj, orthThresh, snrLower, snrUpper, groupSize, numStas)
    num_pot_stas = length(obj.potAssocStas);
    %num_pot_stas = 2;
    orth_val =[];
    sus_created = false;
    k = 1;
    for sta_ctr = 1:numStas
        sta_idx = ceil(rand(1)*length(obj.potAssocStas));
        sta = obj.potAssocStas(sta_idx);
        H = sta.channel(k).h;
        norm_val = sum(sum(ctranspose(H)*H)))/length(H(:,1));
        if (normval <= snrUpper) & (normval >= snrLower)
            if sus_created = false
                stas_mat = {sta};
                sus_created = true;
            else
                stas_mat{k} = sta;
            end
            k = k + 1;
        end
    end
    obj.susSets = stas_mat;
end
