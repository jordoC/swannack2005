classdef Station
    properties
        location;   %Meters: (x,y)
        assocAp;    %Associated AP
        potAssocAps;%List of potential APs to associate with
    end
    methods
        function obj = Station(location)
            obj.location = location;
            obj.potAssocAps= [];
        end
        %function stas = associateSta(Sta)
        %    stas = [A]
        %end
    end
end
