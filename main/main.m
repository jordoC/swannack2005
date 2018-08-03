%Main file for AP-STA system model
%   
%   Conceptual Notes:
%       -See inline 
%       -The expected number of users is given by length*length*lambda 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath ../2d_pt_proc;
addpath ../;

ap_loc = [5,5];     %Meters
num_ap_ants = 4;
ap_tx_power = 1;    %Watts

sta_density = .5;
wlan_length = 10;   %Meters, area is square of this value

a = AccessPoint(ap_loc, ap_tx_power, num_ap_ants);
sta_locs = ppp_2d(sta_density, wlan_length);
num_stas = length(sta_locs(:,1));
stas = [];
for sta_loc_idx = 1:num_stas
    stas = [stas, Station(sta_locs(sta_loc_idx,:))];
end


existence_trial_len = 50;
existence_ctr = 0;

for trial_idx = 1:existence_trial_len
    %TODO: move this back to the section dealing with APs, it's just here to speed up sim times. 
    a = a.setPotAssocStas(stas,wlan_length);

    rho_min = 1;
    rho_max = 2;
    epsilon = .24; %TODO: seems to be off by a factor of 5
    gs = 2;%num_ap_ants;
    numStas = 13;%TODO: change back to ~30 for 90% reproduction of gs=2

    a = a.pollStaSusExistence(epsilon,rho_min,rho_max, gs, numStas);

    a = a.genStaSusGroups(gs);

    for group_idx = 1:length(a.susGroups)
        gs_len = length(a.susGroups{group_idx});
        if gs_len >= gs
            existence_ctr = existence_ctr + 1;
            break;
        end
    end
end
pr_existence = existence_ctr/existence_trial_len

%Plotting for verification
%plot(1);
%clf;
%hold on;
%
%scatter(sta_locs(:,1),sta_locs(:,2));
%viscircles([5 5],5);
