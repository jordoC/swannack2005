%Rayleigh-fading channel model with exponential path loss
%   
%   Conceptual Notes:
%       -See inline 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef Channel
    properties
        stdDev;
        plExp;
        rvLen;
        h;
    end
    methods
        function obj = Channel(stdDev, staApDist)
            plExp = 2.4;
            rvLen = 1000;
            obj.rvLen
            obj.stdDev = stdDev;
            obj.plExp = plExp;
            pl = staApDist^(-plExp);
            
            inphase = (stdDev/2)*randn(rvLen,1);
            quadrature = i*(stdDev/2)*randn(rvLen,1);
            
            obj.h = (inphase+quadrature)*sqrt(pl);
        end
        %function obj = test(obj, tmp)
        %    obj.tmp = tmp;
        %end
    end
end
