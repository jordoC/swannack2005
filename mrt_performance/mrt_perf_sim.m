addpath ../swannack_reproduce

num_candidate_users = 15;
rho_min = 1;
rho_max = 2;
group_size = 4;
filepath = 'figs/30_candidate_mrt_gs2.csv';

num_tx_ants = 4;
epsilon_vec = 0:0.025:2;

num_monte_trials = 200;
avg_sum_rate_monte_vec = zeros(1,num_monte_trials);
avg_sum_rate_epsilon = zeros(1,length(epsilon_vec));
ebars = zeros(length(epsilon_vec),1);
std_dev_sum_rate_monte = 0;
for epsilon_vec_idx = 1:length(epsilon_vec)
    for t = 1:num_monte_trials
        sum_rate = 0;
        epsilon = epsilon_vec(epsilon_vec_idx);
        theta = acos(epsilon/rho_max);
        %This is to be used for the linear case
        p_exist = max(0,p_not_empty(theta,rho_min, rho_max, group_size, ...
            num_tx_ants, num_candidate_users));
        %This is to be used for the widely linear case
        %p_exist = max(0,p_not_empty(theta,rho_min, rho_max, group_size, ...
        %    2*num_tx_ants, num_candidate_users));
        for i = 1:group_size
            %This is to be used for the linear case
            sum_rate = sum_rate + mrt_capacity(epsilon, group_size, num_tx_ants, false);
            %This is to be used for the widely linear case
            %sum_rate = sum_rate + mrt_capacity(epsilon, group_size, num_tx_ants, true);
        end
        %This is to be used for the linear case
        %avg_sum_rate_monte_vec(t) = p_exist*sum_rate;
        %This is to be used for the widely linear case
        avg_sum_rate_monte_vec(t) = p_exist*sum_rate/2;
    end
    avg_sum_rate_epsilon(epsilon_vec_idx) = mean(avg_sum_rate_monte_vec);
    std_dev_sum_rate_monte = sqrt(var(avg_sum_rate_monte_vec));
    % 90 percent confidence interval calculation
    ebars(epsilon_vec_idx) = 1.658*std_dev_sum_rate_monte/sqrt(num_monte_trials);
end

dataset = [epsilon_vec' avg_sum_rate_epsilon' ebars];

csvwrite(filepath,dataset);
