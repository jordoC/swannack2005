%syms a b c x
%eqn = a*x^2 + b*x + c == 0;
%solx = solve(eqn, x)
function [theta epsilon rho]= sym_solve_p_not_empty(delta, group_size, num_dim, num_users)
    %n = num_users;
    l = group_size;
    m = num_dim;

    p_s = p_shell();
    rsum = 0;
    for j = l:n
        comb = nchoosek(n,j);
        %prob = (p_s*(exp(-1*E_func(p_orth_lbnd,l))))^j;
        prob = (p_s)^(j)*(1-p_s)^(n-j);
        rsum = rsum + comb*prob;
    end
    prob_shell_l = rsum


    syms p_orth_lbnd_tmp

    %E_arg1 = 2*p_orth_lbnd^(2)/l;
    %if(E_func(p_orth_lbnd,l) == E_arg1)
    %    c1 = exp(2*p_orth_lbnd(l-1)/l);
    %else
    %    c1 = 1;
    %end

    c1 = exp(2*p_orth_lbnd_tmp(l-1)/l);

    %tmp = p_s*exp(-1*E_func(p_orth_lbnd,l));
    p_not_empty_lbnd = prob_shell_l - c1*(p_orth_lbnd_tmp+ (1-p_s))^(n);
    p_orth_lbnd_tmp_sol = solve(p_not_empty_lbnd(p_orth_lbnd_tmp) == 1-delta,p_orth_lbnd_tmp)
end

