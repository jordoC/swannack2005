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
ap_tx_power = 1;    %Watts %TODO: Depricated


%Number of trials to run to randomly select channels from
existence_trial_len = 50;
existence_ctr = 0;

%SNR, SIR requirements, group size, number of STAs to consider
rho_min = 1;
rho_max = 2;
epsilon = .24; %TODO: seems to be off by a factor of 5
gs = 2;%num_ap_ants;
numStas = 13;%TODO: change back to ~30 for 90% reproduction of gs=2

%Parameters of the PPP: 
% we expect the number of STAs to be roughly equivalent to densitly*length^2
wlan_length = 10;   %Meters, area is square of this value
sta_density = numStas/(wlan_length^2); 


for trial_idx = 1:existence_trial_len
    %Create AP object, PPP representing location of STAs, and register STAs with AP
    a = AccessPoint(ap_loc, ap_tx_power, num_ap_ants);
    %Check that minimum density is met.
    while 1
        [sta_locs density] = ppp_2d(sta_density, wlan_length);
        if (density*wlan_length^2)>= numStas
            break;
        end
    end
    num_stas = length(sta_locs(:,1));
    stas = [];
    for sta_loc_idx = 1:num_stas
        stas = [stas, Station(sta_locs(sta_loc_idx,:))];
    end
    %TODO: move this back to the section dealing with APs, it's just here to speed up sim times. 
    a = a.setPotAssocStas(stas,wlan_length);
    a = a.pollStaSusExistence(epsilon,rho_min,rho_max, gs, numStas);
    a = a.genStaSusGroups(gs);

    %Check if the SUS groups have a group that meets the specified group size
    % if it does, then an SUS gorup exists
    for group_idx = 1:length(a.susGroups)
        gs_len = length(a.susGroups{group_idx});
        if gs_len >= gs
            existence_ctr = existence_ctr + 1;
            break;
        end
    end
end
pr_existence = existence_ctr/existence_trial_len
