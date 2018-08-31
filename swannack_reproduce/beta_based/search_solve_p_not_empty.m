%Example usage:
%[t n e] = search_solve_p_not_empty(.1, 1, 2, 2, 4);
%plot(cos(t),n);
function [theta num_users err] = search_solve_p_not_empty(delta, rho_min, rho_max, group_size, num_dim)
    thresh = delta/50;
    step = pi/32;
    theta = 0:step:(pi/2)-step;
    num_users =zeros(1,length(theta));
    trial_len = 100;
    err_mat = ones(length(theta),trial_len);
    err = ones(length(theta),1);
    for k = 1:length(theta)
        for n = 1:trial_len
            p = p_not_empty(theta(k),rho_min, rho_max, group_size, num_dim, n);
            %err = abs(p-(1-delta));
            err_mat(k,n) = abs(p-(1-delta));
        end
        [err(k) num_users(k)] = min(err_mat(k,:));
    end
end
