addpath ../
epsilon = .4;
rho_min = 1;
rho_max = 2;
group_size = 4;
num_dim = 4;
theta = acos(epsilon/rho_max);
numStas = 4:50;
p = zeros(1,length(numStas));
k = 1;
for n = numStas
    p(k) = max(0,p_not_empty(theta,rho_min, rho_max, group_size, num_dim, n));
    k = k+1;
end
