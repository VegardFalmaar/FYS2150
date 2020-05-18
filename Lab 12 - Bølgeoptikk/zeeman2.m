function [delta_nu, mu_B] = zeeman2(d_1, d_2, d_3, B)
t = 3E-3;           % m
c = 3E8;            % m/s
h = 6.62606957E-34; % J s

delta_nu = c/2/t * (d_2^2 - d_1^2)/(d_3^2 - d_1^2);
mu_B = delta_nu*h/2/B;
end

