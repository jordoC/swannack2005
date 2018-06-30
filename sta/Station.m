%Station class
%   
%   Conceptual Notes:
%       -See inline 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef Station
    properties
        location;   %Meters: (x,y)
        assocAp;    %Associated AP
        potAssocAps;%List of potential APs to associate with
        channel;
    end
    methods
        function obj = Station(location)
            obj.location = location;
            obj.potAssocAps= [];
        end
        function obj = setChannel(obj, stdDev,staApDist)
            addpath ../chan
            obj.channel = Channel(stdDev, staApDist);
        end
        %function stas = associateSta(Sta)
        %    stas = [A]
        %end
    end
end
