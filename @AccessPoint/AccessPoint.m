%> @file AccessPoint.m
%> @brief Model of an AP for use in a WLAN
% ======================================================================
%> @brief  TODO
%
%> TODO
% ======================================================================
classdef AccessPoint 
    properties
        %> Watts (total transmit power)
        txPower;    
        %> Number of antennas
        numAnts;    
        %> Beamforming vector
        bfVec; 
        %>  Meters: (x,y)
        location;  
        %> List of associated STAs
        assocStas;  
        %> List of potential STAs to associate with
        potAssocStas;  
        %> List of AP, STA pairs that represent other APs that can associate with STAs
        commonStas; 
        %> Matrix representing semi-orthogonal user selection sets
        susGroups; 
         
    end
    methods
        % ======================================================================
        %> @brief Class constructor
        %>
        %> Builds up AP class
        %>
        %> @param location of the AP in the plane
        %> @param transmit power in watts
        %> @param number of antennas the AP has
        %>
        %> @return initialized instance of the class
        % ======================================================================
        function obj = AccessPoint(location, txPower, numAnts)
            obj.txPower = txPower;
            obj.location = location;
            obj.numAnts= numAnts;
            obj.bfVec = ones(numAnts,1)';%TODO: fill in beamforming vectors.
            obj.potAssocStas = [];
            obj.commonStas = [];
        end
        % ======================================================================
        %> @brief Find the set of candidate STAs the AP can associate with
        %>
        %> @param obj instance of the classDocumentationExample class.
        %> @param all the STAs that exist in the plane
        %> @param radius in meters  the AP is able to reach
        %>
        %> @return modified instance of the class
        % ======================================================================
        obj = setPotAssocStas(obj, allStas, radius)
        % ======================================================================
        %> @brief Generate SUS groups that belong to each STA
        %>
        %> @param orthogonality threshold (epsilon Swannack, 2005)
        %> @param lower bound on the channel L2 norm (rho- Swannack 2005)
        %> @param upper bound on the channel L2 norm (rho+ Swannack 2005)
        %>
        %> @return modified instance of the class
        % ======================================================================
        obj = genStaSusSets(obj, orthThresh, snrLower, snrUpper)
        % ======================================================================
        %> @brief Form SUS sets into trees
        %>
        %> @param orthogonality threshold (epsilon Swannack, 2005)
        %> @param lower bound on the channel L2 norm (rho- Swannack 2005)
        %> @param upper bound on the channel L2 norm (rho+ Swannack 2005)
        %>
        %> @return modified instance of the class
        % ======================================================================
        obj = genStaSusTrees(obj, orthThresh, snrLower, snrUpper)
    end
end
