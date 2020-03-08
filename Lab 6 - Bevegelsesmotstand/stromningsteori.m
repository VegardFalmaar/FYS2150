data = importdata('terminal_hastighet_rdata.dat');
radii = data(:, 1);
vel1 = data(:, 2);
vel2 = data(:, 3);
vel3 = data(:, 4);

% x = log(radii);
% y = log(vel1);
% 
% fit = fitlm(x, y)

% hold on
% plot(x, log(vel1), 'o');
% plot(x, log(vel2), 'o');
% plot(x, log(vel3), 'o');
% legend('vel_1', 'vel_2', 'vel_3');
% grid();
% hold off

diff_rho = 7019; % kg/m^3
mu = 0.190; % kg/(m s)

volumes = 4/3*pi*radii.^3;
g = 9.81;
F_G = volumes.*diff_rho*g; % gravity minus buoyancy

Cs_s = F_G./(mu*radii.*vel1);
Cs = mean(Cs_s)
delta_Cs = std(Cs_s)