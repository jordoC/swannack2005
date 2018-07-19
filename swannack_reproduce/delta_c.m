function [lBound uBound] = delta_c(theta, num_dim)
    psi = psi_m(num_dim-2)
    %Condition for lower bound:
    s = pi/2*psi;
    beta = num_dim-1;
    lBound = c_func(theta, s ,beta);

    %Condition for upper bound:
    beta = (s-1)*s/pi;
    uBound = c_func(theta, s ,beta);

end
