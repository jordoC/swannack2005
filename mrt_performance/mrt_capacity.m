function shannon_capacity = mrt_capacity(epsilon, group_size, num_tx_ants, is_wl)
    sigma_noise = 1e-1; %watts
    tx_power = 1;       %watts
    
    if is_wl == true
        gamma_fact = 1;
        else
        gamma_fact = 2;
    end 
    user_chan_norm = gamrnd(gamma_fact*num_tx_ants, gamma_fact/num_tx_ants);
    intf_chan_norm = [];

    for i = 1:group_size
        intf_chan_norm = [intf_chan_norm  gamrnd(gamma_fact*num_tx_ants, gamma_fact/num_tx_ants)];
    end

    sinr_numerator = (tx_power/num_tx_ants)*(user_chan_norm);
    sinr_denominator = ((epsilon^2)*tx_power/num_tx_ants)*(sum(1./intf_chan_norm))+sigma_noise;
    sinr = sinr_numerator/sinr_denominator;

    10*log10(sinr);

    shannon_capacity = log2(1+sinr); %bits/s/Hz
end
