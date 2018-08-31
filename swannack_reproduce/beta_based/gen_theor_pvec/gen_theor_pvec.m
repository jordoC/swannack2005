addpath ../
epsilon = 0:.025:2;
rho_min = 1;
rho_max = 2;
group_size = 2;
num_dim = 4;
numStas = 20;
p = zeros(1,length(numStas));
k = 1;
for e = epsilon 
    theta_vec(k) = acos(e/rho_max);
    theta = theta_vec(k);
    p(k) = max(0,p_not_empty(theta,rho_min, rho_max, group_size, num_dim, numStas));
    p_o(k) = p_orth(theta, group_size, num_dim);
    I(k) = beta_inc_reg(theta, num_dim);
    k = k+1;
end
