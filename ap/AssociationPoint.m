classdef AssociationPoint 
    properties
        txPower;    %Watts
        location;   %Meters: (x,y)
        assocStas;  %List of associated STAs
        potAssocStas;  %List of potential STAs to associate with
        commonStas; %List of AP, STA pairs that represent other APs that can associate with STAs
         
    end
    methods
        function obj = AssociationPoint(location,txPower)
            obj.txPower = txPower;
            obj.location = location;
            obj.potAssocStas = [];
            obj.commonStas = [];
        end
        function obj = setPotAssocStas(obj, allStas, radius)
            addpath ../util
            num_stas = length(allStas);
            for sta_idx = 1:num_stas
                sta_loc = allStas(sta_idx).location;
                x = abs(sta_loc(1) - obj.location(1));
                y = abs(sta_loc(2) - obj.location(2));
                if ~(pythag_ck(x,y,radius))
                    obj.potAssocStas = [obj.potAssocStas, allStas(sta_idx)]
                end
            end
        end
    end
end
