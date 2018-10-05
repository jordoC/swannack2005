function shannon_capacity = mrt_capacity(epsilon, group_size, num_tx_ants, is_wl)
    sigma_noise = 1e-1; %watts
    tx_power = 1;       %watts
    
    if is_wl == true
        gamma_fact = 1;
        else
        gamma_fact = 2;
    end 
    while 1
        user_chan_norm = gamrnd(2*num_tx_ants, 2/num_tx_ants);
        if (user_chan_norm >= 1) && (user_chan_norm<= 2)
            %display 'break'
            break;
        end
    end
    %This can be used for a lower bound on the curve
    %user_chan_norm = rho_min;
    intf_chan_norm = [];

    for i = 1:group_size
    while 1
        intf_chan_norm_inst = gamrnd(gamma_fact*num_tx_ants, gamma_fact/num_tx_ants);
        if (intf_chan_norm_inst >= 1) && (intf_chan_norm_inst <= 2)
            intf_chan_norm = [intf_chan_norm  intf_chan_norm_inst];
            break;
        end
    end
        %This can be used for a lower bound on the curve
        %intf_chan_norm = [intf_chan_norm  rho_min];
    end

    sinr_numerator = (tx_power/num_tx_ants)*(user_chan_norm);
    sinr_denominator = ((epsilon^2)*tx_power/num_tx_ants)*(sum(1./intf_chan_norm))+sigma_noise;
    sinr = sinr_numerator/sinr_denominator;

    10*log10(sinr);

    shannon_capacity = log2(1+sinr); %bits/s/Hz
end
