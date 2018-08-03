%> @file Station.m
%> @brief Model of an STA for use in a WLAN
% ======================================================================
%> @brief  TODO
%
%> TODO
% ======================================================================
classdef Station
    properties
        %> Hashed value of location, should be unique ID string
        id;         
        %> Meters: (x,y)
        location;
        %> Associated access point 
        assocAp;
        %> Channel description for associated AP 
        channel;
        %> Number of antennas
        numAnts;
    end
    methods
        % ======================================================================
        %> @brief Class constructor
        %>
        %> Builds up Station class
        %>
        %> @param location of the AP in the plane
        %>
        %> @return initialized instance of the class
        % ======================================================================
        function obj = Station(location)
            addpath ../DataHash
            obj.numAnts = 1;%Assume only one antenna
            obj.location = location;
            obj.channel= [];
            obj.id = DataHash(location);
        end
        % ======================================================================
        %> @brief Define the Rayleigh-fading channel for the STA
        %>
        %> @param obj instance of the Station class.
        %> @param stdDev standard deviation of the channel fading
        %> @param staApDist distance between the STA and AP 
        %> @param numApAnts number of AP antennas 
        %>
        %> @return modified instance of the class
        % ======================================================================
        function obj = setChannel(obj, stdDev, staApDist, numApAnts)
            %This structure assumes that channels for a given STA are uncorrelated
            %   Such an assumption might be justified by making sure antennas are at
            %   least half a wavelength away from each other on the AP.
            for idx = 1:numApAnts
                obj.channel = [obj.channel Channel(stdDev/sqrt(numApAnts), staApDist)];
            end
        end
        % ======================================================================
        %> @brief Associate STA to AP
        %>
        %> @param ap the AP to associate with
        %>
        %> @return modified instance of the class
        % ======================================================================
        function obj = setAssocAp(ap)
            obj.assocAp = ap;
        end
        % ======================================================================
        %> @brief Tell if two STAs are the same
        %>
        %> @param first STA
        %> @param second STA
        %>
        %> @return logical value
        % ======================================================================
        function isSame = eq(sta1, sta2)
            isSame = strcmp(sta1.id, sta2.id);
        end
        % ======================================================================
        %> @brief Tell if two STAs are the same
        %>
        %> @param first STA
        %> @param second STA
        %>
        %> @return logical value
        % ======================================================================
        function isNotSame = ne(sta1, sta2)
            isNotSame = ~strcmp(sta1.id, sta2.id);
        end
        %function stas = associateSta(Sta)
        %    stas = [A]
        %end
    end
end
