function frac_area= beta_inc_reg(theta, num_dim)
    z = sin(theta)^2;
    N = num_dim;
    frac_area = betainc(z,(2*N-1)/2,.5)/beta((2*N-1)/2,.5);
    frac_area = min(frac_area,1);
end
