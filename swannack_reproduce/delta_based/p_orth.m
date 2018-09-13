function p_orth_lbnd = p_orth(theta, group_size, num_dim)
    %Argument Validation
    classes = {'double'};
    group_attr = {'<=',num_dim};
    funcName = 'p_orth';

    validateattributes(group_size,classes,group_attr,funcName)
    l = group_size;
    [delta_lbnd delta_ubnd] = delta_c(theta, 2*num_dim);
    p_orth_lbnd = ((1-*delta_lbnd))^(l-1);
end
