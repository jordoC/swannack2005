function exp_arg = E_func(prob, group_size)
    l = group_size;
    p = prob;
    arg1 = 2*p^(2)/l;
    arg2 = 8*p/(25*l)*(((l-1)/(exp(1)*l))^(l-1));
    exp_arg = max(arg1,arg2);
end
