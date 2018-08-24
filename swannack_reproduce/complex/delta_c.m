function [lBound uBound] = delta_c(theta, num_dim)
    %Argument Validation
    classes = {'double'};
    theta_attr = {'>=',0,'<=',pi/2};
    dim_attr = {'>=',2};
    funcName = 'delta_c';

    validateattributes(theta,classes,theta_attr,funcName)
    validateattributes(num_dim,classes,dim_attr,funcName)

    psi = psi_m(num_dim-2);
    %Condition for lower bound:
    s = pi/2*psi;
    %beta = 40;
    beta = num_dim-1;
    lBound = c_func(theta, s ,beta);

    %Condition for upper bound:
    beta = (s-1)*s/pi;
    uBound = c_func(theta, s ,beta);

end
