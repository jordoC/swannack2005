addpath ../swannack_reproduce/

phi = 0:pi/64:pi/2;
z = sin(phi).^2;
I = betainc(z,(2*N-1)/2,.5)/beta((2*N-1)/2,.5);

for k = 1:length(phi)
  %  [lBound(k) uBound(k)] = arrayfun(@(delta_c) phi(k), 2*N)
    [lBound(k) uBound(k)] = delta_c( phi(k), 2*N);
end
phi_norm = phi/pi;
mat = [phi_norm' lBound' uBound' I'];
csvwrite('figs/delta_beta_comp/delta_beta.csv', mat);
