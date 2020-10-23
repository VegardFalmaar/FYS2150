% Test of de_mag_factor function
% Sphere
f = 1;
[D_parallel, D_normal] = de_mag_factor(f)

% Ellipse
f = 1.75;
[D_parallel, D_normal] = de_mag_factor(f)

a_parallel = 20;
a_normal = 2;
f = a_parallel/a_normal;
[D_parallel, D_normal] = de_mag_factor(f)

load('data/faraday.mat');
L = 30E-3;
s_L = 1E-3;
fit = fitlm(B, theta);
A = fit.Coefficients.Estimate(2);
s_A = fit.Coefficients.SE(2);
V = A/L
s_V = V*sqrt((s_L/L)^2 + (s_A/A)^2)
