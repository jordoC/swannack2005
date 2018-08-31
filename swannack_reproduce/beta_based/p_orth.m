function p_orth_lbnd = p_orth(theta, group_size, num_dim)
    %Argument Validation
    classes = {'double'};
    group_attr = {'<=',num_dim};
    funcName = 'p_orth';

    validateattributes(group_size,classes,group_attr,funcName)
    l = group_size;
    frac_area = beta_inc_reg(theta, 2*num_dim);
    p_orth_lbnd = (max((1-(l-1)*frac_area),0))^(l-1);
end
