%Channel model
%   
%   Conceptual Notes:
%       -See inline 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef Template
    properties
        tmp;
    end
    methods
        function obj = Template(tmp)
            obj.tmp= tmp;
        end
        function obj = test(obj, tmp)
            obj.tmp = tmp;
        end
    end
end

%rv_len = 10000;
%std_dev = 1;
%ap_sta_dist = 10;
%pl_exp = 2;
%
%pl = ap_sta_dist^(-pl_exp);
%
%inphase = (std_dev/2)*randn(rv_len,1);
%quadrature = i*(std_dev/2)*randn(rv_len,1);
%
%h = (inphase+quadrature)*sqrt(pl);

%Magnitude should be a Rayleigh distribution
%hist(abs(h),20)
%Phase should be uniform
%hist(atan(imag(h)./real(h)),20)
