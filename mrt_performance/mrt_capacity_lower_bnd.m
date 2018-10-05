function shannon_capacity_lb = mrt_capacity_lower_bnd(epsilon, rho_min, num_tx_ants, is_wl)
    sigma_noise = 1e-1; %watts
    tx_power = 1;       %watts

    sinr_numerator = (tx_power/num_tx_ants)*(rho_min);
    sinr_denominator = ((epsilon^2)*tx_power/num_tx_ants)*((num_tx_ants-1)/rho_min)+sigma_noise;
    sinr = sinr_numerator/sinr_denominator;

    10*log10(sinr);

    shannon_capacity_lb = log2(1+sinr); %bits/s/Hz
end
