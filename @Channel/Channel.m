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
            rvLen = 100;
            obj.rvLen = rvLen;
            obj.stdDev = stdDev;
            obj.plExp = plExp;
            pl = staApDist^(-1*plExp);
            
            inphase = (stdDev/sqrt(2))*randn(rvLen,1);
            quadrature = i*(stdDev/sqrt(2))*randn(rvLen,1);
            
            %TODO: Consider the impact of path loss-- does not seem to be in Swannack's work 
            %obj.h = (inphase+quadrature)*sqrt(pl);
            obj.h = (inphase+quadrature);
        end
        %function obj = test(obj, tmp)
        %    obj.tmp = tmp;
        %end
    end
end
