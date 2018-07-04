function obj = genStaSusSets(obj, orthThresh, snrLower, snrUpper)
    num_pot_stas = length(obj.potAssocStas);
    %num_pot_stas = 2;
    stas_mat= [];
    orth_val =[];
    for i = 1: num_pot_stas
        sta = obj.potAssocStas(i);
        stas_vec = [];
        for j = 1 : num_pot_stas
            if i == j
                tmp = 0; %may want to put SNR requirement here
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
                    if length(stas_vec) == 0
                        stas_vec=  obj.potAssocStas(j);
                    else
                        stas_vec = [ stas_vec obj.potAssocStas(j)];
                        %whos stas_vec;
                    end
                end 
            end 
        end
        if length(stas_mat) == 0
            stas_mat = SusGroups(stas_vec);
            %break;
        else
            whos stas_mat;
            stas_mat = [stas_mat SusGroups(stas_vec)];
        end
    end
    plot(1:length(orth_val), orth_val);
    obj.susSets = stas_mat;
end
