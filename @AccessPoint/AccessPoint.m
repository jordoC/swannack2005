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
        %> Cell array that represents the seim-orthogonal STAs to any
        %> given STA in the WLAN. The columns of th array represent the 
        %> reference STA. Each column contains a list of @Station objects
        %> that are semi-orthogonal to the reference STA
        susSets; 
        %> Cell array that contains cell array of @Station objects.
        %> The cell arrays contained in the larger cell array represent SUS
        %> groups.
        susGroups; 
        %> Cell array that represents the semi-orthogonal STAs for a subset 
        %> of the WLAN. The columns of th array represent the 
        %> reference STA. Each column contains a list of @Station objects
        %> that are semi-orthogonal to the reference STA
        susPollSets;
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
        %> @brief Generate SUS sets that belong to each STA.
        %>
        %> @param orthogonality threshold (epsilon Swannack, 2005)
        %> @param lower bound on the channel L2 norm (rho- Swannack 2005)
        %> @param upper bound on the channel L2 norm (rho+ Swannack 2005)
        %>
        %> @return modified instance of the class
        % ======================================================================
        obj = genStaSusSets(obj, orthThresh, snrLower, snrUpper)
        % ======================================================================
        %> @brief Poll STAs to simulate probability of existence
        %>
        %> @param orthogonality threshold (epsilon Swannack, 2005)
        %> @param lower bound on the channel L2 norm (rho- Swannack 2005)
        %> @param upper bound on the channel L2 norm (rho+ Swannack 2005)
        %> @param SUS group size
        %> @param number of STAs to consider
        %>
        %> @return modified instance of the class
        % ======================================================================
        obj = pollStaSusSetExistence(obj, orthThresh, snrLower, snrUpper, groupSize, numStas)
        % ======================================================================
        %> @brief Generate the SUS groups
        %>
        %> @param maximum number of STAs in the SUS group
        %>
        %> @return modified instance of the class
        % ======================================================================
        obj = genStaSusGroups(obj, maxGroupSize)
        % ======================================================================
        %> @brief Set SUS groups
        %>
        %> @param SUS groups`
        %>
        %> @return modified instance of the class
        % ======================================================================
        function obj = setStaSusGroups(obj, susGroups)
            obj.susGroups = susGroups;
        end
    end
end
