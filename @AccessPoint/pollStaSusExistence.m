function obj = pollStaSusSetExistence(obj, orthThresh, snrLower, snrUpper, groupSize, numStas)
    num_pot_stas = numStas;

    S_e = {};
    S_e_idx = 1;

    %We randomly select STAs from the PPP to consider for SUS group addition:
    potStas = [];
    sta_idx_vec = randperm(length(obj.potAssocStas),num_pot_stas);
    for i = 1:num_pot_stas
        sta_idx = sta_idx_vec(i);
        if i == 1
            potStas = {obj.potAssocStas(sta_idx)};
        else
            potStas{i} = obj.potAssocStas(sta_idx);
        end
    end
  
    %S_a is the collection of all sets of size groupSize, chosen from a pool of size numStas  
    S_a = combnk(potStas,groupSize);
    
    norm_incl_stas = [];
    for S_a_idx  = 1:length(S_a(:,1))
        A = S_a(S_a_idx,:);
        for A_idx = 1:length(A)
            H = zeros(length(A{A_idx}.channel(1).h),length(A{A_idx}.channel));
            for chan_idx = 1:length(H(1,:))
                H(:,chan_idx) = A{A_idx}.channel(chan_idx).h;
            end
            %By forming this matrix multiplication, we end up with a square matrix with a dimension equal to the
            % number of samples in the random channel vector. Note that the non-diagonal elements are not correlated,
            % but the elements along the main diagonal are. We randomly select a sample along the main diagonal to see
            % if it meets SNR requirements
            norm_val = datasample(diag(H*ctranspose(H)),1);
            if (norm_val >= snrLower) && (norm_val<= snrUpper)
                if A_idx == length(A)
                    if length(norm_incl_stas) == 0
                        norm_incl_stas = S_a_idx;
                    else
                        norm_incl_stas = [norm_incl_stas S_a_idx];
                    end
                end
            else
                break;
            end
        end
    end

    for S_a_idx = norm_incl_stas
        A = S_a(S_a_idx,:);
        orth_pairs = combnk(A,2);
        for orth_idx = 1:length(orth_pairs(:,1))
            orth_pair = orth_pairs(orth_idx,:);
            H1 = zeros(length(orth_pair{1}.channel(1).h),length(orth_pair{1}.channel));
            H2 = zeros(length(orth_pair{2}.channel(1).h),length(orth_pair{2}.channel));
            for chan_idx  = 1:length(H1(1,:))
                H1(:,chan_idx) = orth_pair{1}.channel(chan_idx).h;
                H2(:,chan_idx) = orth_pair{2}.channel(chan_idx).h;
            end
            orth_val = H2*ctranspose(H1);
            %It really shouldn't matter if we sample along the diagonal of this matrix, since all the channels are
            % assumed to be iid. The orth_val matrix should be a square matrix of dimension equal to the number of
            % samples in the random vector representing the channel. Really, each row/column and the main diagonal
            % should be statistically equivalent random variables; therefore, it shouldn't matter which vector of the
            % matrix we choose to select a sample from.
            %
            %Randomly select a sample from the random variable to check if it meets the orthogonality requirement
            orth_samp = abs(datasample(diag(orth_val),1));
            if (orth_samp < orthThresh)
               if orth_idx == length(orth_pairs(:,1))
                   if length(S_e) == 0
                       S_e = {A};
                       S_e_idx = S_e_idx + 1;
                   else
                       S_e{S_e_idx} = A;
                       S_e_idx = S_e_idx + 1;
                   end
               end
            else
                break;
            end
        end
    end 
    obj.susPollSets = S_e;
    %length(norm_incl_stas)
    %length(S_e)/length(norm_incl_stas)
end
