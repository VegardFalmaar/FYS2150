function [delta_nu, B] = zeeman(d_1, d_2, d_3)
mu_B = 9.274E-24;   % J/T
t = 3E-3;           % m
c = 3E8;            % m/s
h = 6.62606957E-34; % J s

delta_nu = c/2/t * (d_2^2 - d_1^2)/(d_3^2 - d_1^2);
B = delta_nu*h/2/mu_B;
end

