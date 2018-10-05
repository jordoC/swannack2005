function shannon_capacity_lbnd = zfbf_capacity(epsilon, rho_min, group_size, num_tx_ants)
    sigma_noise = 1e-1; %watts
    tx_power = 1;       %watts
 
    while 1
        user_chan_norm = gamrnd(2*num_tx_ants, 2/num_tx_ants);
        if (user_chan_norm >= 1) && (user_chan_norm<= 2)
            %display 'break'
            break;
        end
    end
    %This can be used for a lower bound
    %numerator = rho_min*(1-(epsilon/rho_min))*(1+(group_size-1)*epsilon/rho_min);
    %denominator = group_size+(group_size^2 -2*group_size)*epsilon/rho_min;
    numerator = user_chan_norm*(1-(epsilon/user_chan_norm))*(1+(group_size-1)*epsilon/user_chan_norm);
    denominator = group_size+(group_size^2 -2*group_size)*epsilon/user_chan_norm;

    shannon_capacity_lbnd = log2(1+tx_power*(numerator/denominator)); %bits/s/Hz
end
