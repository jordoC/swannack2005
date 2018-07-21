%Example usage:
%[t n e] = search_solve_p_not_empty(.1, 1, 2, 2, 4);
%plot(cos(t),n);
function [theta num_users err] = sym_solve_p_not_empty(delta, rho_min, rho_max, group_size, num_dim)
    thresh = delta/50;
    step = pi/32;
    theta = 0:step:(pi/2)-step;
    num_users =zeros(1,length(theta));
    err = ones(1,length(theta));
    for k = 1:length(theta)
        for n = 1:100
            p = p_not_empty(theta(k),rho_min, rho_max, group_size, num_dim, n);
            %err = abs(p-(1-delta));
            if abs(p-(1-delta)) < err(k)
                num_users(k) = n;
                err(k) = abs(p-(1-delta));
            else
                if err(k) ~= 1;
                    break;
                end
            end
        end
    end
end
