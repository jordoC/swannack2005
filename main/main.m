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

%SNR, SIR requirements, group size, number of STAs to consider
rho_min = 1;
rho_max = 2;
epsilon = .2; %TODO: seems to be off by a factor of 5
gs = 3;%num_ap_ants;
numStas = 8:2:42;%TODO: change back to ~30 for 90% reproduction of gs=2

p_existence = zeros(1,length(numStas))
k = 1;
for numSta = numStas
    existence_ctr = 0;
    %Parameters of the PPP: 
    % we expect the number of STAs to be roughly equivalent to densitly*length^2
    wlan_length = 10;   %Meters, area is square of this value
    sta_density = numSta/(wlan_length^2); 
        
    %Create AP object, PPP representing location of STAs, and register STAs with AP
    a = AccessPoint(ap_loc, ap_tx_power, num_ap_ants);
    %Check that minimum density is met.
    while 1
        [sta_locs density] = ppp_2d(sta_density, wlan_length);
        if (density*wlan_length^2)>= numSta
            break;
        end
    end
    num_stas = length(sta_locs(:,1));
    stas = [];
    for sta_loc_idx = 1:num_stas
        stas = [stas, Station(sta_locs(sta_loc_idx,:))];
    end
    for trial_idx = 1:existence_trial_len
        %TODO: move this back to the section dealing with APs, it's just here to speed up sim times. 
        a = a.setPotAssocStas(stas,wlan_length);
        a = a.pollStaSusExistence(epsilon,rho_min,rho_max, gs, numSta);
        if(length(a.susPollSets)>0)
            existence_ctr = existence_ctr + 1;
        end
    end
    p_existence(k) = existence_ctr/existence_trial_len
    k = k+1;
end

plot(numStas,p_existence)
