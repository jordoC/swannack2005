%Main file for AP-STA system model
%   
%   Conceptual Notes:
%       -See inline 
%       -The expected number of users is given by length*length*lambda 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath ../2d_pt_proc;
addpath ../ap;
addpath ../sta;

ap_loc = [0,0];     %Meters
ap_tx_power = 1;    %Watts

sta_density = 1;
wlan_length = 10;   %Meters, area is square of this value
a = AssociationPoint(ap_loc, ap_tx_power);


sta_locs = ppp_2d(sta_density, wlan_length);
num_stas = length(sta_locs(:,1));
stas = [];
for sta_loc_idx = 1:num_stas
    stas = [stas, Station(sta_locs(sta_loc_idx,:))];
end

a = a.setPotAssocStas(stas,10);
