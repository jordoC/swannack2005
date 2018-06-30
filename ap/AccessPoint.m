%Access Point Class
%   
%   Conceptual Notes:
%       -See inline 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef AccessPoint 
    properties
        txPower;    %Watts
        location;   %Meters: (x,y)
        assocStas;  %List of associated STAs
        potAssocStas;  %List of potential STAs to associate with
        commonStas; %List of AP, STA pairs that represent other APs that can associate with STAs
         
    end
    methods
        function obj = AccessPoint(location,txPower)
            obj.txPower = txPower;
            obj.location = location;
            obj.potAssocStas = [];
            obj.commonStas = [];
        end
        function obj = setPotAssocStas(obj, allStas, radius)
            addpath ../util
            chan_std_dev = 1;
            num_stas = length(allStas);
            for sta_idx = 1:num_stas
                sta_loc = allStas(sta_idx).location;
                x = abs(sta_loc(1) - obj.location(1));
                y = abs(sta_loc(2) - obj.location(2));
                sta_ap_dist = sqrt(x^(2)+y^(2));
                if (pythag_ck(x,y,radius))
                    sta =  allStas(sta_idx);
                    sta = sta.setChannel(chan_std_dev, sta_ap_dist);
                    obj.potAssocStas = [obj.potAssocStas, sta];
                %DBG:
                %else
                %    sta_loc
                end
            end
        end
    end
end
