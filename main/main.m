%Main file for AP-STA system model
%   
%   Conceptual Notes:
%       -See inline 
%       -The expected number of users is given by length*length*lambda 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath ../2d_pt_proc;
addpath ../;
addpath ../@Station;

ap_loc = [5,5];     %Meters
num_ap_ants = 4;
ap_tx_power = 1;    %Watts

sta_density = 1;
wlan_length = 10;   %Meters, area is square of this value
a = AccessPoint(ap_loc, ap_tx_power, 4);


sta_locs = ppp_2d(sta_density, wlan_length);
num_stas = length(sta_locs(:,1));
stas = [];
for sta_loc_idx = 1:num_stas
    stas = [stas, Station(sta_locs(sta_loc_idx,:))];
end

a = a.setPotAssocStas(stas,5);

%Plotting for verification
%plot(1);
%clf;
%hold on;
%
%scatter(sta_locs(:,1),sta_locs(:,2));
%viscircles([5 5],5);
