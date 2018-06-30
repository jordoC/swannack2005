%Station class
%   
%   Conceptual Notes:
%       -See inline 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef Station
    properties
        location;   %Meters: (x,y)
        assocAp;    %Associated AP
        channel;
        numAnts;    %Number of antennas
    end
    methods
        function obj = Station(location)
            obj.numAnts = 1;%Assume only one antenna
            obj.location = location;
            obj.channel= [];
        end
        function obj = setChannel(obj, stdDev, staApDist, numApAnts)

            %This structure assumes that channels for a given STA are uncorrelated
            %   Such an assumption might be justified by making sure antennas are at
            %   least half a wavelength away from each other on the AP.
            for idx = 1:numApAnts
                obj.channel = [obj.channel Channel(stdDev, staApDist)];
            end
        end
        function obj = setAssocAp(ap)
            obj.assocAp = ap;
        end
        %function stas = associateSta(Sta)
        %    stas = [A]
        %end
    end
end
