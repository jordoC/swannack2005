function obj = pollStaSusSetExistence(obj, orthThresh, snrLower, snrUpper, groupSize, numStas)
    %This is another method of guaranteeing that there will be enough STAs in the PPP to select from. However,
    % if this min() is used, it does not guarantee that the number of STAs considered for SUS group existence is what was
    % requested (ie. if the PPP has fewer STAs in it than the number of STAs requested for consideration)
    
    %num_pot_stas = min(numStas,length(obj.potAssocStas));

    %Alternatively, this assignment will either guarantee that the number of STAs requsted for consideration is what the
    %user asked for, or it will through an error.
    num_pot_stas = numStas;

    %We randomly select STAs from the PPP to consider for SUS group addition:
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
    
    %SNR Requirement checking:
    % Check to see if the STA channel is within the SNR bounds. This is done by forming the norm of the random channel
    % accross the number of dimensions corresponding to the number of transmit channels, then randomly selecting a sample
    % from the random variable representing the norm. It is important to note that if the STA does not meet SNR requirements,
    % it is disqualified from SIR/orthogonality consideration. It is assumed when considering orthogonality, that the channel
    % norm fits inbetween the shell defined by rho_min, rho_max (ie. the channel meets SNR requirements). If it does not, then
    % it should be automatically disqualified from consideration as a candidate member of the SUS group.
    %
    % In terms of implementation, this is achieved by maintaining a list of STAs to exclude from SIR consideration
    % (ie. excl_stas)
    excl_stas = [];
    sus_created = false;
    for i = 1:num_pot_stas
        stas_vec = [];
        for j = 1:num_pot_stas
            %Get the channel vectors to compare
            H1 = zeros(length(potStas(i).channel(1).h),length(potStas(i).channel));
            H2 = zeros(length(potStas(j).channel(1).h),length(potStas(j).channel));
            for k = 1:length(H1(1,:))
                H1(:,k) = potStas(i).channel(k).h;
                H2(:,k) = potStas(j).channel(k).h;
            end
            %If i == j, then two STAs are the same, we are forming the channel norm
            if i == j
                %By forming this matrix multiplication, we end up with a square matrix with a dimension equal to the
                % number of samples in the random channel vector. Note that the non-diagonal elements are not correlated,
                % but the elements along the main diagonal are. We randomly select a sample along the main diagonal to see
                % if it meets SNR requirements
                norm_val = datasample(diag(H2*ctranspose(H1)),1);
                
                %Note that the average of the norm samples corresponding to the channel should be 1:
                %norm_val = abs(trace(ctranspose(H1)*H2)/length(H1(:,1))); %should be = 1

                %Check SNR requirements
                if (norm_val >= snrLower) && (norm_val<= snrUpper)
                    if (i == 1)
                        stas_mat = {potStas(j)};
                        sus_created = true;
                        %break;
                    else
                        stas_mat{i,j} = potStas(j);
                    end
                else
                    %If requirements are not met, then leave the cell empty and add the sta_mat index to the exclusion list
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

    %SIR Requirement checking:
    % Check the SIR requirements for those channels that live in the shell between rho_min, rho_max.
    for i = 1:num_pot_stas
        stas_vec = [];
        for j = 1:num_pot_stas
            %Get the channel vectors to compare
            H1 = zeros(length(potStas(i).channel(1).h),length(potStas(i).channel));
            H2 = zeros(length(potStas(j).channel(1).h),length(potStas(j).channel));
            for k = 1:length(H1(1,:))
                H1(:,k) = potStas(i).channel(k).h;
                H2(:,k) = potStas(j).channel(k).h;
            end
            %We have already checked the i == j case, now we want to consider the off-diagonal elements in the cell array
            % that correspond to interference. Checking is done as a measure of orthogonality.
            if i ~= j
                orth_val = H2*ctranspose(H1);
                %It really shouldn't matter if we sample along the diagonal of this matrix, since all the channels are
                % assumed to be iid. The orth_val matrix should be a square matrix of dimension equal to the number of
                % samples in the random vector representing the channel. Really, each row/column and the main diagonal
                % should be statistically equivalent random variables; therefore, it shouldn't matter which vector of the
                % matrix we choose to select a sample from.
                %
                %Randomly select a sample from the random variable to check if it meets the orthogonality requirement
                orth_samp = abs(datasample(diag(orth_val),1));
                if (orth_samp < orthThresh) && ~(any(excl_stas==j))
                    stas_mat{i,j} = potStas(j);
                else
                    %If the requirement is not met, or the index is in the exclusion list from the SNR requirement checking,
                    % then leave the cell empty.
                    stas_mat{i,j} = [];
                end
            end 
        end
    end
    %The rows in the cell array represent potential SUS groups. The cells will either be empty (ie. containing {0xdouble}),
    % or will contain a STA (ie. {1xStation}. When the cell array is fed into the SUS group selection method that permutes
    % the contents of these cells, all the empty cells will be skipped over, and the non-empty cells will be permuted in
    % order to form SUS groups of the specified group size.
    obj.susPollSets = stas_mat;
end
