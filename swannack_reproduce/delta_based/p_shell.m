function p_s= p_shell(rho_min, rho_max, num_dim)
    m = num_dim;
    p_s = gammainc(2*m,m*rho_min)-gammainc(2*m,m*rho_max);
end
