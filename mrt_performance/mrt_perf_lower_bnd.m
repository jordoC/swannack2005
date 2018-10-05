addpath ../swannack_reproduce/beta_based

num_candidate_users = 100;
rho_min = 1.75;
rho_max = 2;
group_size = 4;
filepath = 'figs/6_candidate_mrt_gs2.csv';

num_tx_ants = 4;
epsilon_vec = 0:0.025:2;

sum_rate_vec= zeros(1,length(epsilon_vec));
for epsilon_vec_idx = 1:length(epsilon_vec)
    sum_rate = 0;
    epsilon = epsilon_vec(epsilon_vec_idx);
    theta = acos(epsilon/rho_max);
    %This is to be used for the linear case
    %p_exist = max(0,p_not_empty(theta,rho_min, rho_max,  group_size, ...
    %    num_tx_ants, num_candidate_users));
    %This is to be used for the widely linear case
    p_exist = max(0,p_not_empty(theta,rho_min, rho_max, group_size, ...
        2*num_tx_ants, num_candidate_users));
    for i = 1:group_size
        %This is to be used for the linear case
        %sum_rate = sum_rate + mrt_capacity_lower_bnd(epsilon, rho_min, num_tx_ants, false);
        %This is to be used for the widely linear case
        sum_rate = sum_rate + mrt_capacity_lower_bnd(epsilon, rho_max, num_tx_ants, true);
    end
    %This is to be used for the linear case
    %sum_rate_vec(epsilon_vec_idx) = p_exist*sum_rate;
    %This is to be used for the widely linear case
    sum_rate_vec(epsilon_vec_idx) = p_exist*sum_rate/2;
end

dataset = [epsilon_vec' sum_rate_vec'];

%csvwrite(filepath,dataset);
